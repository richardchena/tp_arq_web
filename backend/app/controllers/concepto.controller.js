const db = require("../models");
const Conceptos = db.Conceptos;
const Op = db.Sequelize.Op;

//Crear un registro
exports.create = (req, res) => {
    const concepto = {
        descripcion: req.body.descripcion,
        puntos: req.body.puntos
    };

    Conceptos.create(concepto)
        .then(data => {
            res.status(200).send({
                message: "Se ha creado el concepto: '" + concepto.descripcion + "'"
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
    Conceptos.findByPk(id)
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
    Conceptos.findAll({order: [['id']]})
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ocurrio un error al obtener las registros."
        });
    });
};



//DELETE
exports.destroy = (req, res) => {
    const id = req.params.id;
    Conceptos.destroy({
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
    const concepto = {
        id: req.body.id,
        descripcion: req.body.descripcion,
        puntos: req.body.puntos
    };

    Conceptos.update(concepto, {where: {id: concepto.id}})
        .then(data => {
            res.send({message: "Se ha modificado el concepto " + concepto.descripcion});
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ha ocurrido un error al modificar el registro."
            });
        });
};