
const logs = (req, res, next) => {
  console.log("loggin time", new Date());
  next();
}

module.exports = { logs }