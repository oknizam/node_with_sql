
const db = require("../dbConnection")

const getOrders = (_req, res) => {
  try {
    db.query("select * from orders", (err, data) => {
      if (err) {
        return res.status(500).json({ "message": "Bad request" });
      }
      if (data) {
        return res.status(200).json(data)
      }
    });

  }
  catch (err) {
    console.log("error in fetching order data", err);

  }
}

module.exports = {
  getOrders
}