const path = require('path');
const db = require('../../database/models');
const sequelize = db.sequelize;
const { Op } = require("sequelize");

//Recursos //
const Products = db.Product;
const Brands = db.Brand;
const Categorys = db.Category;
const ProductCategory = db.ProductCategory; 


const productsApiController ={

    list: (req, res) => {
        let productList= Products.findAll()
        let categoryList= Categorys.findAll()
        let brandList = Brands.findAll();
        let prod_catList = ProductCategory.findAll()
        let countCategory = [];
        Promise.all([productList,categoryList,prod_catList,brandList])
        .then(([products,categories,prods_cats, brands]) => {
           // console.log(prods_cats)
           let counterCat;
            categories.forEach((category, i) => {
                    counterCat = 0
                    prods_cats.forEach(p_cat =>{
                    if(p_cat.category_id == category.id){
                        counterCat++;
                    }
                })
                console.log(counterCat)
                countCategory[i] = counterCat

            });
            console.log(categories)
            let categoriesCounted = {};
            categories.forEach((category, i) => {
                let name = category.name
                categoriesCounted[name] = countCategory[i]
            })
            console.log(categoriesCounted)
            
            let respuesta = {
                meta: {
                    status: 200,
                    count: products.length,
                    url: '/api/products'
                },
                countByCategory: categoriesCounted
                    
                ,
                Products: products.map(product=>{
                    
                    return{
                        id:product.id,
                        name:product.name,
                        description:product.description,
                        price: product.price,
                        category:prods_cats.filter(prod_cat => prod_cat.product_id ==product.id ),
                        brand:brands.filter(brand=> brand.id==product.brand_id),
                        image:'/img/products/'+ product.image,

                        
                        detail:"/api/products/" + product.id,

                    }
                })
                
            }
                res.json(respuesta);
            })
    },
        
    detail: (req, res) => {
        let productDetail =Products.findByPk(req.params.id,{include:["brand"]});
        let brandDetail = Brands.findAll();
        let product_categoryDetail = ProductCategory.findAll();
        let categoryDetail = Categorys.findAll();
    Promise
        .all([productDetail,brandDetail,product_categoryDetail,categoryDetail])
        .then(([product,brands,prods_cats,category]) => {
            console.log("somos brand",brands)
                let respuesta = {
                    meta: {
                        status: 200,
                        url: '/api/products/:id'
                    },
                    data: {
                        
                        id:product.id,
                        name:product.name,
                        brand:brands.filter(brand=> brand.id==product.brand_id),                       
                        category:prods_cats.filter(prod_cat => prod_cat.product_id ==product.id ),
                        price:product.price,
                        discount:product.discount,
                        description:product.description,
                        extra_info:product.extra_info,
                        is_active:product.is_active,
                        created_at:product.created_at,
                        updated_at:product.updated_at,
                        image:'/api/products/imagen/'+product.image,
                            
    
                        
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