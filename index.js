const express = require('express')
const cors = require('cors')

const app = express()
const clientesRoutes = require('./routes/clientes.routes.js')
const productosRouter = require('./routes/productos.routes.js')
const carritoRouter = require('./routes/carritos.routes.js')
const creditosRoutes = require('./routes/creditos.routes.js')
const cuotasRoutes = require('./routes/cuotas.routes.js')
const facturasRoutes = require('./routes/factura.routes.js')
const carritodetalleRouter = require('./routes/carritoDetalle.routes.js')
const pagointeresRouter = require('./routes/pagointereses.routes.js')

app.use(express.json())
app.use(cors())

app.get('/', (req,res)=>{
    res.send('raiz de la api')
})

app.use('/clientes', clientesRoutes)
app.use('/productos', productosRouter)
app.use('/carritos', carritoRouter)
app.use('/creditos', creditosRoutes)
app.use('/cuotas', cuotasRoutes)
app.use('/facturas', facturasRoutes)
app.use('/carritodetalle', carritodetalleRouter)
app.use('/pagointereses', pagointeresRouter)



app.listen(3000, ()=>{
    console.log('server esta corriendo en el puerto 3000')
})