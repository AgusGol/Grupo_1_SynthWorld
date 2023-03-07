const path = require ("path");
const fs = require('fs');
const session = require("express-session");
const usersFilePath = path.join(__dirname, '../data/users.json');
const users = JSON.parse(fs.readFileSync(usersFilePath, 'utf-8'));

//este midd va a chequear si el usuario es admin

function adminMiddleware (req, res, next) {
    if (req.session.category) {
        next();
    } else {
        res.send('Esta página es sólo para usuarios administradores')
    }
}

module.exports = adminMiddleware;