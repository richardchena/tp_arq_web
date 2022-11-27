module.exports = app => {
    const concepto = require("../controllers/concepto.controller.js");
    var router = require("express").Router();

    //Crear
    router.post("/", concepto.create);

    //Obtener
    router.get('/comprobar_user', concepto.comprobar);
    router.get("/", concepto.findAll);
    router.get("/:id", concepto.findOne);

    //Modificar
    router.put("/", concepto.update);

    //Eliminar
    router.delete("/:id", concepto.destroy);

    //Se define la ruta de cliente
    app.use('/api/v1/conceptos', router);
};