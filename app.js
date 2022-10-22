const express = require("express");
const app = express();
const path = require('path');

//para decirle al server en que carpeta estan ubicados los elementos estaticos (fotos y style)
app.use(express.static('public'));

app.listen(3031, () => {
    console.log('Servidor arriba en el puerto 3031');
});

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, "/views/index.html"))
})