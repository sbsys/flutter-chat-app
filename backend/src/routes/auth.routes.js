const { Router } = require("express");
const { check } = require("express-validator");
const {
  signUp,
  signIn,
  signInByToken,
} = require("../controllers/auth.controller");
const { bodyValidator } = require("../middlewares/body-validator.middleware");
const { tokenValidator } = require("../middlewares/token-validator.middleware");

const router = Router();

router.post(
  "/auth/sign-up",
  [
    check("name", "'name' is required").not().isEmpty(),
    check("email", "'email' is required").isEmail(),
    check("password", "'password' is required").not().isEmpty().isLength({
      min: 8,
      max: 16,
    }),
    bodyValidator,
  ],
  signUp
);

router.post(
  "/auth/sign-in",
  [
    check("email", "'email' is required").isEmail(),
    check("password", "'password' is required").not().isEmpty(),
    bodyValidator,
  ],
  signIn
);

router.get("/auth/sign-in", [tokenValidator], signInByToken);

module.exports = { authRoutes: router };
