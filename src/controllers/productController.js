const path = require ("path");
const fs = require('fs');
const {validationResult} = require ('express-validator');
// const productsFilePath = path.join(__dirname, '../data/productsDataBase.json');
// const products = JSON.parse(fs.readFileSync(productsFilePath, 'utf-8'));
const db = require('../database/models');
const sequelize = db.sequelize;

// Constantes de los Modelos citados//
const Brand = db.Brand;
const Product = db.Product;
const Category = db.Category;
const ProductCategory = db.ProductCategory;

const productController={

// productDetail:(req, res) => {
//     let productM = products.filter((element) => {
//         return element.id == req.params.id
//         });
//     let product = productM[0];
//     res.render('productDetail',{product});
// },
productDetail:(req, res) => {
    Product.findByPk(req.params.id)
    .then((product) => res.render('productDetail',{product}));
    },

// shop:(req, res) => {
//     res.render('shop', {products});
// },
shop: (req, res) => {
    Product.findAll().then((products) => res.render('shop', {products}));
},
productCreation:(req, res) => {
    let categoryP = Category.findAll();  
    let brandP = Brand.findAll();
    Promise
        .all([categoryP, brandP])
        .then(([categories, brands]) => { res.render('productCreation', {categories,brands})})
        .catch(error => res.send(error))
},
store: (req, res) => {
    let categoriesP = Category.findAll();  
    let brandP = Brand.findAll();
    //guarda los errores, nose porque llegan vacios.
    let resultValidation = validationResult(req);
    // return res.send(resultValidation);
    if(!resultValidation.isEmpty()){
                Promise
        .all([categoriesP, brandP])
        .then(([categories, brands]) => {
        console.log(categories)
        return res.render("productCreation",{ 
        errors:resultValidation.mapped(), oldData:req.body,categories,brands
    })});
}    
    else{
    Product.create({
        name: req.body.name,
        brand_id :req.body.brand_id,
        price: req.body.price == "" ? 0.01 :req.body.price,
        discount: req.body.discount == "" ? 0 : req.body.discount / 100,
        image: req.file ? req.file.filename : "defaultProductImage.png",
        is_active : req.body.isActive == 'on' ? 1 : 0,
        description : req.body.description,
        extraInfo : req.body.extraInfo
    })
    .then((product) => {
        console.log(2)  
        console.log()
        if(req.body.category2 != 0) {
                
                let category1 = db.ProductCategory.create({
                product_id: product.id,
                category_id: req.body.category});
    
                let category2 = db.ProductCategory.create({
                    product_id: product.id,
                    category_id: req.body.category2});
    
                Promise.all([category1, category2])
                .then(() => res.redirect('/shop') )
            }
            else {
                db.ProductCategory
                    .create({
                    product_id: product.id,
                    category_id: req.body.category})
                    .then(() => {
                    console.log(4)
                    res.redirect('/shop')}
                    )}
                
    })
    console.log (validationResult)
    // .catch(err => res.render(err))





//     console.log("reqfile",req.file);
//     let lastProductIndex = products.length -1;
//     let newProduct = {};
//     if (products == "") {
//         newProduct = {
//             id : 1,
//             name: req.body.name,
//             price: req.body.price,
//             category: req.body.category,
//             description : req.body.description,
//             extraInfo : req.body.extraInfo,
//             img : req.field.filename
//         }
//     }
//     else { 
//         newProduct = {
//             id : products[lastProductIndex].id + 1,
//             name: req.body.name,
//             price: req.body.price,
//             category: req.body.category,
//             description : req.body.description,
//             extraInfo : req.body.extraInfo,
//             img: req.file.filename,
//     }
// }


//     console.log("ESTO ES newProduct", newProduct);
//     products.push(newProduct);
//     let productsJSON = JSON.stringify(products, null, '\t');
//     fs.writeFileSync(productsFilePath, productsJSON , "");
//     console.log(req.file);
//     res.redirect('/shop');
}},

productEdition:(req, res) => { 
    let productId = req.params.id;
    // console.log(Category);
    let editProduct = Product.findByPk(productId,{include:["brand"]});
    let productCategory = ProductCategory.findAll({where:{product_id:productId}});
    let category = Category.findAll()
    // let editCateg = productCategory();
    let allBrand = Brand.findAll();
    Promise
    .all([productCategory, editProduct, category, allBrand])
    .then(([productCategory, product, allCategory, allBrand]) => {
        console.log('prod',productCategory[1])
        console.log('length', productCategory.length)
        return res.render('productEdition', {productCategory,product,allCategory, allBrand})
    })
        .catch(error => res.send(error))
    // .then((product) =>  res.render("productEdition", {product}));
},

update: (req,res) => {
    let productId = req.params.id;
    let editProduct = Product.findByPk(productId,{include:["brand"]});
    let productCategory = ProductCategory.findAll({where:{product_id:productId}});
    let category = Category.findAll()
    let allBrand = Brand.findAll();
    let resultValidation = validationResult(req);
    console.log(resultValidation)
    // return res.send(resultValidation);
    if(!resultValidation.isEmpty()){
        Promise
        .all([productCategory, editProduct, category, allBrand])
        .then(([productCategory, product, allCategory, allBrand]) => {
        return res.render('productEdition', {errors:resultValidation.mapped(),oldData:req.body, productCategory,product,allCategory, allBrand})
    })
        // Promise
        // .all([categoriesP, brandP])
        // .then(([categories, brands]) => {
        // console.log(Array.from(validationResult))
        // return res.render("productEdition",{ oldData:req.body,categories,brands
        //  })})
        }
         else {

        let idP = req.params.id;
        let product
        Product.findByPk(idP)
        .then(data => {
        Product.update(
        {
        name: req.body.name,
        brand_id :req.body.brand_id,
        price: req.body.price,
        discount: req.body.discount / 100,
        image: req.file ? req.file.filename : data.image,
        is_active : req.body.isActive == 'on' ? 1 : 0,
        description : req.body.description,
        extra_info : req.body.extraInfo
        
    }, {
        where: {id : idP}
    })})
    .then(()=> {
        ProductCategory.destroy({
            where: {
                product_id : idP
            }
        })
        .then(() => {

            if(req.body.category2 != 0) {
                let category1 = db.ProductCategory.create({
                product_id: idP,
                category_id: req.body.category});
    
                let category2 = db.ProductCategory.create({
                    product_id: idP,
                    category_id: req.body.category2});
    
                Promise.all([category1, category2])
                .then(() => res.redirect('/shop') )
            }
            else {
                db.ProductCategory
                    .create({
                    product_id: idP,
                    category_id: req.body.category})
                    .then(() => res.redirect('/shop') )
            }
        })
    })}

//     /*let id = req.params.id;*/
//     let product = req.params.id;
//     /*console.log("req",req)*/
//     let updateInfoProduct = {}
//     console.log("Body",req.body);
//     console.log("file",req.file);
//     if (req.body) {
//         updateInfoProduct = {
//             id : product.id,
//             name: req.body.name,
//             price: req.body.price,
//             category: req.body.category,
//             description : req.body.description,
//             extraInfo : req.body.extraInfo,
//             img: req.file ? req.file.filename : product.img 
//     };
//     }
// console.log("updateinfoproduct", updateInfoProduct)

//     let productToEdit = products.map(product =>{
//         if(updateInfoProduct.id==product.id){
//             return product = updateInfoProduct
//         }
//         else {return product}
//     })
//     fs.writeFileSync(productsFilePath, JSON.stringify(productToEdit, null, '\t'));
//     res.redirect("/shop",);
},
delete: (req, res) => {
    let id = req.params.id;
    console.log(id)
  //  let productToDelete = products.filter(product => product.id != id);
   // fs.writeFileSync(productsFilePath, JSON.stringify(productToDelete, null, '\t'));
    ProductCategory.destroy({
    where : {
        product_id: id
    }
   })
   .then(data => { Product.destroy({
        where:{
             id : req.params.id
            }
        })
    .then(() => res.redirect('/shop',))
    .catch(err => res.send(err));
    })
    .catch(err => res.send(err));
},

};
module.exports = productController;
