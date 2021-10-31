const express = require('express');
const documentCtrl = require('../controllers/document.controller.js');
const router = express.Router();

router.get('/', (req, res) => {
  res.render('home/home', { route: 'home' });
});

var arrayMenuPages =[
  {
    typePage: "Đào tạo",
    route: 'tech',
    sideMenu :{}
  },

  {
    typePage: "Blog",
    route: 'document',
    sideMenu :{}
  }
] 

router.get('/education/:typePage', async (req, res) => {
  var data = req.params.typePage;
  var itemvalue =["head","news", "documentary"]
  var index = itemvalue.findIndex(o=>o==data);
  var dataMAin=10+index;
  if(index<10) {
    dataMAin = '11,12';
  }
  res.render('tech/tech' , { detail: dataMAin, route: 'tech' });
});


router.get('/blog/:typePage',async (req, res) => {
  var data = req.params.typePage;
  var itemvalue =["head","stem", "environment", "climate"]
  var index = itemvalue.findIndex(o=>o==data);
  var dataMAin=index;
  if(dataMAin<1) {
    dataMAin = '1,2,3';
  }
  
  res.render('document/blog',  { detail: dataMAin, route: 'document' });
});

router.get('/curriculum/:typePage',async (req, res) => {
  var data = req.params.typePage;
  var itemvalue =["head","maths", "program","electric","phy"]
  var index = itemvalue.findIndex(o=>o==data);
  var dataMAin=30+index;
  if(dataMAin<31) {
    dataMAin = '31,32,33,34';
  }
  res.render('blog/document', { detail: dataMAin, route: 'curriculum' });
});

router.get('/tool/:typePage',async (req, res) => {
  var data = req.params.typePage;
  var itemvalue =["head","math","economy", "image","design","iot"]
  var index = itemvalue.findIndex(o=>o==data);
  var dataMAin=40+index;
  if(dataMAin<41) {
    dataMAin = '41,42,43,44,45';
  }
  res.render('tool/tool',  { detail: dataMAin, route: 'tool' });
});

router.get('/traning/:typePage',async (req, res) => {
  var data = req.params.typePage;
  var itemvalue =["head","electric","program", "telecommunication","computer","biomedical","air","phy"]
  var index = itemvalue.findIndex(o=>o==data);
  var dataMAin=arrayMenuPages[2];
  if(index<1) {
    var dataAdd = await documentCtrl.getAllInMenuPage([21,22,23,24,25,26,27,28]);
    dataMAin.sideMenu.subjects =dataAdd;
  }
  else
  {
    var dataAdd = await documentCtrl.getAllInMenuPage([20+index]);
    dataMAin.sideMenu.subjects =dataAdd;
  }
  res.render('traning/traning', { detail: dataMAin, route: 'traning' });
});

router.get('/tool/detail/:typePage', (req, res) => {
  var data = req.params.typePage;
  console.log('...................data ................ ', data);
  res.render('tool/toolDetail', { detail: data, route: 'tool' });
});

router.get('/detail_page/:typePage', (req, res) => {
  var data = req.params.typePage;
  res.render('home/viewDetail', { detail: data, route: 'tool' });
});

router.get('/group_page/:typePage', (req, res) => {
  var data = req.params.typePage;
  res.render('home/groupDetail', { detail: data, route: 'tool' });
});

router.get('/about', (req, res) => {
  res.render('home/about');
});

router.get('/map', (req, res) => {
  res.render('home/map');
});

router.get('/sale', (req, res) => {
  res.render('sale/Sale');
});

router.get('/sale/product', (req, res) => {
  console.log("req /sale/product ",req._parsedOriginalUrl.query);
  res.render('sale/GroupProduct',{ detail: req._parsedOriginalUrl.query });
});

router.get('/sale/product_detail', (req, res) => {
  res.render('sale/DetailProduct',{ detail: req._parsedOriginalUrl.query });
});


router.get('/sale/cart', (req, res) => {
  res.render('sale/invoiceInfoProduct');
});


router.get('/sale/finish', (req, res) => {
  res.render('sale/finishInvoiceProduct',{ detail: req._parsedOriginalUrl.query });
});


router.get('/service', (req, res) => {
  res.render('service/service');
});

router.get('/service/detail', (req, res) => {
  res.render('service/detailService');
});


router.get('/service/bill', (req, res) => {
  res.render('service/billService');
});

router.get('/service/charging', (req, res) => {
  res.render('service/chargingService');
});


router.get('/test2', (req, res) => {
  res.render('sale/DetaileSalePages');
});

router.get('/test3', (req, res) => {
  res.render('sale/Sale');
});
router.get('/test4', (req, res) => {
  res.render('sale/SaleGroupPages');
});

router.get('/test5', (req, res) => {
  res.render('sale/SalePages');
});

router.get('/old', (req, res) => {
  res.render('old/home');
});


module.exports = router;

