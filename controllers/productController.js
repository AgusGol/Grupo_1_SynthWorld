const path = require ("path");
const fs = require('fs');
const productsFilePath = path.join(__dirname, '../data/productsDataBase.json');
const products = JSON.parse(fs.readFileSync(productsFilePath, 'utf-8'));

const productController={

productDetail:(req, res) => {
    let productM = products.filter((element) => {
        return element.id == req.params.id
        });
    let product = productM[0];
    res.render('productDetail',{product});
},

shop:(req, res) => {
    res.render('shop', {products});
},

productCreation:(req, res) => {
    res.render("productCreation");
},
store: (req, res, next) => {
    console.log("reqfile",req.file);
    let lastProductIndex = products.length -1;
    let newProduct = {};
    if (products == "") {
        newProduct = {
            id : 1,
            name: req.body.name,
            price: req.body.price,
            category: req.body.category,
            description : req.body.description,
            includes : req.body.includes,
            specs : req.body.specs,
            img : req.field.filename
        }
    }
    else { 
        newProduct = {
            id : products[lastProductIndex].id + 1,
            name: req.body.name,
            price: req.body.price,
            category: req.body.category,
            description : req.body.description,
            includes : req.body.includes,
            specs : req.body.specs,
            img: req.file.filename,
    }
}


    console.log("ESTO ES newProduct", newProduct);
    products.push(newProduct);
    let productsJSON = JSON.stringify(products, null, '\t');
    fs.writeFileSync(productsFilePath, productsJSON , "");
    console.log(req.file);
    res.redirect('/shop');
},
productEdition:(req, res) => {
    res.render("productEdition");
},
};
module.exports = productController;