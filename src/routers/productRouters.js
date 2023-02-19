const express = require("express");
const router= express.Router();
const path = require ("path");
const multer = require ('multer');
const validateProductCreation = require ("../middlewares/productValidateCreationMiddleware");
const validateProductUpdate = require('../middlewares/productValidateUpdateMiddleware')
// const admin = require('../middlewares/adminMiddleware') => para implementar los permisos del admin

// Controller require //
const productController= require("../controllers/productController");

// Multer //
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
    cb(null, path.join(__dirname,'../../public/img/products'));
    },
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
    })
    
    const upload = multer({ storage })

const adminMiddleware = require('../middlewares/adminMiddleware');


// Create one product //
router.get('/products/create', productController.productCreation); ////agregar más adelante acá el middleware admin
router.post('/products/create', upload.single('productImg'),validateProductCreation, productController.store); //products validateProductCreation

// Get one product //
router.get('/products/:id', productController.productDetail); //products

// Get all products //
router.get('/shop', productController.shop);

// Edit one product //
router.get('/products/edit/:id', productController.productEdition); 
router.put('/products/edit/:id', upload.single("images"),validateProductUpdate, productController.update);

// Delete one product //
router.delete('/products/delete/:id', productController.delete); 

module.exports=router;