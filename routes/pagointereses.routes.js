const express = require('express');
const router = express.Router();

const pagointereses = require('../controllers/pagointeresesController.js');

router.get('/', pagointereses.consultar);
router.post('/', pagointereses.ingresar);

router.route('/:id')
    .get(pagointereses.consultarUno)
    .put(pagointereses.actualizar)
    .delete(pagointereses.eliminar);

module.exports = router;