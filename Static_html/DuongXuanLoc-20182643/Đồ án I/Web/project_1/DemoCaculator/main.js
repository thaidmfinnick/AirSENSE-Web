$(".item").click(function () {
  var value = this.innerText;
  var input = $(".input")[0];
  if (value >= 0 && value <= 9) {
    console.log(value);

    if (input.innerText == 0) {
      input.innerText = value;
    } else {
      input.innerText = input.innerText + value;
    }
  } else {
    switch (value) {
      case "+":
        input.innerText = input.innerText + value;
        break;
      case "-":
        input.innerText = input.innerText + value;
        break;
      case "x":
        input.innerText = input.innerText + value;
        break;
      case "/":
        input.innerText = input.innerText + value;
       
        break;
      case "=":
        var val = input.innerText;
        val = val.replaceAll("x", "*");
        val = eval(val.replace(/[^-()\d/*+.]/g, ""));
        if(val === parseInt(val,10)){
            val = val;
        }
        else{
            val = val.toFixed(5);
        }
        input.innerText = val;
        break;
      case "CE":
        if (input.innerText != 0) {
          input.innerText = "0";
        }

        break;
      case "C":
        if (input.innerText != 0) {
          input.innerText = input.innerText.slice(
            0,
            input.innerText.length - 1
          );
          if (!input.innerText) {
            input.innerText = "0";
          }
        }
        break;
      case "sqrtX":
        input.innerText = Math.sqrt(input.innerText).toFixed(5);
        break;
      case "Log(x)":
        var val = Math.log10(input.innerText);
        if (val === parseInt(val, 10)) {
          val = val;
        } else {
          val = val.toFixed(5);
        }
        input.innerText = val;
        break;
      case "X^2":
        input.innerText = input.innerText * input.innerText;
        break;
      default:
        break;
    }
  }
  // Khi xuất hiện thanh scroll thì luôn đẩy về kí tự mới nhập
  $(".screen")[0].scrollLeft=$(".screen").width()
});
