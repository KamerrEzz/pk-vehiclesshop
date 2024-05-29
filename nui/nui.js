window.addEventListener('message', function(event){
    let data = event.data
    if (data.action == "nui_principal") {

        let carsList = ""
        for (let i = 0; i < data.cars.length; i++) {
            const element = data.cars[i];
            carsList += `<li id="${element.model}" data-price="${element.price}" data-model="${element.model}" data-type="item">${element.name} - $${element.price}</li>`
        }

        // document.getElementById('container').classList.add('show')
        document.getElementById('container').classList.remove('hidden')
        document.getElementById('cars').innerHTML = carsList
        document.getElementById('currentMoney').innerHTML = data.currentMoney

        document.getElementById('close').addEventListener('click', function(event) {
            fetch('https://store-car/close', {
                method: "POST",
                body: JSON.stringify({})
            })
        })

        
        document.addEventListener('click', function (event) {
            const dataset = event.target.dataset
            if(dataset && dataset.type == "item") {
                fetch('https://store-car/click', {
                    method: "POST",
                    body: JSON.stringify(dataset)
                })
            }
        })
    }

    if (data.action == "nui_hidden") {
        document.getElementById('container').classList.add('hidden')
    }
})

document.addEventListener('keydown',  function (event) {
    if(event.key == "Escape" || event.key == "Backspace") {
        fetch('https://store-car/close', {
                method: "POST",
                body: JSON.stringify({})
            })
    }
})
