const path = require ("path");
const fs = require('fs');
const session = require("express-session");
const usersFilePath = path.join(__dirname, '../data/users.json');
const users = JSON.parse(fs.readFileSync(usersFilePath, 'utf-8'));

//este midd se va a encargar de chequear que el usuario no esté logueado 

function guestMiddleware (req, res, next) {
    if (req.session.foundUser == undefined) {
        next();
    } else {
        res.send('Esta página es sólo para invitados')
    }                                   
}

module.exports = guestMiddleware;