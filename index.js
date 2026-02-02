const express = require('express')
const cors = require('cors')

const app = express()
const clientesRoutes = require('./routes/clientes.routes.js')
const productosRouter = require('./routes/productos.routes.js')

app.use(express.json())
app.use(cors())

app.get('/', (req,res)=>{
    res.send('raiz de la api')
})

app.use('/clientes', clientesRoutes)
app.use('/productos', productosRouter)


app.listen(3000, ()=>{
    console.log('server esta corriendo en el puerto 3000')
})