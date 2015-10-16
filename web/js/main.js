/**
 * Created by Jhoseph Arango on 07/10/2015.
 */
function validacion(){
    var isbn = document.getElementById("isbn");
    var miformulario = document.getElementById("miformulario");

    if ( isbn.value == ""){
        alert(" Campo ISBN vacio!");
    }else{
        miformulario.submit();
    }
}