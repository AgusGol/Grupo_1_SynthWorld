const path = require ("path")

const mainController={

index:(req, res) => {
        res.sendFile(path.resolve("./views/index.html"))    
        },
login:(req, res) => {
    res.sendFile(path.resolve("./views/login.html"))    
    },
register:(req, res) => {
    res.sendFile(path.resolve("./views/register.html"))    
    },      

productCart: (req, res) => {
    res.sendFile(path.resolve("./views/productCart.html"))
},

productDetail:(req, res) => {
    res.sendFile(path.resolve("./views/productdetail.html"))
}
}

module.exports =mainController
