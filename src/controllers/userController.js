const path = require ("path");
const fs = require('fs');
// const usersFilePath = path.join(__dirname, '../data/users.json');
// const users = JSON.parse(fs.readFileSync(usersFilePath, 'utf-8'));
const bcrypt = require('bcryptjs');
const session = require('express-session');
const { validationResult } = require('express-validator');
const cookieParser = require("cookie-parser");
const { render } = require("ejs");
const db = require('../database/models');
const sequelize = db.sequelize;
const { Op } = require("sequelize");

const userController={
userIndex:(req,res) =>{
    db.User.findAll()
        .then((users) =>  res.render("user",{users}))
},
userDetail:(req,res) =>{
    console.log(req.params.id);
    db.User.findByPk(req.params.id)
    .then(user => {
        res.render('userDetail', {user});
    });
    // let userCo = users.filter((element) => {
    //     return element.id == req.params.id
    //     });
    // let user = userCo[0];
    // res.render("userDetail",{user})
},

login:(req, res) => {

    console.log("cookieee", req.cookies.userEmail);
        res.render('login');
        
    },
userCreate:(req, res) => {
    res.render("register");
},
register:(req, res, ) => {
    //guarda los errores, nose porque llegan vacios.
    const resultValidation = validationResult(req);
    // return res.send(resultValidation);
    console.log(req.file)
    if(resultValidation.errors.length > 0){
        return res.render("register",{
        errors:resultValidation.mapped(),
        oldData:req.body
    })
    }
    

        db.User.create({
            first_name: req.body.name,
            last_name: req.body.last_name,
            email: req.body.email,
            password : bcrypt.hashSync(req.body.password,10),
            image: req.file ? req.file.filename : "defaultAvatar.png",
            isAdmin : 0,
        }
        )
        .then(() => res.redirect('/'));   
    
    },
loginRequest: (req, res) => {
    let errors = validationResult(req);

    
        db.User.findAll({
            where: {
                email: req.body.userEmail
            }
        })
        .then(foundUser =>{
            
            foundUser = foundUser[0];
            if(foundUser != undefined){
            console.log("fouuund", foundUser.id);
            }
        
            
       if (errors.isEmpty()) {

    // let foundUser = users.find(user => user.email == req.body.userEmail)
    // console.log("fouuund", foundUser)
    
    //si no hay errores que llegan desde el validator
    if(foundUser != undefined) {
         let passCheck = bcrypt.compareSync(req.body.userPassword, foundUser.password);
         if (passCheck == true) {
             req.session.email = foundUser.email;
             req.session.userId = foundUser.id;
             req.session.name = foundUser.first_name;
             req.session.lastName = foundUser.last_name;
             req.session.category = foundUser.is_admin;
             req.session.image = foundUser.image;

             console.log("session", req.session);

            if(req.body.rememberMe != undefined && req.body.rememberMe == "on"){
                res.cookie("userEmail", req.session.email, {maxAge: 604800000});
                
            } 
             res.redirect("/home");
         }
         else {
            errors = [{msg:"Incorrect password"}];
            console.log('errorss', errors);
            res.render('login', {errors});
     }} 
     else {
        errors = [{msg: "That email address is not registered"}];
        
            res.render('login', {errors: errors});
     }
       }
    //si hay errores q llegan desde el validator
      else {
         let eror = errors.array();
       console.log("errooooors", eror)
         res.render('login', { errors: errors.array(), old: req.body});

        }
    })
       
  //  })
    
},
userEdit: (req, res) => {
    db.User.findByPk(req.session.userId)
        .then(user => {
            res.render('userEdit', {user})
        })
        .catch(err =>  res.render(err))
},
userUpdate: (req,res) => {
        console.log('boody', req.body);
        db.User.findByPk(req.session.userId)
        .then(user =>  {
            db.User.update({
            first_name: req.body.name,
            last_name: req.body.last_name,
            email: req.body.email,
            image: req.file ? req.file.filename : user.image,
            }, {
             where: {
                id: req.params.id
                }
        }) 
        .then(user => {
            console.log("uuseeerr", user)
            res.redirect('/users/detail/' + req.params.id)
        })
        })
},
logout: (req, res) => {
    req.session.destroy();
    res.clearCookie("userEmail");
    res.redirect('/')
},

userAvatar:(req,res)=>{
    res.render(req.file)
}
};

module.exports =userController;
