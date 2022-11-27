module.exports = app => {
    const google = require("../controllers/google.controller.js");
    var router = require("express").Router();

    //Crear
    router.get("/", google.obtener);

    //Se define la ruta de cliente
    app.use('/auth/google', router);
};