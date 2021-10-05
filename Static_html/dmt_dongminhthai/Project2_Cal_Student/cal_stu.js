var cre = new Array(); //credit tin chi
var fgrade = new Array(); // diem giua ki
var tgrade = new Array(); // diem cuoi ki
var grade10 = new Array(); // thang 10
var grade4 = new Array(); // thang 4
var gradeA = new Array(); // thang abcd
var count = 0;

//change and float
function changeAF() {
  var item = document.querySelectorAll(".fcredit");
  var item2 = document.querySelectorAll(".fpgrade");
  var item3 = document.querySelectorAll(".ffgrade");
  count = item.length;
  for (var i = 0; i < item.length; i++) {
    cre[i] = parseFloat(item[i].textContent);
    fgrade[i] = parseFloat(item2[i].value);
    tgrade[i] = parseFloat(item3[i].value);
  }
  //   console.log(cre);
  //   console.log(fgrade);
  //   console.log(tgrade);
}
// Calculate grade
function calculate() {
  changeAF();
  for (var i = 0; i < count; i++) {
    grade10[i] = (0.3 * fgrade[i] + 0.7 * tgrade[i]).toFixed(2);
    if (grade10[i] < 3.95) {
      grade4[i] = 0;
      gradeA[i] = "F";
    } else if (grade10[i] >= 3.95 && grade10[i] <= 4.95) {
      grade4[i] = 1;
      gradeA[i] = "D";
    } else if (grade10[i] > 4.95 && grade10[i] <= 5.4) {
      grade4[i] = 1.5;
      gradeA[i] = "D+";
    } else if (grade10[i] > 5.4 && grade10[i] <= 6.4) {
      grade4[i] = 2;
      gradeA[i] = "C";
    } else if (grade10[i] > 6.4 && grade10[i] <= 6.9) {
      grade4[i] = 2.5;
      gradeA[i] = "C+";
    } else if (grade10[i] > 6.9 && grade10[i] <= 7.9) {
      grade4[i] = 3;
      gradeA[i] = "B";
    } else if (grade10[i] > 7.9 && grade10[i] <= 8.4) {
      grade4[i] = 3.5;
      gradeA[i] = "B+";
    } else if (grade10[i] > 8.4 && grade10[i] <= 9.4) {
      grade4[i] = 4;
      gradeA[i] = "A";
    } else {
      grade4[i] = 4;
      gradeA[i] = "A+";
    }
  }
}

// Output
function outPut() {
  calculate();
  var item = document.querySelectorAll(".f10");
  var item1 = document.querySelectorAll(".f4");
  var item2 = document.querySelectorAll(".falpha");
  var cpa = 0;
  var s = 0; //tong so tin credit
  for (var i = 0; i < count; i++) {
    cpa = cpa + cre[i] * grade4[i];
    s = s + cre[i];
    item[i].textContent = grade10[i];
    item1[i].textContent = grade4[i];
    item2[i].textContent = gradeA[i];
  }
  cpa = cpa / s;
  document.querySelector(".cpa").textContent = cpa + "/4";
}
