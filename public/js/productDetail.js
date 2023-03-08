window.addEventListener('load',()=>{
    //Encabezados //
    let descripBtn = document.querySelector(".description")
    let extra_infoBtn = document.querySelector(".extra-info")
    //Parrafos //
    let descripText = document.querySelector(".descriptionTextMb")
    let extra_infoText = document.querySelector(".extraInfoTextMb")

    descripBtn.addEventListener("click",()=>{
        descripText.classList.toggle('visible')
        descripText.classList.toggle('invisible')

    })

    extra_infoBtn.addEventListener("click", ()=>{
        extra_infoText.classList.toggle("visible")
        extra_infoText.classList.toggle("invisible")
        
    })

})