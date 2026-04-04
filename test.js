const os = require("os");
const cluster = require("cluster");
const express = require("express");

require("dotenv").config();

if (cluster.isPrimary) {
  const cpus = os.cpus().length;

  for (let i = 1; i <= cpus; i++) {
    cluster.fork()
  }
}
else {
  const app = express();

  app.listen(3000, () => {
    console.log(process.pid)
  })
}
