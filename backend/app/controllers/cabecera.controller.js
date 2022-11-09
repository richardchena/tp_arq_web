const db = require("../models");
const Cabeceras = db.Cabeceras;
const Op = db.Sequelize.Op;

//Crear un registro
exports.create = (req, res) => {
    const cabecera = {
        id_cliente: req.body.id_cliente,
        puntaje_utilizado: req.body.puntaje_utilizado,
        fecha: req.body.fecha,
        concepto: req.body.concepto,
    };

    Cabeceras.create(cabecera)
        .then(data => {
            res.status(200).send({
                message: "Se ha creado la cabecera "
            });
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ha ocurrido un error al crear el registro."
            });
        });
};

//Obtener por id
exports.findOne = (req, res) => {
    const id = req.params.id;
    Cabeceras.findByPk(id)
        .then(data => {
            if(data === null){
                throw('No se encontro el ID');
            } else{
                res.send(data);
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Error al obtener el ID -> " + err
        });
    });
};

//Obtener todos los campos
exports.findAll = (req, res) => {
    const nombre = req.query.nombre;
    var condition = nombre ? { cliente: { [Op.iLike]: `%${nombre}%` } } : null;
    Clientes.findAll({ where: condition, order: [['id']] })
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ocurrio un error al obtener las ventas."
        });
    });
};



//DELETE
exports.destroy = (req, res) => {
    const id = req.params.id;
    Cabeceras.destroy({
            where: {id: parseInt(id)}
        })
        .then(data => {
            res.status(200).send({message: "Se ha borrado exitosamente el ID: " + id});
        })
        .catch(err => {
            res.status(500).send({
                message: err
        });
    });
};

//Modificar
exports.update = (req, res) => {
    const cabecera = {
        id: req.body.id,
        nombre: req.body.nombre,
        apellido: req.body.apellido,
        doc_nro: req.body.doc_nro,
        tipo_doc: req.body.tipo_doc,
        nacionalidad: req.body.nacionalidad,
        email: req.body.email,
        telefono: req.body.telefono,
        fec_nac: req.body.fec_nac
    };

    Cabeceras.update(cabecera, {where: {id: cabecera.id}})
        .then(data => {
            res.send({message: "Se ha modificado el usuario " + cliente.nombre + " " + cliente.apellido});
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ha ocurrido un error al modificar el registro."
            });
        });
};

