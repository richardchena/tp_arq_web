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
    var monto = req.params.monto;
    var saldo;
    var fecha_hoy = new Date();
    Bolsas.findAll({ where: {[Op.and]: [{id_cliente: id}, { saldo_puntos:{[Op.gt]: 0} },{caducidad_puntaje:{[Op.gt]: fecha_hoy}}] } })
        .then(data => {
            saldo = calcular_saldo(data);
            if(saldo < monto){
                throw('Saldo insuficiente');
            } else{
                res.send(saldo.toString());
            }
            
        })
        .catch(err => {
            res.status(500).send({
                message: err
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
  
    var monto = req.params.monto;
    var fecha_hoy = new Date();
    console.log(fecha_hoy);
    Bolsas.findAll({ where: {[Op.and]: [{id_cliente: id}, { saldo_puntos:{[Op.gt]: 0} },{caducidad_puntaje:{[Op.gt]: fecha_hoy}}]  }, order:[['caducidad_puntaje', 'ASC']]})
        .then(data => {
            if(data.length === 0){
                throw('No se encontro un registro');
            } else{
                const bolsas= calcular_fifo(data,monto);
                res.send(bolsas);
            }

        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Ocurrio un error"
        });
    });
};

function calcular_fifo(data, monto) {
    var falta = monto*1;
    var quitar = 0;
    const bolsas = {};
    bolsas['bolsas'] = [];
    let bolsas_ = new Array();
    data.forEach(element => {
        let bolsa_= new Map();
        if (falta > 0) {
            if (element.saldo_puntos <= falta) {
                falta -= element.saldo_puntos;
                quitar = element.saldo_puntos;
            } else if (element.saldo_puntos > falta){
                quitar = falta;
                falta -= quitar;
            }
            const bolsa = {
                "id_bolsa": element.id,
                "id_cliente": element.id_cliente,
                "puntaje_utilizado": parseInt(element.puntaje_utilizado) + parseInt(quitar),
                "saldo_puntos": element.saldo_puntos - quitar
            }
            bolsas['bolsas'].push(bolsa);
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
/*
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

exports.updateBolsas = (req, res) => {

    req.body.bolsas.forEach(element => {
        const bolsa = {
            id: element.id_bolsa,
            id_cliente: element.id_cliente,
            puntaje_utilizado: element.puntaje_utilizado,
            saldo_puntos: element.saldo_puntos
        };
        
        Bolsas.update(bolsa, {where: {id: bolsa.id}});

    }); res.send({message: "Se han modificado correctamente los campos"});
};

    //console.log(req.body.bolsas[0].id_bolsa);
    /*Const bolsa = {
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
        });*/

exports.dias_vencer = (req, res) => {
    const dias = req.params.dias;
    db.sequelize.query('SELECT a.id_cliente, b.nombre, b.doc_nro, a.saldo_puntos, date(a.caducidad_puntaje) as vencimiento, date(a.caducidad_puntaje) - current_date as cant FROM public."TP_ARQ_BOLSAs" a INNER JOIN public."TP_ARQ_CLIENTEs" b ON b.id = a.id_cliente WHERE saldo_puntos <> 0 and date(caducidad_puntaje) <= date(current_date) + ' + dias)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message
            });
        });
}