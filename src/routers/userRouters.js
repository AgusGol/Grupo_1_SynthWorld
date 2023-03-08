const express = require("express");
const router= express.Router();
const path = require ("path");
const multer = require ('multer');
const userController= require("../controllers/userController");
// const { check } = require('express-validator');
const guestMiddleware = require('../middlewares/guestMiddleware');
const loggedMiddleware = require('../middlewares/loggedMiddleware');
const adminMiddleware = require('../middlewares/adminMiddleware');
const cookieLoginMiddleware = require('../middlewares/cookieLoginMiddleware')
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



router.get("/", adminMiddleware, userController.userIndex);
router.get("/login", cookieLoginMiddleware, guestMiddleware, userController.login);
router.post("/login", validateLogin, userController.loginRequest);
router.get("/register", guestMiddleware, userController.userCreate); //users
router.post("/register",upload.single('userAvatar'),validateRegister,userController.register);
router.get('/detail/:id', userController.userDetail);
router.get("/edit", loggedMiddleware, userController.userEdit);
router.post('/update/:id', upload.single('userAvatar'), userController.userUpdate)
router.get('/logout', userController.logout)

//esta ruta tiene que ir al final
router.get('/:userAvatar', upload.single('userAvatar'), userController.userAvatar)

router.get("/:id", userController.userDetail);

module.exports=router;