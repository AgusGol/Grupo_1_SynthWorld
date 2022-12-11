const express = require("express");
const app = express();
const path = require('path');
const mainRouters = require("./routers/mainRouters")
const methodOverride = require('method-override'); //para poder implementar los métodos PUT y DELETE:



app.set("view engine", "ejs");

app.listen(3031, () => {
    console.log('Servidor arriba en el puerto 3031');
});

//para decirle al server en que carpeta estan ubicados los elementos estaticos (fotos y style)
app.use(express.static('public'));

//para poder usar metodo POST
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

//para put y delete
app.use(methodOverride('_method'));
app.use("/",mainRouters)



app.use((req, res, next) => {
    res.status(404).send('We are sorry, but the page you were looking for was not found');
    })

