const db = require("../models");
const Clientes = db.Clientes;
const Op = db.Sequelize.Op;

exports.create = (req, res) => {
    // crea un registro
    const cliente = {
        nombre: req.body.nombre,
        apellido: req.body.apellido,
        doc_nro: req.body.doc_nro,
        tipo_doc: req.body.tipo_doc,
        nacionalidad: req.body.nacionalidad,
        email: req.body.email,
        telefono: req.body.telefono,
        fec_nac: req.body.fec_nac
    };

    // Guardamos a la base de datos
    Clientes.create(cliente)
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
    Ventas.findByPk(id)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: "Error al obtener venta con id=" + id
        });
    });
};

exports.findAll = (req, res) => {
    const nombre = req.query.nombre;
    var condition = nombre ? { cliente: { [Op.iLike]: `%${nombre}%` } } : null;
    Ventas.findAll({ where: condition })
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ocurrio un error al obtener las ventas."
        });
    });
};