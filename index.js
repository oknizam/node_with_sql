const express = require("express");
const orderRoute = require("./routes/order.route");
const { logs } = require("./middleware/logsMiddleWare");
const app = express();

const PORT = 3000;

app.use(express.json());
app.use(logs);

app.use("/orders", orderRoute);

app.get("/dummyData", (req, res) => {
  const response = {
    name: "Nizam",
    id: 123,
    email: "oknizam@mail.com"
  }

  return res.setHeader("Access-Control-Allow-Origin", "http://localhost:5000/").json(response);
  return res.setHeader("Access-Control-Allow-Origin", "*").json(response);
})

app.patch("/dummyData", (req, res) => {
  const response = {
    name: "Nizam New",
    id: 123,
    email: "oknizam@mail.com"
  }

  // return res.setHeader("Access-Control-Allow-Origin", "http://localhost:5000/").json(response);
  return res.setHeader("Access-Control-Allow-Origin", "*").json(response);
})


app.listen(PORT, () => {
  console.log(`listening to port ${PORT}`)
})