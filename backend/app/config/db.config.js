module.exports = {
    HOST: "localhost",
    USER: "postgres",
    PASSWORD: "micedula",
    PORT: 5432,
    DB: "tp_arq_web",
    dialect: "postgres",
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
};