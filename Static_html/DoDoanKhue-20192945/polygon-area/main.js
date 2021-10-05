var x=new Array();
var y=new Array();
var vertices; //biến nhập vào số đỉnh
var area;

function readUserData() //Hàm đọc dữ liệu người dùng nhập vào
{
        vertices = parseInt( document.getElementById("VERTICES").value );
        if( (vertices < 3) || (vertices > 8 ) ) {
            alert( "Nhập số cạnh lớn hơn 3 và nhỏ hơn 8" );
            return;
        } // Kiểm tra điều kiện vertices thỏa mãn

        for( k = 0; k < vertices; k++ ) {
            x[k] = parseFloat( document.getElementById("X"+k).value );
            y[k] = parseFloat( document.getElementById("Y"+k).value );
        } // Đọc dữ liệu từ người dùng và ghi vào mảng đã khai báo 
        
        x[vertices] = x[0];// hình kín->đơn giản hóa tính toán
        y[vertices] = y[0];
    }

function calculateArea() { //Hàm tính toán diện tích
        area = 0.0;
        for( k = 0; k < vertices; k++ ) {
            xDiff = x[k+1] - x[k];
            yDiff = y[k+1] - y[k];
            area = area + x[k] * yDiff - y[k] * xDiff;
        } 
        area = Math.abs(0.5*area); // Thuật toán tính diện tích đa giác 
      document.getElementById("AREA").innerHTML= "Dien tich la " +area;
    }

function handleCalculate() //Đọc dữ liệu và tính toán diện tích
    {
        readUserData();
        calculateArea();
    }





    