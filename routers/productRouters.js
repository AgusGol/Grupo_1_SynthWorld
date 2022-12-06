const express = require("express");
const router= express.Router();
const path = require ("path");
const multer = require ('multer');
const productController= require("../controllers/productController");

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
    cb(null, path.join(__dirname,'../public/img/products'));
    },
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
    })
    
    const upload = multer({ storage })

router.get('/products/create', productController.productCreation); //products
router.post('/products/create', upload.single('productImg'), productController.store); //products
router.get('/products/:id', productController.productDetail); //products
router.get('/shop', productController.shop);
router.get('/products/edit/:id', productController.productEdition); //products
router.put('/products/:id', productController.update);
router.post('/products/delete/:id', productController.delete);

module.exports=router;