module.exports = (sequelize, Sequelize) => {
    const Regla = sequelize.define("TP_ARQ_REGLAS", {
        id: {
            type: Sequelize.BIGINT,  
            primaryKey: true,
            autoIncrement: true
        },

        limite_inferior: {
            type: Sequelize.NUMERIC
        },

        limite_superior: {
            type: Sequelize.NUMERIC
        },

        monto: {
            type: Sequelize.NUMERIC,
            allowNull: false
        },
    });
    return Regla;
};