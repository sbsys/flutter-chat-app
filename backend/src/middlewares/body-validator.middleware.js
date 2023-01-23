const { request, response } = require("express");
const { validationResult } = require("express-validator");

const bodyValidator = (req = request, res = response, next) => {
  const errors = validationResult(req);

  if (!errors.isEmpty())
    return res
      .status(400)
      .json({ message: errors.errors[0].msg, status: false });

  next();
};

module.exports = { bodyValidator };
