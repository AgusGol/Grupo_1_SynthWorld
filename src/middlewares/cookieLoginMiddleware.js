const path = require ("path");
const fs = require('fs');
const session = require("express-session");
const usersFilePath = path.join(__dirname, '../data/users.json');
const users = JSON.parse(fs.readFileSync(usersFilePath, 'utf-8'));
const db = require('../database/models');

module.exports = (req, res, next) => {
    console.log(req.session)
    if(req.session.userId == undefined){
        if (req.cookies.userEmail != undefined) {
            db.User.findAll({
                where: {
                    email : req.cookies.userEmail
            }
        })
        .then(foundUser => {
            console.log('ooo', foundUser)
            if(foundUser != undefined && foundUser != '') {
             req.session.userId = foundUser[0].id;
             req.session.email = foundUser[0].email;
             req.session.name = foundUser[0].first_name;
             req.session.lastName = foundUser[0].last_name;
             req.session.category = foundUser[0].is_admin;
             console.log(req.session);
        }
        let idU = req.session.userId
        console.log('holi')
        res.redirect('/users/detail/' + idU)
    })
} 
else {
    next();
    }
} else {
next();
}
}