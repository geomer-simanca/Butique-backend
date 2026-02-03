const db = require('../db.js')
const BaseController = require('./base.controller.js')

class CuotaController extends BaseController{
    constructor(){
        super(db.cuotas, 'id')
    }
}

module.exports = new CuotaController()