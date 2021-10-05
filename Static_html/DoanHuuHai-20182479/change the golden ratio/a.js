function show_hello() {
    alert("Welcome to my website")
}

function doidonvivang(){
    var a= document.forms["doidvvang"]["doivang"].value;
    var b= a*266;
    var c= a*(26+0.6);
    document.getElementById("chivang").innerHTML = a + " kilogram of gold can be exchanged  " + b + " mace of gold";
    document.getElementById("cayvang").innerHTML = a + " kilogram of gold can be exchanged " + c + " Gold teal";
}
