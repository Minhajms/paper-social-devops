terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "~> 1.45.0"
    }
  }
}

provider "ibm" {
  region = var.ibm_region
}

resource "ibm_is_vpc" "vpc" {
  name = "${var.project_name}-vpc"
  tags = var.tags
}

resource "ibm_is_subnet" "subnet" {
  name                     = "${var.project_name}-subnet"
  vpc                      = ibm_is_vpc.vpc.id
  zone                     = "${var.ibm_region}-1"
  total_ipv4_address_count = 256
}

resource "ibm_is_security_group" "sg" {
  name = "${var.project_name}-sg"
  vpc  = ibm_is_vpc.vpc.id
}

resource "ibm_is_security_group_rule" "sg_rule_ssh" {
  group     = ibm_is_security_group.sg.id
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 22
    port_max = 22
  }
}

resource "ibm_is_security_group_rule" "sg_rule_http" {
  group     = ibm_is_security_group.sg.id
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 80
    port_max = 80
  }
}

resource "ibm_is_security_group_rule" "sg_rule_https" {
  group     = ibm_is_security_group.sg.id
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 443
    port_max = 443
  }
}

resource "ibm_is_security_group_rule" "sg_rule_outbound" {
  group     = ibm_is_security_group.sg.id
  direction = "outbound"
  remote    = "0.0.0.0/0"
}

data "ibm_is_image" "ubuntu" {
  name = "ibm-ubuntu-20-04-minimal-amd64-2"
}

resource "ibm_is_ssh_key" "ssh_key" {
  name       = "${var.project_name}-key"
  public_key = var.ssh_public_key  # Using the variable directly instead of file()
}

resource "ibm_is_instance" "instance" {
  name    = "${var.project_name}-server"
  vpc     = ibm_is_vpc.vpc.id
  zone    = "${var.ibm_region}-1"
  keys    = [ibm_is_ssh_key.ssh_key.id]
  image   = data.ibm_is_image.ubuntu.id
  profile = var.instance_profile

  primary_network_interface {
    subnet          = ibm_is_subnet.subnet.id
    security_groups = [ibm_is_security_group.sg.id]
  }

  # Fixed to avoid self-reference
  user_data = <<-EOF
    #!/bin/bash
    echo "CLOUD_PROVIDER=IBM Cloud" >> /etc/environment
    echo "INSTANCE_ID=ibm-instance" >> /etc/environment
    echo "REGION=${var.ibm_region}" >> /etc/environment
  EOF

  tags = var.tags
}

resource "ibm_is_floating_ip" "fip" {
  name   = "${var.project_name}-fip"
  target = ibm_is_instance.instance.primary_network_interface[0].id
}
