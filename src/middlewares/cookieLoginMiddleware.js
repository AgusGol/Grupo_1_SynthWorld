const path = require ("path");
const fs = require('fs');
const session = require("express-session");
const usersFilePath = path.join(__dirname, '../data/users.json');
const users = JSON.parse(fs.readFileSync(usersFilePath, 'utf-8'));

module.exports = (req, res, next) => {
    if(!session.locals){
        if (req.cookies.userEmail != undefined) {
            let foundUser = users.find(user => user.email == req.cookies.userEmail)
            if(foundUser != undefined) {
             req.session.id = foundUser.id;
             req.session.email = foundUser.email;
             req.session.name = foundUser.name;
             req.session.lastName = foundUser.last_name;
             req.session.category = foundUser.category;
             console.log("session", req.session);
        }
    }
        
    }
    next();
}