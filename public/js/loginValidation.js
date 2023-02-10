window.addEventListener('load', () => {
    let form = document.querySelector('form');
    let errors = {}

    form.addEventListener('submit', (e) => {
        
    })


    form.userEmail.addEventListener('keyup', (e) => {
       
        if(e.target.value == "") {
            console.log('vacio');
            e.target.classList.add('is-invalid');
            errors = errors.filter(error => {return error != "The email cannot be empty"})
            errors.push("The email cannot be empty");
        }
        else {
            errors = errors.filter(error => {return error != "The email cannot be empty"})
            errors = errors.filter(error => {return error != "El rating debe ser entre 0 y 10"})
            e.target.classList.remove('is-invalid');
            e.target.classList.add('is-valid');
        }
    })
})
