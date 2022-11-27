module.exports = app => {
    const google = require("../controllers/google.controller.js");
    var router = require("express").Router();

    //OBTENER
    router.get("/1", google.paso1);
    router.get("/", google.obtener);
    

    //Se define la ruta de cliente
    app.use('/auth/google', router);
};