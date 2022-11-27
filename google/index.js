const express = require('express');
const app = express();
const passport = require('passport');
const cookieSession = require('cookie-session');
const axios = require('axios');
require('./passport');
  
app.use(cookieSession({
    name: 'google-auth-session',
    keys: ['key1', 'key2']
}));
app.use(passport.initialize());
app.use(passport.session());
    
app.get('/', (req, res) => {
    res.send("<button><a href='/auth'>Login With Google</a></button>")
});
  
//Auth 
app.get('/auth' , passport.authenticate('google', { 
        scope: ['email', 'https://www.googleapis.com/auth/userinfo.profile']
    })
);

// Auth Callback
app.get( '/auth/callback',
    passport.authenticate( 'google', {
        successRedirect: '/auth/callback/success',
        //failureRedirect: '/auth/callback/failure'
        //successRedirect: '/auth/redireccionar_success',
        failureRedirect: '/auth/redireccionar_failure'
}));

//Redireccionar success
app.get('/auth/redireccionar_success', (req , res) => {
    res.redirect('http://localhost:8080/tp_arq_web/view/cliente/cliente.jsp');
});

//Redireccionar failure
app.get('/auth/redireccionar_failure', (req , res) => {
    res.redirect('http://localhost:8080/tp_arq_web/view/login/login.jsp');
});
  
// Success 
app.get('/auth/callback/success' , (req , res) => {
    if(!req.user){
        res.redirect('/auth/callback/failure');
    } else{
        const value = {
            nombre: req.user.displayName,
            imagen: req.user.picture,
            email: req.user.email
        }

        axios({
            method: 'get',
            url: 'http://localhost:9090/api/v1/conceptos/comprobar_user',
            data: {
                email: value.email,
            }
        })
        .then(function (response) {
            if (response.data.count === '1'){
                res.redirect('http://localhost:8080/tp_arq_web/view/cliente/cliente.jsp');
            } else {
                res.redirect('http://localhost:8080/tp_arq_web/view/login/unauthorized.jsp');
            }
            
        })
        .catch(function (error) {
            res.redirect('http://localhost:8080/tp_arq_web/view/login/login.jsp');
        })
    }
});
  
// failure
app.get('/auth/callback/failure' , (req , res) => {
    res.send({message: "No hay una session activa"});
})


//LOG OUT
app.get('/logout', function(req,res){
   req.logOut();
   res.clearCookie('connect.sid', { path: '/' });
   //res.redirect('/');
   res.send("se ha cerrado la sesion");
});

//Check
app.get('/logged', function(req,res){
    const valor = req.isAuthenticated();
    res.send({logged: valor});
 });

//PRINCIPAL  
app.listen(9091 , () => {
    console.log("Server Running on port 9091");
});