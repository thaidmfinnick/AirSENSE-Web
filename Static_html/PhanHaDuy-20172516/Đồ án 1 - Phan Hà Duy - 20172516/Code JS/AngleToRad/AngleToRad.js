const _angle = 180
var outputRad  = document.getElementById("outputRad")
function convert() {
    var inputAngle = parseInt(document.getElementById("inputAngle").value)
    if(inputAngle < 0)
    {
        inputAngle = -inputAngle
    }
    else if(String(inputAngle) == "NaN")
    {
        inputAngle = 0
    }
    var ucln = UCLN(inputAngle, _angle)
    let result
    if(_angle/ucln == 1 && inputAngle/ucln != 1)
    {
        result = inputAngle/ucln + 'π'
    }
    else if(inputAngle/ucln == 1 && _angle/ucln == 1) {
        result = 'π'
    }
    else if(ucln == false)
    {
        result = 0
    }
    else {
        result = inputAngle/ucln + 'π' + '/' + _angle/ucln
    }
    outputRad.innerText = result
}
function UCLN(x,y){
    if(typeof(x) === 'number')
    {
        if(x == 0)
            return false
        else
        {
            while(x!=y)
            {
                if(x>y) x=x-y;
                else y=y-x;
            }
            return x
        }
    }
    else return false
}
