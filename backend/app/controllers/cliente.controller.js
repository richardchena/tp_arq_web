const db = require("../models");
const Clientes = db.Clientes;
const Op = db.Sequelize.Op;

//Crear un registro
exports.create = (req, res) => {
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

    Clientes.create(cliente)
        .then(data => {
            res.status(200).send({
                message: "Se ha creado el usuario " + cliente.nombre + " " + cliente.apellido
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
    Clientes.findByPk(id)
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
    Clientes.destroy({
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
    const cliente = {
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

    Clientes.update(cliente, {where: {id: cliente.id}})
        .then(data => {
            res.send({message: "Se ha modificado el usuario " + cliente.nombre + " " + cliente.apellido});
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ha ocurrido un error al modificar el registro."
            });
        });
};


//Obtener ID dado la cedula
exports.get_id = (req, res) => {
    const cedula = req.params.id;;
    Clientes.findAll(
        { where: {doc_nro: cedula},
          attributes: ['id','nombre','apellido']
        })
        .then(data => {
            if(data.length === 0){
                throw('No se encontro un registro');
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