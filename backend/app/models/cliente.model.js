module.exports = (sequelize, Sequelize) => {
    const Cliente = sequelize.define("TP_ARQ_CLIENTES", {
        id: {
            type: Sequelize.BIGINT,  
            primaryKey: true,
            autoIncrement: true
        },

        nombre: {
            type: Sequelize.STRING,
            allowNull: false
        },

        apellido: {
            type: Sequelize.STRING,
            allowNull: false
        },

        doc_nro: {
            type: Sequelize.NUMERIC,
            allowNull: false,
            unique: true
        },

        tipo_doc: {
            type: Sequelize.STRING,
            allowNull: false
        },

        nacionalidad: {
            type: Sequelize.STRING,
            allowNull: false
        },
        
        email: {
            type: Sequelize.STRING
        },

        telefono: {
            type: Sequelize.STRING
        },

        fec_nac: {
            type: Sequelize.DATE,
            allowNull: false,
        }
    });
    return Cliente;
};