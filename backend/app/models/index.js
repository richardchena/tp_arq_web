const dbConfig = require("../config/db.config.js");
const Sequelize = require("sequelize");
const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
    host: dbConfig.HOST,
    dialect: dbConfig.dialect,
    operatorsAliases: false,
    port: dbConfig.PORT,
    pool: {
        max: dbConfig.pool.max,
        min: dbConfig.pool.min,
        acquire: dbConfig.pool.acquire,
        idle: dbConfig.pool.idle
    },
    dialectOptions: {
        useUTC: false,
      },
    timezone: 'America/Asuncion'
});

const db = {};
db.Sequelize = Sequelize;
db.sequelize = sequelize;
db.Clientes = require("./cliente.model.js")(sequelize, Sequelize);
db.Parametros = require("./parametro.model.js")(sequelize, Sequelize);
db.Bolsas = require("./bolsa.model.js")(sequelize, Sequelize);
db.Conceptos = require("./concepto.model.js")(sequelize, Sequelize);
db.Reglas = require("./regla.model.js")(sequelize, Sequelize);
db.Cabeceras = require("./cabecera.model.js")(sequelize, Sequelize);

module.exports = db;