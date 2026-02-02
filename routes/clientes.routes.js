const express = require('express')
const router = express.Router()
const clientesController = require('../controllers/clientesControllers.js')

router.get('/', clientesController.consultar)

router.post('/', clientesController.ingresar)

router.route('/:id')
    .get(clientesController.consultarUno)
    .put(clientesController.actualizar)
    .delete(clientesController.borrar)



module.exports = router