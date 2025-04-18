const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send(`
    <html>
      <head>
        <title>Paper.Social Demo</title>
        <style>
          body { font-family: Arial, sans-serif; margin: 40px; text-align: center; }
          h1 { color: #333; }
          .container { max-width: 800px; margin: 0 auto; }
          .cloud-info { padding: 10px; margin: 20px 0; background-color: #f0f0f0; border-radius: 5px; }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>Hello, Paper.Social!</h1>
          <p>Running on ${process.env.CLOUD_PROVIDER || 'unknown'} infrastructure</p>
          <div class="cloud-info">
            <p>Instance ID: ${process.env.INSTANCE_ID || 'unknown'}</p>
            <p>Region: ${process.env.REGION || 'unknown'}</p>
          </div>
        </div>
      </body>
    </html>
  `);
});

app.listen(port, () => {
  console.log(`Paper.Social app listening at http://localhost:${port}`);
});
