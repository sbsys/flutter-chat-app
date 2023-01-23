const ENV = {
  PORT: process.env["PORT"],
  DB_USER: process.env["DB_USER"],
  DB_PASSWORD: process.env["DB_PASSWORD"],
  DB_CLUSTER: process.env["DB_CLUSTER"],
  DB_NAME: process.env["DB_NAME"],
  JWT_KEY: process.env["JWT_KEY"],
};

module.exports = { ENV };
