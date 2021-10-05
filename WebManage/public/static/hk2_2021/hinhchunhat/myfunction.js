function show_hello() {
    alert("Welcome to my website")
}

function hinhchunhat() {
    var dai = parseInt(document.forms["hinhchunhatform"]["dai"].value);
    var rong = parseInt(document.forms["hinhchunhatform"]["rong"].value);
    var dientich = dai * rong;
    document.getElementById("dientich").innerHTML = "Dien tich cua hinh chu nhat la " + dientich;
}

function hinhtamgiac(){
    var a = parseInt(document.forms["hinhtamgiacform"]["canh_a"].value);
    var b = parseInt(document.forms["hinhtamgiacform"]["canh_b"].value);
    var c = parseInt(document.forms["hinhtamgiacform"]["canh_c"].value);
    var p = (a+b+c)/2;
    var dientichtamgiac = Math.sqrt(p*(p-a)*(p-b)*(p-c));
    document.getElementById("dientichtamgiac").innerHTML = "Dien tich cua hinh tam giac la " + dientichtamgiac;
}

function hinhthang() {
    var a = parseInt(document.forms["hinhthangform"]["canh_day_1"].value);
    var b = parseInt(document.forms["hinhthangform"]["canh_day_2"].value);
    var h = parseInt(document.forms["hinhthangform"]["cao"].value);
    var dientichhinhthang = h * (a + b)/2;
    document.getElementById("dientichhinhthang").innerHTML= "Dien tich hinh thang la " +dientichhinhthang;
}

function hinhtron() {
    var r = parseInt(document.forms["hinhtronform"]["R"].value);
    var p=Math.PI;
    var dientichhinhtron = p*r*r;
    document.getElementById("dientichhinhtron").innerHTML= "Dien tich hinh tron la: " +dientichhinhtron;
}