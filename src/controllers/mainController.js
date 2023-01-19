const path = require ("path");

const mainController={

index:(req, res) => {
        if(req.session != undefined ){
        res.render('index', {session: req.session});
        }
        else {
        res.render('index');
        }
        },
about:(req, res) => {
        res.render('aboutUs');
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
    res.render('shop');
},

productCreation:(req, res) => {
    res.render("productCreation");
},
productEdition:(req, res) => {
    res.render("productEdition");
},
};
module.exports =mainController;
