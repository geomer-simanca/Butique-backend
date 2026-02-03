const express = require('express');
const router = express.Router();

const carritodetalle = require('../controllers/carritodetalleController.js');

router.get('/',carritodetalle.consultar);
router.post('/',carritodetalle.ingresar);

router.route('/:id')
    .get(carritodetalle.consultarUno)
    .put(carritodetalle.actualizar)
    .delete(carritodetalle.eliminar);

module.exports = router;