const express = require("express");
const router= express.Router();
const path = require ("path");
const multer = require ('multer');
const userController= require("../controllers/userController");
const { check } = require('express-validator');

const validateLogin = [
    check('userEmail')
    .notEmpty().withMessage('You must fill in your email address').bail()
    .isEmail().withMessage('You must fill in a valid email address'),
    check('userPassword')
    .notEmpty().withMessage('You must fill in your password').bail(),
    ];

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
    cb(null, path.join(__dirname,'../public/img/users'));
    },
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
    })
    
    const upload = multer({ storage })

router.get("/", userController.userIndex);
router.get("/login", validateLogin, userController.login); //users
router.post("/login", userController.loginRequest);
router.get("/register", userController.userCreate); //users
router.post("/register",upload.single('userAvatar'),userController.register)

module.exports=router;