const express = require("express");
const router= express.Router();
const path = require ("path");
const multer = require ('multer');
const userController= require("../controllers/userController");
// const { check } = require('express-validator');
const guestMiddleware = require('../middlewares/guestMiddleware');
const loggedMiddleware = require('../middlewares/loggedMiddleware');
const validateRegister = require("../middlewares/validateRegisterMiddleware");
const validateLogin = require('../middlewares/validateLoginMiddleware');



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
router.get("/login", guestMiddleware, userController.login);
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