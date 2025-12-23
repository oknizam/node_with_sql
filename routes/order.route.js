const { getOrders } = require("../controller/order.controller");

const Router = require("express").Router;

const orderRoute = Router();

orderRoute.get("/", getOrders);



module.exports = orderRoute;