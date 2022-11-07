const db = require("../models");
const Reglas = db.Reglas;

//Crear un registro
exports.create = (req, res) => {
    const regla = {
        limite_inferior: req.body.limite_inferior,
        limite_superior: req.body.limite_superior,
        monto: req.body.monto
    };

    Reglas.create(regla)
        .then(data => {
            res.status(200).send({
                message: "Se ha creado la regla"
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
    Reglas.findByPk(id)
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
    Reglas.findAll({order: [['id']]})
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
    Reglas.destroy({
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
    const regla = {
        id: req.body.id,
        limite_inferior: req.body.limite_inferior,
        limite_superior: req.body.limite_superior,
        monto: req.body.monto
    };

    Reglas.update(regla, {where: {id: regla.id}})
        .then(data => {
            res.send({message: "Se ha modificado la regla "});
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ha ocurrido un error al modificar el registro."
            });
        });
};