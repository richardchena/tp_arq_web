module.exports = app => {
    const cabecera = require("../controllers/cabecera.controller.js");
    var router = require("express").Router();

    //Crear
    router.post("/", cabecera.create);

    //Obtener
    router.get("/ejecutar/", cabecera.ejecutar);
    router.get("/", cabecera.findAll);
    router.get("/:id", cabecera.findOne);

    //Modificar
    router.put("/", cabecera.update);

    //Eliminar
    router.delete("/:id", cabecera.destroy);


    //Se define la ruta de cabecera
    app.use('/api/v1/cabecera', router);
};