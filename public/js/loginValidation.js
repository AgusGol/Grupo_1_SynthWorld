window.addEventListener('load', () => {
    let form = document.querySelector('.login-form');
    let errorsJs = []
    let emailInput = document.querySelector('#userEmail');
    let emailError = document.querySelector('.email-error');
    let passwordInput = document.querySelector('#userPassword');
    let passwordError = document.querySelector('.password-error');
    let counter = 0;
    form.addEventListener('submit', (e) => {
        console.log('eee')
        counter = 0;
        e.preventDefault()
        if (emailInput.value == "") {
            emailError.innerText = "The email cannot be empty";
            counter = 1;
        } else if (!(emailInput.value.match(
            /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
          ))){
            console.log('bad email');
            emailError.innerText = "Please enter a valid email";
            counter = 1;
          }
          else {
            emailError.innerText = ""
          }

        if (passwordInput.value == "") {
            console.log('000')
            console.log(passwordError)
            passwordError.innerText = "The password cannot be empty";
            counter = 1;
        } else {
            passwordError.innerText = '';
         }
        if(counter == 0) {
            form.submit();
        }
    })

    emailInput.addEventListener('focusout', (e) => {
        if (emailInput.value == "") {
            emailError.innerText = "The email cannot be empty";
        }
        else if (!(emailInput.value.match(
            /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
          ))){
            console.log('bad email');
            emailError.innerText = "Please enter a valid email";
            counter = 1;
          }
          else {
            emailError.innerText = ""
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
