module.exports = (sequelize, Sequelize) => {
    const Bolsa = sequelize.define("TP_ARQ_BOLSAS", {
        id: {
            type: Sequelize.BIGINT,  
            primaryKey: true,
            autoIncrement: true
        },

        id_cliente: {
            type: Sequelize.BIGINT,  
        },

        asignacion_puntaje: {
            type: Sequelize.DATE,
            allowNull: false,
        },

        caducidad_puntaje: {
            type: Sequelize.DATE,
            allowNull: false,
        },

        puntaje_asignado: {
            type: Sequelize.NUMERIC,
            allowNull: false,
        },

        puntaje_utilizado: {
            type: Sequelize.NUMERIC,
            allowNull: true,
        },

        saldo_puntos: {
            type: Sequelize.NUMERIC,
            allowNull: true,
        },

        monto_operacion: {
            type: Sequelize.NUMERIC,
            allowNull: true,
        },


    });
    return Bolsa;
};