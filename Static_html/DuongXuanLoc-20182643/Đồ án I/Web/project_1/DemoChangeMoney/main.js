/**
 * Jquery có event keyup của input khi nhả nút bấm trên bàn phím sẽ chạy sự kiện trong function
 * 
 */
// $("#vnd").keyup(function(){  
//     // lấy giá trị của input "vnd" , dữ liệu lấy từ phần tử 0 của mảng 
//     var value = $("#vnd")[0].value; 
//    // nếu value khác 0 ,null , undefined
//     if(value){
//         $("#usd")[0].value = value/23000;
//     } else {
//         $("#usd")[0].value = null;
//     }
// })
// $("#usd").keyup(function(){
//     var value = $("#usd")[0].value;
//     $("#vnd")[0].value = value*23000;
//     if(value){
//         $("#vnd")[0].value = value*23000;
//     } else {
//         $("#vnd")[0].value = null;
//     }
// })
$("#input1").keyup( function(event){
 
    var v_leftSelect = $("#leftSelect option:selected").val();
    var v_rightSelect = $("#rightSelect option:selected").val();

    var v_input1 = $('#input1')[0].value;
  
    $('#input2')[0].value = (v_leftSelect / v_rightSelect) * v_input1 ;

})

$("#input2").keyup( function(event){
 
    var v_leftSelect = $("#leftSelect option:selected").val();
    var v_rightSelect = $("#rightSelect option:selected").val();

    var v_input2 = $('#input2')[0].value;
    $('#input1')[0].value = (v_rightSelect / v_leftSelect) * v_input2 ;
})

$("#leftSelect").on("change" , function(event){

    var v_leftSelect = $("#leftSelect option:selected").val();
    var v_rightSelect = $("#rightSelect option:selected").val();

    var v_input1 = $('#input1')[0].value;
  
    $('#input2')[0].value = (v_leftSelect / v_rightSelect) * v_input1 ;
})

$("#rightSelect").on("change" , function(event){

    var v_leftSelect = $("#leftSelect option:selected").val();
    var v_rightSelect = $("#rightSelect option:selected").val();

    var v_input2 = $('#input2')[0].value;
    $('#input1')[0].value = (v_rightSelect / v_leftSelect) * v_input2 ;
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