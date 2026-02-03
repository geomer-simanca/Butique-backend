const db =  require('../db.js')
const BaseController = require('./base.controller.js')

class CreditosController extends BaseController{
    constructor(){
        super(db.creditos, 'id')
    }
}

module.exports = new CreditosController()