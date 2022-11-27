module.exports = app => {
    //const google = require("../controllers/google.controller.js");
    const google = require("../controllers/newgoogle.controller.js")(app);
    var router = require("express").Router();

    //OBTENER
    //router.get("/1", google.paso1);
    //router.get("/", google.obtener);

    /*router.get("/", google.iniciar);
    router.get("/callback", google.callback);
    router.get("/callback/success", google.callback_success);
    router.get("/callback/failure", google.callback_failure);
    router.get('/log_out', google.log_out);*/
    router.get("/", google.iniciar);
    router.get('/prueba', google.prueba);
    

    //Se define la ruta de cliente
    app.use('/auth', router);
};