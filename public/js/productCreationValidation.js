window.addEventListener('load', () => {
    let form = document.querySelector('form');
    let productName = document.querySelector('#productName')
    let productDescription = document.querySelector('#description')
    let productPrice = document.querySelector('#price')
    let productImage = document.querySelector('#productImage')

    let productImageError = document.querySelector('.productImageError');


    form.addEventListener("submit", function (evento) {
        function validaciones (evento) {

    let errores = []; 
if (productName.value == "") {
    errores.push("You must define a product name");
} else if (productName.value.length < 5) {
    errores.push("The product name must be at least 5 characters long");
} else{
    errores.push("")
} 

if (productDescription.value == "") {
    errores.push("You must define a product description");
} else if (productDescription.value.length < 21) {
    errores.push("The product description must be at least 21 characters long");
} else{
    errores.push("")
}

if (productPrice.value == "") {
    errores.push("You must define a product price")
} else if (productPrice.value <= 0) {
    errores.push("The product price must more than 0")
} else{
    errores.push("")
}

if(productImage.value != ''){
    let pImage = productImage.value.slice(productImage.value.length - 5, productImage.value.length);
    if(!(pImage.includes('jpg') || pImage.includes('jpeg')  || pImage.includes('png') || pImage.includes('gif'))) {
        counter = 1;
    //    productImageError.innerText = "The image must be jpg, jpeg, png or gif."
        errores.push("The image must be jpg, jpeg, png or gif.")
    }
    else {
        productImageError.innerHTML = ''
    }
}else  {
    //productImageError.innerHTML = 'You must select an image'
    errores.push('You must select an image')
    counter = 1;
}


let ulErrores = document.getElementById('errores');
let errorsSend = errores.filter(error => error != "")
if(errorsSend.length > 0){
    evento.preventDefault();
    ulErrores.innerHTML="";
for (let i = 0; i < errorsSend.length; i++) {
    ulErrores.innerHTML += `<li> ${errorsSend[i]} </li> `}
    errores = []; 
    errorsSend = [];   
} else {
    return true;
}
}
if(!validaciones(evento)){
    evento.preventDefault();
} else{
    form.submit();
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
