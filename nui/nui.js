window.addEventListener('message', function(event){
    let data = event.data
    if (data.action == "nui_principal") {

        let carsList = ""
        for (let i = 0; i < data.cars.length; i++) {
            const element = data.cars[i];
            carsList += `<li>${element.name} - $${element.price}</li>`
        }

        // document.getElementById('container').classList.add('show')
        document.getElementById('container').classList.remove('hidden')
        document.getElementById('cars').innerHTML = carsList
    }
})