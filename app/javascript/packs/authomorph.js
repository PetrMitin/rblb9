import "jquery"
import "jquery_ujs"

function showResults(data) {
    const resultDiv = document.getElementById('results')
    let resultTrs = ''
    const results = data.results
    const error = data.error
    if (error) {
        resultDiv.innerHTML = error
    }
    else {
        for (let i = 0; i < results.length; ++i) {
            resultTrs += `<tr><td>${results[i]}</td><td>${results[i]**2}</td></tr>`
        }
        resultDiv.innerHTML = `<table>${resultTrs}</table>`
    }
}

$(function() {
    $("#n-input-form").on("ajax:success",
    function(xhr, data, status) {
        // data is already an object
        showResults(data)
    })
}) 
// document.addEventListener('onload', () => {
//     const clickButton = document.getElementById("submit-button");
//     clickButton.addEventListener('click', (event) => {
//         authomorph()
//     });
// });