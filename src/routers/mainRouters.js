const express = require("express");
const router= express.Router();
const mainController= require("../controllers/mainController");
const productRouters = require("./productRouters");
const userRouters = require("./userRouters")

router.get("/", mainController.index);
router.get("/home", mainController.index);
router.get("/aboutUs",mainController.about)
// router.get("/login", mainController.login); //users
// router.get("/register", mainController.register); //users
router.get('/productCart', mainController.productCart);
router.use('/users', userRouters);
router.use('/', productRouters);
 

// router.get('/productDetail', mainController.productDetail); //products
// router.get('/shop', mainController.shop); //products
// router.get('/productCreation', mainController.productCreation); //products
// router.get('/productEdition', mainController.productEdition); //products


module.exports=router;