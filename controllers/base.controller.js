class BaseController{
    constructor(model , keyName = 'id'){
        this.model = model;
        this.keyName = keyName;

        // Bind todos los métodos al contexto correcto
        this.consultar = this.consultar.bind(this);
        this.consultarUno = this.consultarUno.bind(this);
        this.ingresar = this.ingresar.bind(this);
        this.actualizar = this.actualizar.bind(this);
        this.eliminar = this.eliminar.bind(this);


    }

    async consultar(req,res){
        const data = await this.model.findMany();
        res.json(data)
    }

    async consultarUno(req,res){
        try{
            const item = await this.model.findUnique({
                where:{
                    [this.keyName]:req.params.id
                }
            })

            if (!item){
                return res.status(404).json({
                    error : `${req.params.id} no encontrado`
                })
            }

            res.json(item)
        }catch(error){
            res.status(500).json({error:error.message})
        }
    }

    async ingresar(req,res){
        try{
            const nuevoDato = await this.model.create({
                data:req.body
            })
            res.json(nuevoDato)
        } catch(error){
            if (error.code === 'p2002'){
                return res.status(400).json({
                    error:`Ya existe un registro con este ${this.keyName}`
                })
            }

            res.status(500).json({error:error.message})
        }
    }

    async actualizar(req,res){
        try{
            const datoActualizado = await this.model.update({
                where:{
                    [this.keyName]:req.params.id
                },
                data:req.body
            })
            res.json(datoActualizado)
        }catch(error){
            if (error.code === 'P2025'){
                return res.status(404).json({
                    error:`${req.params.id} no encontrado`
                })
            }

            res.status(500).json({error:error.message})
        }
    }

    async eliminar(req,res){
        try{
            const datoBorrado = await this.model.delete({
                where:{
                    [this.keyName]:req.params.id
                }
            })

            res.json({
                message:'registro eliminado correctamente',
                datoBorrado
            })
        }catch(error){
            if (error.code === 'P2025'){
                return res.status(404).json({
                    error:`${req.params.id} no encontrado`
                })
            }
            res.status(500).json({error:error.message})
        }
    }





}

module.exports = BaseController