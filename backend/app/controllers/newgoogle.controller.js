/*const passport = require('passport');
require('./passport.controller');

exports.prueba = (req , res) => {
    res.send({message: "HOLA MUNDO!!"})
}


exports.iniciar = () => {
    console.log('aqui!!!');
    passport.authenticate('google', { 
        scope: ['email', 'https://www.googleapis.com/auth/userinfo.profile']
    })
}

exports.callback = () => {
    passport.authenticate( 'google', {
        successRedirect: '/auth/callback/success',
        failureRedirect: '/auth/callback/failure'
    });
}

exports.callback_success = (req , res) => {
    if(!req.user){
        res.redirect('/auth/callback/failure');
    } else{
        const value = {
            nombre: req.user.displayName,
            imagen: req.user.picture,
            email: req.user.email
        }

        res.send(value);
    }
}

exports.callback_failure = (req , res) => {
    res.send({message: "No hay una session activa"});
}

//LOG OUT
exports.log_out = (req, res) => {
    req.logOut();
    res.clearCookie('connect.sid', { path: '/' });
    //res.redirect('/');
    res.send("se ha cerrado la sesion");
 }
 */

module.exports = function (app) {
    const passport = require('passport');
    const cookieSession = require('cookie-session');
    
    app.use(cookieSession({
        name: 'google-auth-session',
        keys: ['key1', 'key2']
    }));
    app.use(passport.initialize());
    app.use(passport.session());

    module.prueba = (req, res) => {
        res.send("HOLA");
    }
    module.iniciar = () => {
        console.log('aqui!!!');
        passport.authenticate('google', { 
            scope: ['email', 'https://www.googleapis.com/auth/userinfo.profile']
        })
    }


    return module
 }