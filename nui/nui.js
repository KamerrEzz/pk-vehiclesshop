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

        document.getElementById('close').addEventListener('click', function(event) {
            fetch('https://store-car/close', {
                method: "POST",
                body: JSON.stringify({})
            })
        })
    }

    if (data.action == "nui_hidden") {
        document.getElementById('container').classList.add('hidden')
    }
})

document.addEventListener('keydown',  function (event) {
    console.log(JSON.stringify(event.key));
    if(event.key == "Escape" || event.key == "Backspace") {
        fetch('https://store-car/close', {
                method: "POST",
                body: JSON.stringify({})
            })
    }
})