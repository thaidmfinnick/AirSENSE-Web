var fcre = new Array(); //diem mieng
var pgrade = new Array(); //diem 15p
var fgrade = new Array(); // diem giua ki 1 tit
var tgrade = new Array(); // diem cuoi ki
var grade10 = new Array(); // tong ket
var count = 0;

// var item = document.querySelectorAll(".fcredit");
// console.log(item);

//change and float
function changeAF() {
  var item = document.querySelectorAll(".fcredit"); //mieng
  var item1 = document.querySelectorAll(".fpgrade"); //15p
  var item2 = document.querySelectorAll(".fhgrade"); //1 tiet
  var item3 = document.querySelectorAll(".ffgrade"); //hk
  count = item.length;
  for (var i = 0; i < item.length; i++) {
    fcre[i] = parseFloat(item[i].value);
    pgrade[i] = parseFloat(item1[i].value);
    fgrade[i] = parseFloat(item2[i].value);
    tgrade[i] = parseFloat(item3[i].value);
  }
  //   console.log(fcre);
  //   console.log(pgrade);
  //   console.log(fgrade);
  //   console.log(tgrade);
}

function calculate() {
  changeAF();
  var item = document.querySelectorAll(".f10");
  var s = 0;
  for (var i = 0; i < count; i++) {
    grade10[i] = (
      (fcre[i] + pgrade[i] + 2 * fgrade[i] + 3 * tgrade[i]) /
      7
    ).toFixed(1);
    item[i].textContent = grade10[i];
    s = s + parseFloat(grade10[i]);
  }
  s = (s / 6).toFixed(1);
  document.querySelector(".cpa").textContent = s + "/10";
}
