function toggle(x){
    // document.getElementsByClassName("unit-list").style.display="block";
    var y=document.getElementById(x);
    if(y.style.display==="none"){
        y.style.display="block";
    } else {
        y.style.display="none";
    }
}
var unit=[-6,0,-6,0];
function chooseUnit(a,b,c){
    if(b==0){
        var x=document.getElementById('inp-first-unit');
        document.getElementById('unit-list-1').style.display='none';
    } else if(b==1){
        var x=document.getElementById('inp-second-unit');
        document.getElementById('unit-list-2').style.display='none';
    } else if(b==2){
        var x=document.getElementById('outp-first-unit');
        document.getElementById('unit-list-3').style.display='none';
    } else if(b==3){
        var x=document.getElementById('outp-second-unit');
        document.getElementById('unit-list-4').style.display='none';
    }
    if(b==0||b==2){
        x.innerHTML=c;
    } else {
        x.innerHTML=c+'<sup>3</sup>'
    }
    unit[b]=a;
}
function convertC(){
    var x = document.getElementById("input").value;
    var y = x*(10**(unit[0]-unit[2]))*(1000**(unit[3]-unit[1]));
    document.getElementById("output").value=y;
}