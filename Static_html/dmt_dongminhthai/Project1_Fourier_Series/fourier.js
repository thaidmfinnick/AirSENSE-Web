//gia su ham luon luon khac hang so, hang so se cai tien sau
var valueA = new Array(); //mang de luu gia tri cua an
var valueB = new Array(); //mang de luu gia tri cua bn
var az = 0; //azero
var a = 2;
//var f = new Array(); //luu gia tri chuyen doi tu string sang so
var use = new Array();
var cal = 0; //tinh gia tri

function Intergral() {
  Cal(); //tinh f(x) va luu gia tri cac step trong use[i]
  var num = document.getElementById("num").value;
  var top = document.getElementById("top").value; //can tren
  var bot = document.getElementById("bot").value; // can duoi
  var step = (top - bot) / 10;
  var cycle = top - bot; //chu ki can thiet
  //var step = (top - bot) / 10; //buoc nhay de tinh tich phan
  //bat dau tinh tich phan
  for (var j = 0; j <= num; j++) {
    var tempA = 0;
    var tempB = 0;
    a = bot - 0;
    //tinh a0, b0
    if (j == 0) {
      for (var i = 0; i <= 10; i++) {
        if (i == 0 || i == 10) {
          az = az + use[i];
        } else if (i % 2 != 0) {
          az = az + 4 * use[i];
        } else {
          az = az + 2 * use[i];
        }
      }
      az = ((2 / cycle) * (step / 3) * az).toFixed(7);
      valueA.push(az);
      valueB.push(0);
      //console.log(valueA[0]);
    }
    //tinh an, bn
    else {
      for (var i = 0; i <= 10; i++) {
        if (i == 0 || i == 10) {
          tempA = tempA + use[i] * Math.cos((j * 2 * Math.PI * a) / cycle);
          tempB = tempB + use[i] * Math.sin((j * 2 * Math.PI * a) / cycle);
        } else if (i % 2 != 0) {
          tempA = tempA + 4 * use[i] * Math.cos((j * 2 * Math.PI * a) / cycle);
          tempB = tempB + 4 * use[i] * Math.sin((j * 2 * Math.PI * a) / cycle);
        } else {
          tempA = tempA + 2 * use[i] * Math.cos((j * 2 * Math.PI * a) / cycle);
          tempB = tempB + 2 * use[i] * Math.sin((j * 2 * Math.PI * a) / cycle);
        }
        a = a + step;
      }
      tempA = ((2 / cycle) * (step / 3) * tempA).toFixed(7);
      tempB = ((2 / cycle) * (step / 3) * tempB).toFixed(7);
      valueA.push(tempA); //luu an vao trong mang valueA
      valueB.push(tempB); //luu an vao trong mang valueB
    }
  }
}
function CandCal() {
  var f = new Array();
  var t = document.getElementById("func").value;
  var k = t.slice();
  var m = 0;
  for (var i = 0; i < t.length; i++) {
    if (t.includes("x^")) {
      m = parseInt(t[t.indexOf("^") + 1]); //xac dinh phan tu so phia sau dau ^ de mu len
      f.push(Math.pow(a, m));
      t = t.replace("x^", "t");
      //console.log(t);
    } else if (t.includes("x")) {
      m = parseInt(t[t.indexOf("x") - 1]);
      if (isNaN(m)) {
        //neu khong phai so
        f.push(a);
        t = t.replace("x", "t");
        //console.log(t);
      } else {
        //neu la so
        f.push(m * a);
        t = t.replace("x", "t");
      }
    } else if (t.includes("-") && t.charAt(t.indexOf("-") + 2) != "t") {
      m = parseInt(t[t.indexOf("-") + 1]);
      if (isNaN(m)) {
        t = t.replace("-", "t");
      } else {
        f.push(m);
        t = t.replace("-", "t");
      }
    } else if (
      t.includes("+") &&
      t.charAt(t.indexOf("+") + 2) != "t" //kiem tra sau so k duoc la string
    ) {
      m = parseInt(t[t.indexOf("+") + 1]);
      if (isNaN(m)) {
        t = t.replace("+", "t");
      } else {
        f.push(m);
        t = t.replace("+", "t");
      }
    }
  }
  // truong hop co dau - o dau va khong co dau - o dau
  //co dau tru
  if (k.indexOf("-") == 0) {
    cal = cal - f[0];
  } else {
    cal = f[0];
    for (var i = 1; i <= f.length; i++) {
      if (k.includes("-")) {
        cal = cal - f[i];
        k = k.replace("-", "t");
      } else if (k.includes("+")) {
        cal = cal + f[i];
        k = k.replace("+", "t");
      }
    }
  }
  use.push(cal);
}

function Cal() {
  var top = document.getElementById("top").value;
  var bot = document.getElementById("bot").value;
  a = bot - 0;
  var step = (top - bot) / 10;
  for (var i = 0; i <= 10; i++) {
    CandCal();
    a = a + step;
  }
  // for (var i = 0; i <= 10; i++) {
  //   console.log(use[i]);
  // }
}

function createRow() {
  Intergral();
  var num = document.getElementById("num").value;
  num = num - 0;
  //console.log(test);
  for (var i = 0; i <= num; i++) {
    //order
    var k = document.createTextNode(i);
    addChild(k);
    //an
    var an = document.createTextNode(valueA[i]);
    addChild(an);
    //bn
    var bn = document.createTextNode(valueB[i]);
    addChild(bn);
  }
}

function addChild(o) {
  var div = document.querySelector(".container");
  var num = document.getElementById("num").value;
  num = num - 0;
  p = document.createElement("p");
  p.className = "border";
  p.appendChild(o);
  div.appendChild(p);
}
