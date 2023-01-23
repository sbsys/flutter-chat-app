require("dotenv").config();
const path = require("path");
const http = require("http");
const express = require("express");
const cors = require("cors");
const socketIO = require("socket.io");
const { connection } = require("./configs/db");
const { authRoutes } = require("./routes/auth.routes");

// mongo db
connection();

// express app
const app = express();
app.use(cors());
app.use(express.json());

// node server
const server = http.createServer(app);

// socket
module.exports.io = socketIO(server);
require("./socket");

// public path
const publicPath = path.resolve(__dirname, "../", "public");
app.use(express.static(publicPath));

// rest api
app.use("/api", authRoutes);

// start server
const PORT = process.env["PORT"] ?? 3000;
server.listen(PORT, (err) => {
  if (err) throw new Error(err);

  console.log(`running on port: ${PORT}`);
});
