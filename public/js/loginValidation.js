window.addEventListener('load', () => {
    let form = document.querySelector('.login-form');
    let errorsJs = []
    let emailInput = document.querySelector('#userEmail');
    let emailError = document.querySelector('.email-error');
    let passwordInput = document.querySelector('#userPassword');
    let passwordError = document.querySelector('.password-error');

    form.addEventListener('submit', (e) => {
        console.log('eee')
        e.preventDefault()
        if (emailInput.value == "") {
            emailError.innerText = "The email cannot be empty";
        }
        else if (passwordInput.value == "") {
            console.log('000')
            console.log(passwordError)
            passwordError.innerText = "The password cannot be empty";
            emailError.innerText = "";
        } else {
            form.submit();
        }
    })

    emailInput.addEventListener('keyup', (e) => {
        if (emailInput.value == "") {
            emailError.innerText = "The email cannot be empty";
        }
        else {
            emailError.innerText = "";
        }
    })
    passwordInput.addEventListener('keyup' , (e) => {
        if (passwordInput.value == "") {
            passwordError.innerText = "The password cannot be empty";
        }
        else {
            passwordError.innerText = "";
        }
    })
})
