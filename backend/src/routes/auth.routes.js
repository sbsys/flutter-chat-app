const { Router } = require("express");
const { check } = require("express-validator");
const { signUp } = require("../controllers/auth.controller");

const router = Router();

router.post(
  "/sign-up",
  [check("name", "'name' is required").not().isEmpty()],
  signUp
);

module.exports = { authRoutes: router };
