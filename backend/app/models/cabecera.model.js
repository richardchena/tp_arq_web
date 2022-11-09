module.exports = (sequelize, Sequelize) => {
    const Cabecera = sequelize.define("TP_ARQ_CABECERAS", {
        id: {
            type: Sequelize.BIGINT,  
            primaryKey: true,
            autoIncrement: true
        },

        id_cliente: {
            type: Sequelize.BIGINT,
            allowNull: false
        },

        puntaje_utilizado: {
            type: Sequelize.NUMERIC,
            allowNull: false
        },

        fecha: {
            type: Sequelize.DATE,
            allowNull: false,
        },

        concepto: {
            type: Sequelize.STRING,
            allowNull: false
        },


        
    });
    return Cabecera;
};