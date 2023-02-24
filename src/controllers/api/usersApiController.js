const path = require('path');
const db = require('../../database/models');
const sequelize = db.sequelize;
const { Op } = require("sequelize");


//Aqui tienen otra forma de llamar a cada uno de los modelos
const Users = db.User;

const usersApiController = {
    'list': (req, res) => {
        db.User.findAll()
        .then(clientes => {
            let respuesta = {
                meta: {
                    status: 200,
                    count: clientes.length,
                    url: '/api/users'
                },
                data: clientes.map(cliente=>{
                    return{
                        id:cliente.id,
                        name:cliente.name,
                        email:cliente.email,
                        url:"/api/users/:"+ cliente.id,

                    }
                })
            }
                res.json(respuesta);
            })
    },
        
    'detail': (req, res) => {
        db.User.findByPk(req.params.id)
            .then(cliente => {
                let respuesta = {
                    meta: {
                        status: 200,
                        url: '/api/users/:id'
                    },
                    data: cliente=>{
                        return{
                            id:cliente.id,
                            name:cliente.name,
                            last_name:cliente.last_name,
                            email:cliente.email,
                            created_at:cliente.created_at,
                            updated_at:cliente.updated_at,
                            // image:"http://localhost:3031/api/clientes/:"+ cliente.id+cliente.image,
    
                        }
                    }
                }
                res.json(respuesta);
            });
    },
    
    
}

module.exports = usersApiController;
