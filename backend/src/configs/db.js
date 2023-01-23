const mongoose = require("mongoose");
const { ENV } = require("./constants");

const connection = async () => {
  try {
    mongoose.set("strictQuery", false);

    const uri = `mongodb+srv://${ENV.DB_USER}:${ENV.DB_PASSWORD}@${ENV.DB_CLUSTER}/${ENV.DB_NAME}?retryWrites=true&w=majority`;

    const connection = await mongoose.connect(uri);

    console.log("connected to mongo atlas");

    return connection;
  } catch (err) {
    console.error(err);
    throw new Error("No mongo atlas connection", err);
  }
};

module.exports = {
  connection,
};
