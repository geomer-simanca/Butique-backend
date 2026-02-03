const db = require('../db.js')
const BaseController = require('./base.controller.js')

class FacturaController extends BaseController{
    constructor(){
        super(db.factura, 'id')
    }
}

module.exports = new FacturaController()