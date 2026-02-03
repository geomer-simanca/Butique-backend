const db = require('../db.js')
const BaseController = require('./base.controller.js')

class CarritoController extends BaseController{
    constructor(){
        super(db.carrito, 'id')
    }

}

module.exports = new CarritoController()