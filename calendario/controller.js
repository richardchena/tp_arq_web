const calendario = require("node-cron");

exports.tarea = calendario
    .schedule('*/5 * * * * *', () => {
        console.log('HOLA MUNDO!!!');
    },{
        scheduled: false,
        timezone: "America/Asuncion"
});
