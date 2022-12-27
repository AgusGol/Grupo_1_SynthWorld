const path = require ("path");
const fs = require('fs');
const usersFilePath = path.join(__dirname, '../data/users.json');
const users = JSON.parse(fs.readFileSync(usersFilePath, 'utf-8'));
const bcrypt = require('bcryptjs');
const session = require('express-session');
const { validationResult } = require('express-validator');
const cookieParser = require("cookie-parser");
const { render } = require("ejs");

const userController={
userIndex:(req,res) =>{
    res.render("user",{users})
},

login:(req, res) => {
    console.log("cookieee", req.cookies.userEmail);
        res.render('login');
        
    },
userCreate:(req, res) => {
    res.render("register");
},
register:(req, res, next) => {
        console.log("reqfile",req.file);
        let lastUserIndex = users.length -1;
        let newUser = {};
        if (users == "") {
            newUser = {
                id : 1,
                name: req.body.name,
                last_name: req.body.last_name,
                email: req.body.email,
                password : bcrypt.hashSync(req.body.password,10),
                category : req.body.category,
                image: req.file.filename,
            }
        }
        else { 
            newUser = {
                id : users[lastUserIndex].id + 1,
                name: req.body.name,
                last_name: req.body.last_name,
                email: req.body.email,
                password : bcrypt.hashSync(req.body.password,10),
                category : req.body.category,
                image: req.file ? req.file.filename : "defaultAvatar.png" , 
        }
    }
    
    
        console.log("ESTO ES newProduct", newUser);
        users.push(newUser);
        let usersJSON = JSON.stringify(users, null, '\t');
        fs.writeFileSync(usersFilePath, usersJSON , "");
        console.log(req.file);
        res.redirect('/users');
    
    },
loginRequest: (req, res) => {

    //falta la validacion de errores
    //falta la cookie para recordar usuario
    console.log(req.body);

    let encryptedPass = bcrypt.hashSync(req.body.userPassword, 10);
    let foundUser = users.find(user => user.email == req.body.userEmail)
    console.log("fouuund", foundUser)
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
         else res.redirect("/users/login")
     }
     else {res.redirect("/users/login")}

    
}      
};

module.exports =userController;
