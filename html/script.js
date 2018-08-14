GUIAction = {
    closeGui () {
        $('#identity').css("display", "none");
        $('#register').css("display", "none");
        $("#cursor").css("display", "none");
    },
    openGuiIdentity (data) {
        data = data || {}
        let infoMissing = 'Fake ID'
        if (data.dateNaissance) {
            data.dateNaissance = data.dateNaissance.substr(0,11)
        }
        if (data.sexe !== undefined) {
            $('#identity').css('background-image', "url('carteV3_" + data.sexe +".png')")
            data.sexe = data.sexe === 'm' ? 'Male' : 'Female'
        }
        if (data.taille !== undefined){
            data.taille = data.taille + ' '
        }
        ['nom','prenom','jobs', 'dateNaissance', 'sexe', 'taille'].forEach(k => {
            $('#'+k).text(data[k] || infoMissing)
        })

        

        $('#identity').css("display", "block");
    }
}

window.addEventListener('message', function (event){
    let method = event.data.method
    if (GUIAction[method] !== undefined) {
        GUIAction[method](event.data.data)
    }
})



//
// Gestion de la souris
//
$(document).ready(function(){
    var documentWidth = document.documentElement.clientWidth
    var documentHeight = document.documentElement.clientHeight
    var cursor = $('#cursor')
    cursorX = documentWidth / 2
    cursorY = documentHeight / 2
    cursor.css('left', cursorX)
    cursor.css('top', cursorY)
    $(document).mousemove( function (event) {
        cursorX = event.pageX
        cursorY = event.pageY
        cursor.css('left', cursorX + 1)
        cursor.css('top', cursorY + 1)
    })
})
