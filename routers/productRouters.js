const express = require("express");
const router= express.Router();
const productController= require("../controllers/productController");

router.get('/products/create', productController.productCreation); //products
router.post('/products/create', productController.store); //products
router.get('/products/:id', productController.productDetail); //products
router.get('/shop', productController.shop); //products
router.get('/products/edit/:id', productController.productEdition); //products

module.exports=router;