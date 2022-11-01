module.exports = app => {
    const cliente = require("../controllers/cliente.controller.js");
    var router = require("express").Router();
    router.post("/", cliente.create);
    //router.get("/", "hola");
    //router.get("/:id", venta.findOne);
    app.use('/api/v1/cliente', router);
};