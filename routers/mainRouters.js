const express = require("express");
const router= express.Router();
const mainController= require("../controllers/mainController");

router.get("/", mainController.index);
router.get("/home", mainController.index);
router.get("/login", mainController.login);
router.get("/register", mainController.register);
router.get('/productCart', mainController.productCart);
router.get('/productDetail', mainController.productDetail);
router.get('/shop', mainController.shop);
/*router.get('/home',mainController.index)*/

module.exports=router;