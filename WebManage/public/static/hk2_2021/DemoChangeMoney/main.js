/**
 * Jquery có event keyup của input khi nhả nút bấm trên bàn phím sẽ chạy sự kiện trong function
 * 
 */
$("#vnd").keyup(function(){  
    // lấy giá trị của input "vnd" , dữ liệu lấy từ phần tử 0 của mảng 
    var value = $("#vnd")[0].value; 
   // nếu value khác 0 ,null , undefined
    if(value){
        $("#usd")[0].value = value/23000;
    } else {
        $("#usd")[0].value = null;
    }
})
$("#usd").keyup(function(){
    var value = $("#usd")[0].value;
    $("#vnd")[0].value = value*23000;
    if(value){
        $("#vnd")[0].value = value*23000;
    } else {
        $("#vnd")[0].value = null;
    }
})







/* <div class="inputs">
        <input
          type="number"
          id="vnd"
          class="vnd"
          placeholder="Vnd......"
        />
        <input
          type="number"
          id="usd"
          class="usd"
          placeholder="Usd......"
        />
      </div> */