window.addEventListener('load', () => {
    let form = document.querySelector('form');
    let productName = document.querySelector('#productName')
    let productDescription = document.querySelector('#description')
    let productExtraInfo = document.querySelector('#extraInfo')
    let productPrice = document.querySelector('#price')
    let productDiscount = document.querySelector('#discount')


form.addEventListener("submit", function (e) {
    e.preventDefault();

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


})


console.log(form)
console.log(productName)
console.log(errores)
// console.log(productDescription)
// console.log(productExtraInfo)
// console.log(productPrice)
// console.log(productDiscount)








})
