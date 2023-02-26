const express = require('express');
const router = express.Router();
const path = require("path");
const productsApiController = require('../../controllers/api/productsApiController');

//Rutas
// //Listado de clientes
router.get('/', productsApiController.list);
// //Detalle de un cliente
router.get('/:id', productsApiController.detail);
// Imagen del Producto// 
router.get('/imagen/:img',productsApiController.images)
module.exports = router;