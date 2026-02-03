const express = require('express')
const router = express.Router()
const cuotas = require('../controllers/cuotaController.js')

router.get('/',cuotas.consultar)
router.post('/',cuotas.ingresar)

router.route('/:id')
    .get(cuotas.consultarUno)
    .put(cuotas.actualizar)
    .delete(cuotas.eliminar)

    module.exports = router