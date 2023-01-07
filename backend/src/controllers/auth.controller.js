const { response, request } = require("express");
const { validationResult } = require("express-validator");

const signUp = async (req = request, res = response) => {
  const errors = validationResult(req);

  if (!errors.isEmpty())
    return res
      .status(400)
      .json({ message: errors.errors[0].msg, status: false });

  res
    .status(201)
    .json({ message: "User created from controller", status: true });
};

module.exports = { signUp };
