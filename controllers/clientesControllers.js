const db = require ("../db");

class ClientesControllers {
    constructor(){
    }

    async consultar(req,res){
        const clientes = await db.clientes.findMany()
        res.json(clientes);

    }

    async consultarUno(req,res){
        const id = req.params.id;
        const cliente = await db.clientes.findUnique({
            where:{
                cedula:id
            }
        })

        if (!cliente){
            return res.status(404).json({
                error:"Cliente no encontrado"
            });
        }
        return res.json(cliente);

    }

    async ingresar(req,res){ 
        try{

        
            const newClient = await db.clientes.create({
                data:req.body
            })

            res.json(newClient);
        }catch(error){
            if (error.code === 'P2002') {
                return  res.status(400).json({
                    error: "ya hay un cliente con esta cedula"
                });
            }
            return res.status(500).json({
                error:"Error al crear el cliente",
                details:error.message
            })

        }

            



    }

    async actualizar(req,res){
        try{
            const clienteActualizado = await db.clientes.update({
                where:{
                    cedula:req.params.id
                },
                data:req.body
            })
            res.json(clienteActualizado);
        }catch(error){
            if (error.code === 'P2025') {
                return res.status(404).json({
                    error:"Cliente no encontrado"
                });
            }
            res.status(500).json({
                error:"Error al actualizar el cliente",
                details:error.message
            })
        }
    }

    async borrar(req,res){
        try{

        

            const clienteBorrado = await db.clientes.delete({
                where:{
                    cedula:req.params.id
                }
            })
            return res.json(clienteBorrado);
        }catch(error){
            if (error.code === 'P2025') {
                return res.status(404).json({
                    error:"Cliente no encontrado"
                });
            }
        }

        return res.json(clienteBorrado);
    
    }


}

module.exports = new ClientesControllers();