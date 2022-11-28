const mail = require("../config/mailer");

exports.enviar_mail = (req, res) => {
    const email = req.query.email;
    const premio = req.query.premio;
    const nombre = req.query.nombre;

    mail.transporter.sendMail({
        from: '"noreply" tparqweb@gmail.com>',
        to: email,
        subject: "¡FELICITACIONES!",
        html: `
            <b>Estimad@ cliente: ${nombre}</b>
            <br>
            <span>Le comentamos que ha sido ganador del '${premio}' del sorteo del día de hoy</span>
            <br>
            <span>Muchas felicidades! Saludos,</span>
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