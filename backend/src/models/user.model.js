const { Schema, model } = require("mongoose");

const UserSchema = new Schema({
  name: {
    type: String,
    require: true,
  },
  email: {
    type: String,
    require: true,
    unique: true,
  },
  password: {
    type: String,
    require: true,
  },
  online: {
    type: Boolean,
    default: false,
  },
});

UserSchema.method("toJSON", function () {
  const { __v, _id, password, ...rest } = this.toObject();

  return { ...rest, id: _id };
});

module.exports = { User: model("User", UserSchema) };
