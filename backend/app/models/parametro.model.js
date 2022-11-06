module.exports = (sequelize, Sequelize) => {
    const Parametro = sequelize.define("TP_ARQ_PARAMETROS", {
        id: {
            type: Sequelize.BIGINT,  
            primaryKey: true,
            autoIncrement: true
        },

        ini_validez: {
            type: Sequelize.DATE,
            allowNull: false,
        },

        fin_validez: {
            type: Sequelize.DATE,
            allowNull: false,
        },

        duracion: {
            type: Sequelize.NUMERIC,
            allowNull: false,
        },

    });
    return Parametro;
};