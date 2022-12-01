const express = require('express');
const calendario = require("node-cron");
const axios = require('axios')
const controller = require('./controller.js')

const app = express();
const cors = require("cors");
let status = false;
let dias = null;

var corsOptions = {
    origin: ["http://localhost:8080"]
};

app.use(cors(corsOptions));

function enviar_mail(nom_com, email, caducidad_puntaje, saldos_puntos){
    axios.get('http://localhost:9090/api/v1/envio_mail/enviar_mail_task', 
    { params: 
        {   nombre: nom_com,
            email: email,
            fecha: caducidad_puntaje,
            saldo: saldos_puntos
        }
    }).then(function (data) {
        console.log("mail enviado a: " + email);
    })
    .catch(function (error) {
        console.log("ok");
    });
}

function finalisimo (){
    axios.get('http://localhost:9090/api/v1/envio_mail/obtener_lista_mail', 
    { params: 
        { dias }
    }).then(function (data) {
        if(data.data.length !== 0){
            for (var i = 0; i < data.data.length; i++) {
                nom_com = data.data[i].nom_com;
                email = data.data[i].email
                caducidad_puntaje = data.data[i].caducidad_puntaje
                saldos_puntos = data.data[i].saldos_puntos

                enviar_mail(nom_com, email, caducidad_puntaje, saldos_puntos);
            }
            console.log("COMPLETADO CORRECTAMENTE!");

        } else {
            console.log("NO HAY CORREOS QUE ENVIAR!");
        }
    })
    .catch(function (error) {
      console.log(error);
    })
};

//task ejemplo
const task0 = calendario
    .schedule('*/50 * * * * *', () => {
        if(dias === null){
            console.log("Debe primeramente asignar un numero para dias");
        }else{
            finalisimo();
        }
    },{
        scheduled: false,
        timezone: "America/Asuncion"
});

//HORA ESPECIFICA
const task00 = calendario
    .schedule('0 53 23 * * *', () => {
        console.log('SON LAS 23:43');
    },{
        scheduled: false,
        timezone: "America/Asuncion"
});

//tarea este si!!!!!!!
const task = calendario
    .schedule('0 15 21 * * *', () => {
        if(dias === null){
            console.log("Debe primeramente asignar un numero para dias");
        }else{
            finalisimo();
        }
    },{
        scheduled: false,
        timezone: "America/Asuncion"
});

app.get('/iniciar', (req, res) => {
    console.log('La tarea se ha iniciado');
    status = true;
    task.start();
    res.send({mensaje: 'La tarea se ha iniciado correctamente'});
});

app.get('/detener', (req, res) => {
    console.log('La tarea se ha detenido');
    status = false;
    task.stop();
    res.send({mensaje: 'La tarea se ha detenido'});
});



app.get('/set_date', (req, res) => {
    dias = req.query.dias;
    res.send({mensaje: `Se ha asignado el parametro ${dias} días`});
});

app.get('/get_date', (req, res) => {
    res.send({dias});
});

app.get('/check', (req, res) => {
    res.send({status: status});
});

//PRINCIPAL  
app.listen(9092 , () => {
    console.log('Servidor para calendarización corriendo en el puerto 9092');
});