const jwt = require("jsonwebtoken");
const { ENV } = require("../configs/constants");

const generateJWT = (id) =>
  new Promise((resolve, reject) => {
    const payload = { id };

    jwt.sign(
      payload,
      ENV.JWT_KEY,
      {
        expiresIn: "12h",
      },
      (error, encoded) => {
        if (error) reject(error.message);
        resolve(encoded);
      }
    );
  });

module.exports = { generateJWT };
