module.exports = app => {
    const regla = require("../controllers/regla.controller.js");
    var router = require("express").Router();

    //Crear
    router.post("/", regla.create);

    //Obtener
    router.get("/query/:valor", regla.ejecutar);
    router.get("/", regla.findAll);
    router.get("/:id", regla.findOne);

    //Modificar
    router.put("/", regla.update);

    //Eliminar
    router.delete("/:id", regla.destroy);

    //Se define la ruta de cliente
    app.use('/api/v1/reglas', router);
};