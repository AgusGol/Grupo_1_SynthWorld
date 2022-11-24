const express = require("express");
const router= express.Router();
const productController= require("../controllers/productController");


router.get('/productDetail', productController.productDetail); //products
router.get('/shop', productController.shop); //products
router.get('/productCreation', productController.productCreation); //products
router.get('/productEdition', productController.productEdition); //products

module.exports=router;