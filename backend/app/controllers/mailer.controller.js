const mail = require("../config/mailer");
const db = require("../models");

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

//usuarios
exports.lista_task_mail = (req, res) => {
    const dias = req.query.dias;
    const query = `SELECT * FROM lista_task(${dias});`

    db.sequelize.query(query)
        .then(data => {
            res.send(data[0]);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message
        });
    });
}

//mail_tarea
exports.enviar_mail_task = (req, res) => {
    const email = req.query.email;
    const fecha = req.query.fecha;
    const nombre = req.query.nombre;
    const saldo = req.query.saldo;

    mail.transporter.sendMail({
        from: '"noreply" tparqweb@gmail.com>',
        to: email,
        subject: "Aviso de vencimiento de puntos",
        html: `
            <b>Estimad@ cliente: ${nombre}</b>
            <br>
            <p>Le comentamos que sus "${saldo}" puntos expirarán pronto, le recomendamos utilizarlos antes del ${fecha}</p>
            <p>Atte,</p>
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