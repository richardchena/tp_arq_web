module.exports = (sequelize, Sequelize) => {
    const Concepto = sequelize.define("TP_ARQ_CONCEPTOS", {
        id: {
            type: Sequelize.BIGINT,  
            primaryKey: true,
            autoIncrement: true
        },

        descripcion: {
            type: Sequelize.STRING,
            allowNull: false
        },

        puntos: {
            type: Sequelize.NUMERIC,
            allowNull: false
        }
    });
    return Concepto;
};