const express = require("express");
const app = express();
const path = require('path');

//para decirle al server en que carpeta estan ubicados los elementos estaticos (fotos y style)
app.use(express.static(path.join(__dirname, 'public')));

app.listen(3031, () => {
    console.log('Servidor arriba en el puerto 3031');
});

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, "/views/index.html"))
});

app.get('/home', (req, res) => {
    res.sendFile(path.join(__dirname, "/views/index.html"))
});

app.get('/login', (req, res) => {
    res.sendFile(path.join(__dirname, "/views/login.html"))
});

app.get('/productCart', (req, res) => {
    res.sendFile(path.join(__dirname, "/views/productCart.html"))
});

app.get('/productDetail', (req, res) => {
    res.sendFile(path.join(__dirname, "/views/productdetail.html"))
});

app.get('/register', (req, res) => {
    res.sendFile(path.join(__dirname, "/views/register.html"))
});