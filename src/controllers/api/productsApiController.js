const path = require('path');
const db = require('../../database/models');
const sequelize = db.sequelize;
const { Op } = require("sequelize");

//Recursos //
const Products = db.Product;
const Brand = db.Brand;
const Categorys = db.Category;
const ProductCategory = db.ProductCategory; 


const productsApiController ={

    list: (req, res) => {
        let productList= Products.findAll()
        let categoryList= Categorys.findAll()
        let prod_catList = ProductCategory.findAll()
        Promise.all([productList,categoryList,prod_catList])
        .then(([products,categorys,prods_cats]) => {
            
            let respuesta = {
                meta: {
                    status: 200,
                    count: products.length,
                    url: '/api/products'
                },
                countByCategory: {

                },
                Products: products.map(product=>{
                    
                    return{
                        id:product.id,
                        name:product.name,
                        description:product.description,
                        category:prods_cats.filter(prod_cat => prod_cat.product_id ==product.id ),
                        
                        detail:"/api/products/"+ product.id,

                    }
                })
                
            }
                res.json(respuesta);
            })
    },
        
    detail: (req, res) => {
        Products.findByPk(req.params.id)
            .then(product => {
                let respuesta = {
                    meta: {
                        status: 200,
                        url: '/api/users/:id'
                    },
                    data: {
                        
                        id:product.id,
                        name:product.name,
                        brand:{},
                        category:{},
                        price:product.price,
                        discount:product.discount,
                        description:product.description,
                        extra_info:product.extra_info,
                        is_active:product.is_active,
                        created_at:product.created_at,
                        updated_at:product.updated_at,
                        image:'/api/users/products/'+product.image,
                            
    
                        
                    }
                }
                res.json(respuesta);
            });
    },
    images:(req,res) =>{
        res.redirect('/img/products/' + req.params.img)
    }
    
    

}
module.exports= productsApiController;