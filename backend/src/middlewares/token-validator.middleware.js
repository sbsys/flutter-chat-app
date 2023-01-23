const { request, response } = require("express");
const jwt = require("jsonwebtoken");

const tokenValidator = (req = request, res = response, next) => {
  const token = req.header("x-token");

  if (!token)
    return res.status(401).json({ message: "No x-token valid", status: false });

  try {
    const { id } = jwt.verify(token, process.env.JWT_KEY);
    req.id = id;

    return next();
  } catch (error) {
    return res.status(401).json({ message: "No x-token valid", status: false });
  }
};

module.exports = { tokenValidator };
