const express = require("express");
const orderRoute = require("./routes/order.route");
const { logs } = require("./middleware/logsMiddleWare");
const app = express();

const PORT = 3000;

app.use(express.json());
app.use(logs);

app.use("/orders", orderRoute);

app.listen(PORT, () => {
  console.log(`listening to port ${PORT}`)
})