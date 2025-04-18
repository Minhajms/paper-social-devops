output "ibm_instance_id" {
  description = "ID of the IBM Cloud instance"
  value       = ibm_is_instance.instance.id
}

output "ibm_floating_ip" {
  description = "Floating IP address of the IBM Cloud instance"
  value       = ibm_is_floating_ip.fip.address
}
