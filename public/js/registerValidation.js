window.addEventListener('load', () => {
    let form = document.querySelector('form');
    let emailInput = document.querySelector('#email-input');
    let passwordInput = document.querySelector('#password-input');
    let password2Input = document.querySelector('#password2-input');
    let nameInput = document.querySelector('#name-input');
    let lastNameInput = document.querySelector('#last-name-input')
    let imageInput = document.querySelector('#image-input')
    
    let emailError = document.querySelector('.email-error');
    let passwordError = document.querySelector('.password-error');
    let password2Error = document.querySelector('.password2-error');
    let nameError = document.querySelector('.name-error');
    let lastNameError = document.querySelector('.last-name-error');
    let imageError = document.querySelector('.image-error');
    let counter = 0;

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        counter = 0;
        if (emailInput.value == "") {
            emailError.innerText = "The email cannot be empty";
            counter = 1;
        } else if (!(emailInput.value.match(
                /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
              ))){
                console.log('bad email');
                emailError.innerText = "Please enter a correct email";
                counter = 1;
                
              }
              else {
                emailError.innerText = "";
            }
        

    
        if (passwordInput.value == "") {
            passwordError.innerText = "You must choose a password";
            counter = 1;
        } else if (passwordInput.value.length < 8) {
            passwordError.innerText = "Password minimun length is 8"
            counter = 1;
        } else if (!(passwordInput.value.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){8,}$/
            ))) {
            passwordError.innerText = 'Must contain at least eight characters, one lower case character, one upper case character, one number and one special character.'
            counter = 1;
        }
        else {
            passwordError.innerText='';
        }
        if (password2Input.value != passwordInput.value) {
            password2Error.innerText = 'Passwords do not match';
            counter = 1;
        } else {
            password2Error.innerHTML = "";
        }

        if (nameInput.value == "") {
            nameError.innerText = "You must enter your name";
            counter = 1;
        } else if (nameInput.value.length < 2) {
            nameError.innerText = "Name minimun length is 2"
            counter = 1;
        } else {
            nameError.innerText='';
        }

        if (lastNameInput.value == "") {
            lastNameError.innerText = "You must enter your last name";
            counter = 1;
        } else if (lastNameInput.value.length < 2) {
            lastNameError.innerText = "Last name minimun length is 2"
            counter = 1;
        } else {
            lastNameError.innerText='';
        }

        if(imageInput.value != ''){
            let uImage = imageInput.value.slice(imageInput.value.length - 5, imageInput.value.length);
            if(!(uImage.includes('jpg') || uImage.includes('jpeg') || uImage.includes('png') || uImage.includes('gif'))) {
                counter = 1;
                imageError.innerText = "The image must be jpg, jpeg, png or gif."
            }
            else {
                imageError.innerHTML = ''
            }
            
        }
        if(counter == 0) {
            form.submit()
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
                        
          }
          else {
            emailError.innerText = ""
          }
    })
    passwordInput.addEventListener('focusout' , (e) => {
        if (passwordInput.value == "") {
            passwordError.innerText = "You must choose a password";
        }  else if (!(passwordInput.value.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&#.$($)$-$_])(A-Za-z\d$@$!%*?&#.$($)$-$_]|[^ ]){8,}$/
        ))) {
        passwordError.innerText = 'Must contain eight characters, one lower and one upper case, one number and one special character.'
        
    } 
        else {
            passwordError.innerText='';
        }
    })

    //passwordInput.addEventListener('keyup', (e) => {
    //    if(passwordInput.value.length>=8){
    //        passwordError.innerText=""
    //    }
    //})

    password2Input.addEventListener('focusout' , (e) => {
        if (password2Input.value != passwordInput.value) {
            password2Error.innerText = 'Passwords do not match';
        } else {
            password2Error.innerHTML = "";
        }
    })
    password2Input.addEventListener('keyup', (e) => {
        if (password2Input.value == passwordInput.value){
            password2Error.innerText=""
        }
    })

    nameInput.addEventListener('focusout' , (e) => {
        if (nameInput.value == "") {
            nameError.innerText = "You must enter your name";
        } else if (nameInput.value.length < 2) {
            nameError.innerText = "Name minimun length is 2"
        } else {
            nameError.innerText='';
        }
    })
    nameInput.addEventListener('keyup', (e) => {
        if(nameInput.value.length>=2){
            nameError.innerText=""
        }
    })
    lastNameInput.addEventListener('focusout' , (e) => {
        if (lastNameInput.value == "") {
            lastNameError.innerText = "You must enter your last name";
        } else if (lastNameInput.value.length < 2) {
            lastNameError.innerText = "Last name minimun length is 2"
        } else {
            lastNameError.innerText='';
        }
    })
    lastNameInput.addEventListener('keyup', (e) => {
        if(lastNameInput.value.length>=2){
            lastNameError.innerText=""
        }
    })
})
