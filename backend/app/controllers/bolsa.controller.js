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
        monto_operacion: req.body.monto_operacion
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
    console.log(ver_validez(id));
    
};

function ver_validez(id) {
    var vence_primero=5;
    var condition = id ? { id_cliente: { [Op.eq]: id} } : null;
    Bolsas.findAll({ where: condition, order:[['caducidad_puntaje', 'DESC']] })
        .then(data => {
            data.forEach(element => {
                console.log(element.caducidad_puntaje);
                
            }); 
            return vence_primero; 
        })
    
}

function calcular_saldo(bolsas) {
    var saldo = 0;
    bolsas.forEach(element => {
        saldo = saldo + (element.saldo_puntos * 1);
    } )
    return saldo;
    
}

exports.saldo_disponible = (req, res) => {
    const id = req.params.id;
    var saldo;
    var fecha_hoy = new Date();
    Bolsas.findAll({ where: {[Op.and]: [{id_cliente: id}, { saldo_puntos:{[Op.gt]: 0} },{caducidad_puntaje:{[Op.lt]: fecha_hoy}}] } })
        .then(data => {
            saldo = calcular_saldo(data);
            res.send(saldo.toString());
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ocurrio un error al obtener las ventas."
        });
    });
}

//Obtener todos los campos
exports.findAll = (req, res) => {
    const id = req.params.id;
    var condition = id ? { id_cliente: { [Op.eq]: id } } : null;
    Bolsas.findAll({ where: condition })
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ocurrio un error al obtener las ventas."
        });
    });
};

/*
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

exports.findAll = (req, res) => {
    const id = req.query.fin;
    var condition = id ? { id_cliente: { [Op.eq]: `%${id}%` } } : null;
    Bolsas.findAll({ where: condition })
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ocurrio un error al obtener los parametros."
        });
    });
};*/

exports.get_bolsas = (req, res) => {
    const id = req.params.id;
    var bolsas;
    var monto = req.params.monto;
    var fecha_hoy = new Date();
    Bolsas.findAll({ where: {[Op.and]: [{id_cliente: id}, { saldo_puntos:{[Op.gt]: 0} },{caducidad_puntaje:{[Op.lt]: fecha_hoy}}]  }, order:[['caducidad_puntaje', 'ASC']]})
        .then(data => {
            bolsas=calcular_fifo(data,monto);
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ocurrio un error al obtener los parametros."
        });
    });
};

function calcular_fifo(data, monto) {
    var falta = monto*1;
    var quitar = 0;
    let bolsas = new Array();
    data.forEach(element => {
        let bolsa= new Map();
        if (falta > 0) {
            if (element.saldo_puntos <= falta) {
                falta -= element.saldo_puntos;
                quitar = element.saldo_puntos;
            } else if (element.saldo_puntos > falta){
                quitar = falta;
                falta -= quitar;
            }
            bolsa.set("id_bolsa",element.id);
            bolsa.set("puntaje_utilizado", quitar);
            bolsas.push(bolsa);
        }
    } )

    return bolsas;
    
}

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
/*
exports.update = (req, res) => {
    const bolsa = {
        id: req.body.id,
        id_cliente: req.body.id_cliente,
        asignacion_puntaje: req.body.asignacion_puntaje,
        caducidad_puntaje: req.body.caducidad_puntaje,
        puntaje_asignado: req.body.puntaje_asignado,
        puntaje_utilizado: req.body.puntaje_utilizado,
        saldo_puntos: req.body.saldo_puntos,
        monto_operacion: req.body.monto_operacion
    };

    Bolsas.update(bolsa, {where: {id: bolsa.id}})
        .then(data => {
            res.send({message: "Se han modificado correctamente los campos"});
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ha ocurrido un error al modificar el registro."
            });
        });
};

exports.get_bolsas = (req, res) => {
    const id = req.params.id;
    Bolsas.findAll({ where: {[Op.and]: [{id_cliente: id}, { saldo_puntos:{[Op.gt]: 0} }] }})
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ocurrio un error al obtener los parametros."
        });
    });
};*/

exports.update = (req, res) => {
    const bolsa = {
        id: req.body.id,
        id_cliente: req.body.id_cliente,
        asignacion_puntaje: req.body.asignacion_puntaje,
        caducidad_puntaje: req.body.caducidad_puntaje,
        puntaje_asignado: req.body.puntaje_asignado,
        puntaje_utilizado: req.body.puntaje_utilizado,
        saldo_puntos: req.body.saldo_puntos,
        monto_operacion: req.body.monto_operacion
    };

    Bolsas.update(bolsa, {where: {id: bolsa.id}})
        .then(data => {
            res.send({message: "Se han modificado correctamente los campos"});
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ha ocurrido un error al modificar el registro."
            });
        });
};
