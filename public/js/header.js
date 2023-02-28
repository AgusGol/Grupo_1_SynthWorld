window.addEventListener('load', () => {
    let burgerBtn = document.querySelector('.burger-menu');
    let navLinksMb = document.querySelector('.navLinksMb');

    burgerBtn.addEventListener('click', () => {
        navLinksMb.classList.toggle('visible')
        navLinksMb.classList.toggle('invisible')

    })


})
