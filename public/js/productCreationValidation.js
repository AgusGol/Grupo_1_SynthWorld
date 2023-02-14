window.addEventListener('load', () => {
    let form = document.querySelector('form');
    let productName = document.querySelector('#productName')
    let productDescription = document.querySelector('#description')
    let productPrice = document.querySelector('#price')
    let productImage = document.querySelector('#productImage')

    let productImageError = document.querySelector('.productImageError');


    form.addEventListener("submit", function (evento) {
        if(!validaciones(evento)){
            evento.preventDefault();
        } else{
            form.submit();
        }
        function validaciones (evento) {

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
    errores.push("The product price must be at least 1$")
} else{
    errores.push("")
}

if(productImage.value != ''){

    if(!(productImage.value.slice(productImage.value.length - 5, productImage.value.length).includes('jpg')
    || productImage.value.slice(productImage.value.length - 5, productImage.value.length).includes('jpeg') 
    || productImage.value.slice(productImage.value.length - 5, productImage.value.length).includes('png')
    || productImage.value.slice(productImage.value.length - 5, productImage.value.length).includes('gif'))) {
        counter = 1;
        productImageError.innerText = "The image must be jpg, jpeg, png or gif."
    }
    else {
        productImageError.innerHTML = ''
    }
}

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
//console.log(errores)
// console.log(productDescription)
// console.log(productExtraInfo)
// console.log(productPrice)
// console.log(productDiscount)
console.log(productImage)
})
