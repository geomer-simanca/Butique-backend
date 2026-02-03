const express = require('express')
const router = express.Router()

const carritos = require('../controllers/carritoController.js')

router.get('/',carritos.consultar)
router.post('/',carritos.ingresar)

router.route('/:id')
    .get(carritos.consultarUno)
    .put(carritos.actualizar)
    .delete(carritos.eliminar)

module.exports = router