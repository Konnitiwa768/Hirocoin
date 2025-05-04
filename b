const jwt = require("jsonwebtoken");
const SECRET = "your_secret_key";

module.exports = function (req, res, next) {
  const auth = req.headers.authorization;
  if (!auth) return res.sendStatus(401);
  try {
    const decoded = jwt.verify(auth.split(" ")[1], SECRET);
    req.user = decoded;
    next();
  } catch (err) {
    res.sendStatus(403);
  }
};
