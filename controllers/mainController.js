const path = require ("path");

const mainController={

index:(req, res) => {
        res.render('index');
        },
login:(req, res) => {
        res.render('login');
    },
register:(req, res) => {
        res.render('register');
    },      

productCart: (req, res) => {
        res.render('productCart');
},

productDetail:(req, res) => {
        res.render('productDetail');
},

shop:(req, res) => {
    res.sendFile(path.resolve("./views/shop.html"));
},

productCreation:(req, res) => {
    res.sendFile(path.resolve("./views/productCreation.html"));
},
productEdition:(req, res) => {
    res.sendFile(path.resolve("./views/productEdition.html"));
},

/*shop:(req, res) => {
    res.sendFile(path.resolve("./views/shop.html"))
}*/
};
module.exports =mainController;
