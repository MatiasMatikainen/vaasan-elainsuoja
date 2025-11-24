
const express = require("express");
const cors = require("cors");
const routes = require("./routes");

const app = express();
app.use(cors());
app.use(express.json());
app.use("/", routes);

app.listen(4001, () => console.log("Server B running on port 4001"));
