// Chuyen so binh thuong sang dang phay
// var number = 15679467457;
// document.querySelector(".test").textContent = number.toLocaleString();

var tong1 = 0; // tong tien
var lai = 0; //tong lai
var tongall = 0; //tong tat
function calculate() {
  var tong = parseInt(document.querySelector(".money").value);
  var lsuat = parseInt(document.querySelector(".rate").value);
  var thang = parseInt(document.querySelector(".month").value);
  var count = thang;
  var laimonth = 0; //lai hang thang
  var gocleft = 0; //goc con lai
  var tonglai = 0; //tong lai phai tra
  var gocpay = tong / thang; //goc tra hang thang
  var tongmonth = 0; //tong tra hang thang
  var tongphu = tong;
  tong1 = tong;
  for (var i = 0; i < count; i++) {
    //order
    var k = document.createTextNode(i + 1);
    addChild(k);
    // Tinh toan
    laimonth = parseInt(((tongphu * (lsuat / 12)) / 100).toFixed(0)); //tien lai hang thang
    tongmonth = gocpay + laimonth; //tong tien phai tra hang thang
    tongphu = tongphu - gocpay;
    tonglai = tonglai + laimonth;
    tongall = tongall + tongmonth;
    if (tongphu < 0) tongphu = 0;

    // loan left
    k = document.createTextNode(parseInt(tongphu.toFixed(0)).toLocaleString());
    addChild(k);
    // monthly root
    k = document.createTextNode(parseInt(gocpay.toFixed(0)).toLocaleString());
    addChild(k);
    // monthly rate
    k = document.createTextNode(parseInt(laimonth.toFixed(0)).toLocaleString());
    addChild(k);
    // monthly total
    k = document.createTextNode(
      parseInt(tongmonth.toFixed(0)).toLocaleString()
    );
    addChild(k);
  }
  lai = tonglai;
}
tongall = tong1 + lai;
function createRow() {
  var count = document.querySelector(".month").value;
  for (var i = 0; i < count; i++) {
    if (i == 0) {
      var k = document.createTextNode("Order");
      addChildf(k);
    }
    if (i == 1) {
      var k = document.createTextNode("Loan left");
      addChildf(k);
    }
    if (i == 2) {
      var k = document.createTextNode("Monthly root");
      addChildf(k);
    }
    if (i == 3) {
      var k = document.createTextNode("Monthly rate");
      addChildf(k);
    }
    if (i == 4) {
      var k = document.createTextNode("Monthly total");
      addChildf(k);
    }
  }
  calculate();
  for (var i = 0; i < count; i++) {
    if (i == 0) {
      var k = document.createTextNode("Tổng");
      addChildl(k);
    }
    if (i == 1) {
      var k = document.createTextNode(" ");
      addChildl(k);
    }
    if (i == 2) {
      var k = document.createTextNode(tong1.toLocaleString());
      addChildl(k);
    }
    if (i == 3) {
      var k = document.createTextNode(lai.toLocaleString());
      addChildl(k);
    }
    if (i == 4) {
      //var k = document.createTextNode(parseInt(tong1 + lai).toLocaleString());
      var k = document.createTextNode(tongall.toLocaleString());
      addChildl(k);
    }
  }
}

// them node cho phan tu
function addChild(o) {
  var div = document.querySelector(".container");
  var p = document.createElement("p");
  p.className = "border";
  p.appendChild(o);
  div.appendChild(p);
}

// them node cho menu
function addChildf(o) {
  var div = document.querySelector(".container");
  var p = document.createElement("p");
  p.className = "border f";
  p.appendChild(o);
  div.appendChild(p);
}

// them node cho dong cuoi
function addChildl(o) {
  var div = document.querySelector(".container");
  var p = document.createElement("p");
  p.className = "border l";
  p.appendChild(o);
  div.appendChild(p);
}
