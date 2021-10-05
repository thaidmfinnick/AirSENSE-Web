function toggle(x){
    // document.getElementsByClassName("unit-list").style.display="none";
    var y=document.getElementById(x);
    if(y.style.display==="none"){
        y.style.display="block";
    } else {
        y.style.display="none";
    }
}

var concenUnit=[-6,0,-6,0];

function chooseUnit(a,b,c){
    switch (b) {
        case 0:
            var x=document.getElementById('inp-first-unit');
            document.getElementById('unit-list-1').style.display='none';
            break;
        case 1:
            var x=document.getElementById('inp-second-unit');
            document.getElementById('unit-list-2').style.display='none';
            break;
        case 2:
            var x=document.getElementById('outp-first-unit');
            document.getElementById('unit-list-3').style.display='none';
            break;
        case 3:
            var x=document.getElementById('outp-second-unit');
            document.getElementById('unit-list-4').style.display='none';
            break;
    }
    if(b==0||b==2){
        x.innerHTML=c;
    } else {
        x.innerHTML=c+'<sup>3</sup>'
    }
    concenUnit[b]=a;
}

function convertC(){
    var x = document.getElementById("input").value;
    var y = x*(10**(concenUnit[0]-concenUnit[2]))*(1000**(concenUnit[3]-concenUnit[1]));
    document.getElementById("output").value=y;
}

var s=500;

function chooseAQIpara(a,b){
    document.getElementById('AQI-parameters').style.display='none';
    document.getElementById('AQI-para').innerHTML=b;
    s=a;
}

function convertAQI(){
    var c = document.getElementById('AQI-input').value;
    var aqi=c/s;
    document.getElementById('AQI-output').value=aqi;
}