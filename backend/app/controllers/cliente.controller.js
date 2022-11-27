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

//Aproximacion
exports.aprox = (req, res) => {
    const nombre = "'" + req.query.nombre + "%'";
    const apellido = "'" + req.query.apellido + "%'";
    const fec_nac = "'" + req.query.fec_nac + "'";

    let query = '';

    if (req.query.fec_nac === undefined) {
        query = `select id, nombre || ' ' || apellido as nombre, doc_nro, email, nacionalidad, date(fec_nac) as fec_nac
        from public."TP_ARQ_CLIENTEs" 
        where trim(lower(nombre)) like trim(lower(${nombre})) or
              trim(lower(apellido)) like trim(lower(${apellido}))`
    } else {
        query = `select id, nombre || ' ' || apellido as nombre, doc_nro, email, nacionalidad, date(fec_nac) as fec_nac
        from public."TP_ARQ_CLIENTEs" 
        where trim(lower(nombre)) like trim(lower(${nombre})) or
              trim(lower(apellido)) like trim(lower(${apellido})) or
              DATE(fec_nac) = ${fec_nac}`
    }

    db.sequelize.query(query)
        .then(data => {
            res.send(data[0]);
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

exports.ejecutar = (req, res) => {
    const premio =  req.params.premio;
    const lim_inf = req.params.lim_inf;
    const lim_sup = req.params.lim_sup;
    const fecha_lim = req.params.fecha_lim;
    db.sequelize.query('select prueba1('+ fecha_lim + ',' + lim_inf + ',' + lim_sup +')')
        .then(data => {
            const obj = cadenaObj(data[0][0].prueba1, premio);
            res.send(obj);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message
            });
        });
};

function cadenaObj(data, premio) {
    let cad = data.replace('(',"");
    let cad2 = cad.replace(')',"");
    let cad3 = cad2.replace('"',"");
    let cad4 = cad3.replace('"',"");
    let cad5 = cad4.split(',');
    cad5.push(premio);
    const obj = {
        "id_cliente": cad5[0],
        "nom_comp": cad5[1],
        "cedula": cad5[2],
        "correo": cad5[3],
        "premio": cad5[4],
    }

    return obj;
    
}