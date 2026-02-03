const express = require('express')
const router = express.Router()
const facturas = require('../controllers/facturaController.js')

router.get('/',facturas.consultar)
router.post('/',facturas.ingresar)

router.route('/:id')
    .get(facturas.consultarUno)
    .put(facturas.actualizar)
    .delete(facturas.eliminar)

module.exports = router