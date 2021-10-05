var gia_mach_in, width, heigh, gia_tien, time;
gia_tien = 0
var gia_tien_theo_ngay = [40,35,30,27,22,20,16,11,8]
$(document).ready(function(){
  $("button").click(function(){
        width = $("#width").val()
        heigh = $("#heigh").val()
        time  = $("#time").val()
        width = parseInt(width)
        heigh = parseInt(heigh)
        time  = parseInt(time)
        time  = time
        gia_tien = gia_tien_theo_ngay[time - 1] * time;
        $("#price").val(gia_tien*width*heigh)
    });
})
