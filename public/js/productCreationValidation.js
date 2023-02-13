window.addEventListener('load', () => {
    let form = document.querySelector('form');
    let productName = document.querySelector('#productName')
    let productDescription = document.querySelector('#description')
    let productPrice = document.querySelector('#price')

    form.addEventListener("submit", function (evento) {
        if(!validaciones(evento)){
            evento.preventDefault();
        } else{
            form.submit();
        }
        function validaciones (evento) {

    //falta acomodar el submit. No me queda claro un detalle 
    let errores = []; 
if (productName.value == "") {
    errores.push("You must define a product name");
} else if (productName.value.length < 6) {
    errores.push("The product name must be at least 5 characters long");
} else{
    errores.push("")
} 

if (productDescription.value == "") {
    errores.push("You must define a product description");
} else if (productName.value.length < 21) {
    errores.push("The product description must be at least 21 characters long");
} else{
    errores.push("")
}

if (productPrice.value == "") {
    errores.push("You must define a product price")
} else if (productPrice.value > 0) {
    errores.push("The product price must be greater than 0")
} else{
    errores.push("")
}


    //pendiente: revisar estas líneas para mostrarlas como listado. Modificar el html
let ulErrores = document.getElementById('errores');
if(errores.length > 0){
    evento.preventDefault();
    ulErrores.innerHTML="";
for (let i = 0; i < errores.length; i++) {
    ulErrores.innerHTML += `<li> ${errores[i]} </li> `}
    errores = [];    
} else {
    return true;
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
