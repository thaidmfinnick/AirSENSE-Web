function lapphuong() {
    var a = parseInt(document.forms["lapphuongform"]["canh"].value);
    var v=a*a*a;
    document.getElementById("Vlapphuong").innerHTML = "The tich lap phuong la " +v; 
}

function hcn() {
    var dai = parseInt(document.forms["hcnform"]["dai"].value);
    var rong = parseInt(document.forms["hcnform"]["rong"].value);
    var cao = parseInt(document.forms["hcnform"]["cao"].value);
    var V = dai*rong*cao;
    document.getElementById("Vhcn").innerHTML = "The tich hinh hop chu nhat la " +V;
}

function tru() {
    var r = parseInt(document.forms["truform"]["r"].value);
    var h = parseInt(document.forms["truform"]["h"].value);
    var p = Math.PI;
    var V = p*r*r*h;
    document.getElementById("Vtru").innerHTML = "The tich hinh tru la " +V; 
}

function cau() {
    var r = parseInt(document.forms["cauform"]["R"].value);
    var p = Math.PI;
    var V = (4/3)*(p*r*r*r);
    document.getElementById("Vcau").innerHTML = "The tich hinh cau la " +V;
}