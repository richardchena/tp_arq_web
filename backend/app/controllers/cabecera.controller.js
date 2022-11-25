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
    var condition = nombre ? { cabecera: { [Op.iLike]: `%${nombre}%` } } : null;
    Cabeceras.findAll({ where: condition, order: [['id']] })
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

//GET REPORTE USO DE PUNTOS
exports.ejecutar = (req, res) => {
    db.sequelize.query(`SELECT a.id, b.nombre || ' ' || b.apellido as nombre, b.doc_nro, a.fecha, a.concepto, a.puntaje_utilizado FROM public."TP_ARQ_CABECERAs" a INNER JOIN public."TP_ARQ_CLIENTEs" b on b.id = a.id_cliente`)
        .then(data => {
            res.send(data[0]);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message
            });
        });
}

//GET REPORTE TT PUNTOS
exports.saldo = (req, res) => {
    db.sequelize.query(`SELECT b.doc_nro, b.nombre || ' ' || b.apellido as nombre_cliente, sum(a.saldo_puntos) as total_puntos FROM public."TP_ARQ_BOLSAs" a INNER JOIN public."TP_ARQ_CLIENTEs" b on b.ID = a.id_cliente WHERE caducidad_puntaje >= current_date GROUP BY b.doc_nro, b.nombre || ' ' || b.apellido`)
        .then(data => {
            res.send(data[0]);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message
            });
        });
}