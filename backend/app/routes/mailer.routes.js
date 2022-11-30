module.exports = app => {
    const mail = require("../controllers/mailer.controller.js");
    var router = require("express").Router();

    //Crear
    router.get("/obtener_lista_mail", mail.lista_task_mail);
    router.get("/enviar_mail_task", mail.enviar_mail_task);
    router.get("/", mail.enviar_mail);


    //Se define la ruta de cliente
    app.use('/api/v1/envio_mail', router);
};