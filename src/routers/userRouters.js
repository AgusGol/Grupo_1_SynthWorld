const express = require("express");
const router= express.Router();
const path = require ("path");
const multer = require ('multer');
const userController= require("../controllers/userController");
const { check } = require('express-validator');
const guestMiddleware = require('../middlewares/guestMiddleware');
const loggedMiddleware = require('../middlewares/loggedMiddleware');

const validateLogin = [
    check('userEmail')
    .notEmpty().withMessage('You must fill in your email address').bail().exists()
    .isEmail().withMessage('You must fill in a valid email address'),
    check('userPassword')
    .notEmpty().withMessage('You must fill in your password').bail(),
    ];
//validacion del registe  aca o en un apartado de middleware?    
const validateRegister = [
    check('name')
        .notEmpty()
        .isLength({minLength: 2}),
    check('last_name')
        .notEmpty()
        .isLength({minLength: 2}),    
    check('email')
        .notEmpty()
        .withMessage('You must fill in your email address').bail()
        .isEmail()
        .withMessage('You must fill in a valid email address'),
    check('password')
        .notEmpty()
        .withMessage('You must fill in your password')
        .isLength({minLength: 8, minLowercase: 1, minUppercase: 1, minNumbers: 1, minSymbols: 1})
        .bail(),
    check('password2')
        .notEmpty()
        .custom(),
    check('userAvatar')
        .custom(({req}) => {
        if(req.file.mimetype === 'image/jpeg'|| req.file.mimetype === 'image/gif' || req.file.mimetype === 'image/png'){
            return true;}
        else{
            return false;}})
        .withMessage('Must be a valid file (JPG, JPEG, PNG, GIF).')
    ];

// Multer //
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
    cb(null, path.join(__dirname,'../../public/img/users'));
    },
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
    })
    
    const upload = multer({ storage })



router.get("/", userController.userIndex);
router.get("/login", userController.login);
router.post("/login", validateLogin, userController.loginRequest);
router.get("/register", guestMiddleware, userController.userCreate); //users
router.post("/register",upload.single('userAvatar'),validateRegister,userController.register);
router.get('/detail/:id', userController.userDetail);
router.get("/edit", loggedMiddleware, userController.userEdit);
router.post('/update/:id', upload.single('userAvatar'), userController.userUpdate)


// testeando coneccion a  y q los modelos esten bien
router.get("/test", userController.sqltest);

router.get("/:id", userController.userDetail);

module.exports=router;