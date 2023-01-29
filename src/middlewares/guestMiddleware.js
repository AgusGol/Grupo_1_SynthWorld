const path = require ("path");
const fs = require('fs');
const session = require("express-session");

//este midd se va a encargar de chequear que el usuario no esté logueado 

function guestMiddleware (req, res, next) {
    if (req.session.email == undefined) {
        next();
    } else {
        res.send('Esta página es sólo para invitados')
    }                                   
}

module.exports = guestMiddleware;