const db = require('../db.js')
const BaseController = require('./base.controller.js')

class carritodetalleController extends BaseController{
    constructor(){
        super(db.carrito_detalle, 'id')
    }
}

module.exports = new carritodetalleController()