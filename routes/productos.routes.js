const express = require('express')
const router = express.Router()

const productos = require('../controllers/productosController.js')

router.get('/',productos.consultar)
router.post('/',productos.ingresar)

router.route('/:id')
    .get(productos.consultarUno)
    .put(productos.actualizar)
    .delete(productos.borrar)

module.exports = router