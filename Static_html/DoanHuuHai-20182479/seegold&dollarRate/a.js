function show_hello(){
    alert(Welcome to website);
}
function show(){
    var today = new Date();
    var date = today.getDate() + '-' + today.getMonth() + '-' + today.getFullYear();
    document.getElementById("date").innerHTML = "Hôm nay là ngày " + date;
}