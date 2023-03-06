window.addEventListener('load',()=>{
    //Encabezados //
    let descripBtn = document.querySelector(".description-tb")
    let extra_infoBtn = document.querySelector(".extraInfo-tb")
    //Parrafos //
    let descripText = document.querySelector(".description-p-tb")
    let extra_infoText = document.querySelector(".extra-info-tb")

    descripBtn.addEventListener("click",()=>{
        descripText.classList.toggle('visible')
        descripText.classList.toggle('invisible')

    })

    extra_infoBtn.addEventListener("click", ()=>{
        extra_infoText.classList.toggle("visible")
        extra_infoText.classList.toggle("invisible")
        
    })

})