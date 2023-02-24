const express = require('express');
const router = express.Router();
const path = require("path");
const usersApiController = require('../../controllers/api/usersApiController');

//Rutas
// //Listado de clientes
router.get('/', usersApiController.list);
// //Detalle de un cliente
router.get('/:id', usersApiController.detail);


module.exports = router;