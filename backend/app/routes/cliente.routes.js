module.exports = app => {
    const cliente = require("../controllers/cliente.controller.js");
    var router = require("express").Router();

    //Crear
    router.post("/", cliente.create);

    //Obtener
    router.get("/ganadorx/:premio/:lim_inf/:lim_sup/:fecha_lim", cliente.ejecutar);
    router.get("/aprox/", cliente.aprox);
    router.get("/", cliente.findAll);
    router.get("/:id", cliente.findOne);
    router.get("/cedula/:id", cliente.get_id);

    //Modificar
    router.put("/", cliente.update);

    //Eliminar
    router.delete("/:id", cliente.destroy);

    
    

    

    //Se define la ruta de cliente
    app.use('/api/v1/cliente', router);
};