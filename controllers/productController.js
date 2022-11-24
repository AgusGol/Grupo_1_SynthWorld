const path = require ("path");

const productController={

productDetail:(req, res) => {
        res.render('productDetail');
},

shop:(req, res) => {
    res.render('shop');
},

productCreation:(req, res) => {
    res.render("productCreation");
},
productEdition:(req, res) => {
    res.render("productEdition");
},
};
module.exports = productController;
