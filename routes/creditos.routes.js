const express = require('express')
const router = express.Router()
const creditos = require('../controllers/creditosController.js')

router.get('/',creditos.consultar)
router.post('/',creditos.ingresar)

router.route('/:id')
    .get(creditos.consultarUno)
    .put(creditos.actualizar)
    .delete(creditos.eliminar)

module.exports = router