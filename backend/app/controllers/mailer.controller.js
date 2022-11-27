const mail = require("../config/mailer");

exports.enviar_mail = (req, res) => {
    //const id = req.params.id;
    mail.transporter.sendMail({
        from: '"NO-REPLY" tparqweb@gmail.com>',
        to: "johana.nunhez14@gmail.com", //koujekodoule-9411@yopmail.com
        subject: "INFO-TAREA",
        html: `
            <b>HOLA MUNDO</b>
            <br>
            <p>Este es un mensaje autogenerado, favor no responder</p>
        `,
    })
    .then(data => {
            res.status(200).send({message: "Mail enviado correctamente"});
    })
    .catch(err => {
        res.status(500).send({
            message: err
        });
    });
};