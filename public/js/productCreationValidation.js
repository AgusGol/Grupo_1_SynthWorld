window.addEventListener('load', () => {
    let form = document.querySelector('form');
    let productName = document.querySelector('#productName')
    let productDescription = document.querySelector('#description')
    let productPrice = document.querySelector('#price')

//falta acomodar el submit. No me queda claro un detalle 
let errores = []; 
if (productName == " ") {
    errores.push("You must define a product name")
} else if (productName.value.length < 6) {
    errores.push("The product name must be at least 5 characters long")
}

if (productDescription == " ") {
    errores.push("You must define a product description")
} else if (productName.value.length < 21) {
    errores.push("The product description must be at least 21 characters long")
}

if (productPrice == " ") {
    errores.push("You must define a product price")
} else if (productPrice.value > 0) {
    errores.push("The product price must be greater than 0")
}
form.addEventListener("submit", function (e) {
if (errores.length > 0) {
    e.preventDefault();

    //pendiente: revisar estas líneas para mostrarlas como listado. Modificar el html
let errores = document.querySelector("div.errores");
for (let i = 0; i < errores.length; i++) {
    errores.innerHTML += errores[i]
}    
}
})

// agregar algunos eventos de mouse



//console.log(form)
//console.log(productName)
console.log(errores)
// console.log(productDescription)
// console.log(productExtraInfo)
// console.log(productPrice)
// console.log(productDiscount)








})
