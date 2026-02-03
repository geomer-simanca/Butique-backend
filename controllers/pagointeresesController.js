const db = require('../db.js')

const BaseController = require('./base.controller.js')

class pagointeresesController extends BaseController{
    constructor(){
        super(db.pago_interes, 'id')
    }
}

module.exports = new pagointeresesController()