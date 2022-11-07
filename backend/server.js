const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const app = express();

const db = require("./app/models");
db.sequelize.sync();

var corsOptions = {
    origin: "http://localhost:8080"
};

app.use(cors(corsOptions));

// parse requests of content-type - application/json
app.use(bodyParser.json());

// parse requests of content-type - application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));

// simple route
app.get("/", (req, res) => {
    res.json({ message: "Server correctamente iniciado - TP ARQ WEB" });
});

// set port, listen for requests
const PORT = process.env.PORT || 9090;

require("./app/routes/cliente.routes")(app);
require("./app/routes/parametro.routes")(app);
require("./app/routes/bolsa.routes")(app);
require("./app/routes/conceptos.routes")(app);
require("./app/routes/reglas.routes")(app);

app.listen(PORT, () => {
    console.log('Servidor corriendo en puerto 9090.');
});