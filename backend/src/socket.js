const { io } = require("./index");

io.on("connection", (client) => {
  console.log(`Client connected: ${client.id}`);

  client.on("disconnect", () => {
    console.log(`Client disconnected: ${client.id}`);
  });
});
