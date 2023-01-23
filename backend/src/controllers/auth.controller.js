const { response, request } = require("express");
const bcrypt = require("bcryptjs");
const { User } = require("../models/user.model");
const { generateJWT } = require("../utils/jwt.util");

const signUp = async (req = request, res = response) => {
  const { name, email, password } = req.body;

  try {
    const alreadyEmail = await User.findOne({ email });

    if (alreadyEmail)
      return res
        .status(400)
        .json({ message: "User already exist", status: false });

    const user = new User({ name, email, password });

    user.password = bcrypt.hashSync(password, bcrypt.genSaltSync());

    await user.save();

    return res
      .status(201)
      .json({ message: "User sign up", status: true, data: user });
  } catch (error) {
    return res
      .status(400)
      .json({ message: "User sign up conflict", status: false });
  }
};

const signIn = async (req = request, res = response) => {
  const { email, password } = req.body;

  try {
    const user = await User.findOne({ email });

    if (!user || !bcrypt.compareSync(password, user.password))
      return res.status(404).json({ message: "User not found", status: false });

    const token = await generateJWT(user.id);

    return res.status(200).json({
      message: "User sign in",
      status: true,
      data: {
        user,
        token,
      },
    });
  } catch (error) {
    return res
      .status(400)
      .json({ message: "User sign in conflict", status: false });
  }
};

const signInByToken = async (req = request, res = response) => {
  const id = req.id;

  try {
    const user = await User.findById(id);

    if (!user)
      return res.status(404).json({ message: "User not found", status: false });

    const token = await generateJWT(user.id);

    return res.status(200).json({
      message: "User sign in by token",
      status: true,
      data: {
        user,
        token,
      },
    });
  } catch (error) {
    return res
      .status(400)
      .json({ message: "User sign in by token conflict", status: false });
  }
};

module.exports = { signUp, signIn, signInByToken };
