const db = require("../models");
const Bolsas = db.Bolsas;
const Op = db.Sequelize.Op;

exports.create = (req, res) => {
    // crea un registro
    const bolsa = {
        id_cliente: req.body.id_cliente,
        asignacion_puntaje: req.body.asignacion_puntaje,
        caducidad_puntaje: req.body.caducidad_puntaje,
        puntaje_asignado: req.body.puntaje_asignado,
        puntaje_utilizado: req.body.puntaje_utilizado,
        saldo_puntos: req.body.saldo_puntos,
        monto_operacion: req.body.saldo_puntos
    };

    // Guardamos a la base de datos
    Bolsas.create(bolsa)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ha ocurrido un error al crear el registro."
            });
        });
};

exports.findOne = (req, res) => {
    const id = req.params.id;
    Bolsas.findByPk(id)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: "Error al obtener parametro con id=" + id
        });
    });
};

exports.findAll = (req, res) => {
    const fin = req.query.fin;
    var condition = fin ? { fin_validez: { [Op.eq]: `%${fin}%` } } : null;
    Bolsas.findAll({ where: condition })
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ocurrio un error al obtener los parametros."
        });
    });
};

exports.destroy = (req, res) => {
    const id = req.params.id;
    Parametros.destroy({
        where: {id: parseInt(id)}
    })
        .then(data => {
            res.status(200).send({message:"Se ha borrado exitosamente el ID:" + id});
        })
        .catch(err => {
            res.status(500).send({
                message: "Error al obtener parametro con id=" + id
        });
    });
};

//Modificar
exports.update = (req, res) => {
    const parametro = {
        id: req.body.id,
        ini_validez: req.body.ini_validez,
        fin_validez: req.body.fin_validez,
        duracion: req.body.duracion,
    };

    Parametros.update(parametro, {where: {id: parametro.id}})
        .then(data => {
            res.send({message: "Se han modificado correctamente los campos"});
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ha ocurrido un error al modificar el registro."
            });
        });
};