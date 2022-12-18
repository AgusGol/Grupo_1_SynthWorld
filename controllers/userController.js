const path = require ("path");
const fs = require('fs');
const usersFilePath = path.join(__dirname, '../data/users.json');
const users = JSON.parse(fs.readFileSync(usersFilePath, 'utf-8'));
const bcrypt = require('bcryptjs');
const session = require('express-session');
const { validationResult } = require('express-validator');
const cookieParser = require("cookie-parser");

const userController={

login:(req, res) => {
    console.log("cookieee", req.cookies.userEmail);
        res.render('login');
        
    },
register:(req, res) => {
        res.render('register');
    },
loginRequest: (req, res) => {

    //falta la validacion de errores
    //falta la cookie para recordar usuario
    console.log(req.body);

    let encryptedPass = bcrypt.hashSync(req.body.userPassword, 10);
    let foundUser = users.find(user => user.email == req.body.userEmail)

    if(foundUser != undefined) {
         let passCheck = bcrypt.compareSync(req.body.userPassword, foundUser.password);
         if (passCheck == true) {
             req.session.id = foundUser.id;
             req.session.email = foundUser.email;
             req.session.name = foundUser.name;
             req.session.lastName = foundUser.last_name;
             req.session.category = foundUser.category;
             console.log("session", req.session);

            if(req.body.rememberMe != undefined && req.body.rememberMe == "on"){
                res.cookie("userEmail", req.session.email, {maxAge: 604800000});
                
            } 
             res.redirect("/home");
         }
         else res.redirect("/login")
     }
     else {res.redirect("/login")}

    
}      
};

module.exports =userController;
