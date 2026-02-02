const db = require('../db.js')

class ProductosController {
    constructor(){}

    async consultar(req,res){
        const productos = await db.productos.findMany()
        res.json(productos)
    }

    async consultarUno(req,res){
        try{
            const productoUnico = await db.productos.findUnique({
                where:{
                    codigo:req.params.id
                }
            })

            if (!productoUnico){
                return res.status(404).json({
                    error:"Producto no encontrado"
                })
            }
            return  res.json(productoUnico)

        }catch(error){
            res.status(500).json({error:error.message})
        }

    }

    async ingresar(req,res){
        try{
            const nuevoProducto = await db.productos.create({
                data:req.body
            })
            res.json(nuevoProducto)
        } catch(error){
            if (error.code === 'P2002'){
                return res.status(400).json({
                    error:"Ya existe un producto con este codigo"
                })
            }
        }

    }

    async actualizar(req,res){
        try{
            const productoActualizado = await db.productos.update({
                where:{
                    codigo:req.params.id
                },
                data:req.body
            })
            if (!productoActualizado){
                return res.status(404).json({
                    error:"Producto no encontrado"
                })
            }
            return res.json(productoActualizado)
        }catch(error){
            if (error.code === 'P2025'){
                return res.status(404).json({
                    error:"Producto no encontrado"
                })
            }
        }

    }

    async borrar(req,res){
        try{
            const datoborrado  =await db.productos.delete({
                where:{
                    codigo:req.params.id
                }
            })
            return res.json({
                message:"Producto eliminado correctamente",
                datoborrado
            })

        }catch(error){
            if (error.code === 'P2025'){
                return res.status(404).json({
                    error:"Producto no encontrado"
                })
            }
        }

    }
}

module.exports = new ProductosController();