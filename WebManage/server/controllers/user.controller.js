const bcrypt = require('bcrypt');
const HttpStatus = require('http-status-codes');
const knex = require('../config/knex.js');
var squel = require("squel");
const nodemailer = require('nodemailer');
const TableManifest= require('../models/middlewareDatabase/TableManifest.js');
const {mangerModelAdmin} = require('../models/database/managerAll.model.js');
const {returnOK,returnFalse,returnNotFound } = require('../utils/returnResponse.js');
const User = require('../models/database/user.model.js');
const Authen2 = require('../models/database/oAuthen2.model');
const  {getRamdomData}  = require('../utils/utilsString.js');
const { select } = require('squel');

var userCtrl={};
 


                          
userCtrl.getTableData =function (req, res) {
  var startPage=0;
  if(!!req.body.startPage) startPage=req.body.startPage;
  var tableSelect=mangerModelAdmin(req.body.table);
  if(!!tableSelect){
    if(!tableSelect.checkAcessGetDatabase(req.currentUser.manifestid,tableSelect.getTypeTable())){
      return returnNotFound(res,{ message: "Database inval" });
    }

   startPage =startPage*1000;
   var itemSelect=tableSelect.getValueToSelectToFind(req.body.dataFind);
   var dataTableSQL=tableSelect.getSQLReport(req.currentUser) 
                  +" WHERE "+ 
                  tableSelect.getConditionManisfest(req.currentUser) 
                  + itemSelect
                  + " LIMIT "+startPage +","+(startPage+1000);
    console.log("dataTableSQL   ",dataTableSQL);
    knex.raw(dataTableSQL)
    .then(result => {
      return returnOK(res,result[0]);
    }
    , error => {
      return returnNotFound(res,error);
    });
  }
  else 
    return returnNotFound(res,{ message: "Database inval x" });
}


                          
userCtrl.getTableDataByGroup =function (req, res) {
  var table =req.body.table;
  var startPage=0;
  if(!!req.body.startPage) startPage=req.body.startPage;
  var tableSelect=mangerModelAdmin(table);
  if(!!tableSelect){
    if(!tableSelect.checkAcessGetDatabase(req.currentUser.manifestid,tableSelect.getTypeTable())){
      return returnNotFound(res,{ message: "Database inval" });
    }
    startPage =startPage*1000;
    var dataTableSQL=tableSelect.getSQLReport(req.currentUser) 
                          + +" WHERE "+ 
                          tableSelect.getConditionManisfest(req.currentUser) 
                          + tableSelect.getValueToSelectToFind(req.body.dataFind)
                          + " LIMIT "+startPage +","+(startPage+1000);
    dataTableSQL +=" AND "+ tableSelect.getNameTable()+".groups_id = "+req.body.groups_id;
    console.log(dataTableSQL);
    knex.raw(dataTableSQL)
    .then(result => {
      return returnOK(res,result[0]);
     }
    , error => {
      return returnFalse(res,error);
    });
  }
  else
  {
    return returnNotFound(res,{ message: "Database inval" });
  }
}

                          
userCtrl.getNumberPages =function (req, res) {
  var table =req.body.table;
  var tableSelect=mangerModelAdmin(table);
  if(!!tableSelect){
    if(!tableSelect.checkAcessGetDatabase(req.currentUser.manifestid,tableSelect.getTypeTable())){
      return returnNotFound(res,{ message: "Database inval" });
    }
    var itemSelect= tableSelect.getConditionManisfest(req.currentUser) +tableSelect.getValueToSelectToFind(req.body.dataFind); 
    var dataTableSQL= "SELECT COUNT(*) FROM " + tableSelect.getNameTable() +itemSelect;
    knex.raw(dataTableSQL)
    .then(result => {
      return returnOK(res,result[0]);
    }
    , error => {
      return returnFalse(res,error);
    });
  }
  else
  {
    return returnNotFound(res,{ message: "Database inval" });
  }
}

userCtrl.addDataToTable= async  function (req, res) {
  var table =req.body.table;
  var tableSelect=mangerModelAdmin(table);
  if(!!tableSelect){
    let data=req.body;
    if(!tableSelect.checkDataAddDatabase(req.currentUser.manifestid,tableSelect.getTypeTable())){
      return returnNotFound(res,{ message: "Database inval" });
    }
    var checkInaval =await tableSelect.checkManifestSpecialTable(table,req);
    console.log("checkInaval",checkInaval);
    if(!checkInaval){
      return returnNotFound(res,{ message: "Tài khoản đã tồn tại hoặc chưa được cấp quyền cao hơn"});
    } 
    console.log("checkInaval",checkInaval);

    var sqlData = await tableSelect.checkSqlAddAdmin(req,data);   
    knex.raw(sqlData)
      .then(result => {
        return returnOK(res,result[0]);
      }
      , error => {
        return returnFalse(res,error);
      });
  }
  else
  {
    return returnNotFound(res,{ message: "Database inval" });
  }
  
}



userCtrl.deleteData= async function (req, res) {
  var tableSelect=mangerModelAdmin(req.body.table);
  if(!!!tableSelect){
    return returnNotFound(res,{ message: "Database inval" });
  }
  if(!tableSelect.checkDataDeleteDatabase(req.currentUser.manifestid,tableSelect.getTypeTable()))  
  {
    return returnFalse(res,{ message: "Database not access lv1" });
  }
  if(!await tableSelect.checkDataToEdit(req)){
    return returnFalse(res,{ message: "Database not access lv2" });
  }
  let data=req.body;
  let dataUser= tableSelect.getFieldToDelete();
  var deleteSQL = squel.update().table(tableSelect.getNameTable())
    .set("id_updated",req.currentUser.users_id)
    .set("updated_at","NOW()",{dontQuote: true})
    .set("deleteflag",1)
    .where(dataUser.locationSelect+'='+data[dataUser.locationSelect]);
  knex.raw(deleteSQL.toString())
      .then(function(x) {
          return returnOK(res,x);   
      }).catch(function(err){
        return returnNotFound(res,{ message: "Database inval" });   
      });
}



userCtrl.updateData= async  function (req, res) {

  var tableSelect=mangerModelAdmin(req.body.table);  
  if(!!!tableSelect){
    return returnNotFound(res,{ message: "Database inval" });
  }
  if(!tableSelect.checkDataEditDatabase(req.currentUser.manifestid,tableSelect.getTypeTable())){

    return returnNotFound(res,{ message: "Database not Acess 1" });
  }
  if(!await tableSelect.checkDataToEdit(req)){

    return returnNotFound(res,{ message: "Database not Acess 2" });
  }

  let data=req.body;
  var userid=req.currentUser.users_id;
  let dataUser=tableSelect.getFieldToDelete();
  var squelGet=squel.select().from(tableSelect.getNameTable());
  for(var i=0;i<dataUser.arrayCoppy.length;i++){
        let item=dataUser.arrayCoppy[i];
    /*    if(!!!data[item]) squelGet.set(item,null);
       else
        authen.set(item,data[item]);
     */
      squelGet.field(item);
  }
  squelGet.where(dataUser.locationSelect+'='+data[dataUser.locationSelect]);


  var authen = squel.insert().into(tableSelect.getNameTable())
                      .fromQuery( dataUser.arrayCoppy, squelGet);
                      console.log("updateDataauthen.toString() ",authen.toString());
  var dataAdd= await knex.raw(authen.toString());
  if((dataAdd==null)||(dataAdd.length<1)) return returnNotFound(res,"Không tồn tại bản ghi dữ liệu này");     
  var authen2 = squel.update().table(tableSelect.getNameTable());
                        authen2.where(dataUser.locationSelect+'='+dataAdd[0].insertId)
                        .set(dataUser.valueSelect,1) 
                        .set("id_updated",userid)
                        .set("oldid",data[dataUser.locationSelect])
                        .set("deleteflag",1)
                        .set("updated_at","NOW()",{dontQuote: true});
  var deleteAdd= await knex.raw(authen2.toString());
  if((deleteAdd==null)||(deleteAdd.length<1)) return returnFalse(res,"Lỗi cập nhật dữ liệu"); 
  var sqlData = await tableSelect.checkSqlUpdateAdmin(req,data);   
  knex.raw(sqlData).then(function(x) {
      return returnOK(res,x);
  }).catch(function(err){
      return returnFalse(res,err);
  });
      
}

userCtrl.updateUser = async (req, res) => {
  var tableSelect=mangerModelAdmin(req.body.table);  
  if(!!!tableSelect){
    return returnNotFound(res,{ message: "Database inval" });
  }
  if(!tableSelect.checkDataEditDatabase(req.currentUser.manifestid,tableSelect.getTypeTable())){

    return returnNotFound(res,{ message: "Database not Acess 1" });
  }
  let data=req.body;
  let dataUser=tableSelect.getFieldToDelete();
  var userid=data[dataUser.locationSelect];
  var authen = squel.update().table(tableSelect.getNameTable());
  authen.where(dataUser.locationSelect+'='+userid)
              .set('name', data.name)
              .set('fullname', data.fullname)
              .set('phoneNumber', data.phone)
              .set('contact', data.contact)
              .set("oldid", data[dataUser.locationSelect])
              .set('updated_at', 'NOW()',{dontQuote: true})
  console.log("updateDataauthen.toString() ",authen.toString());
  knex.raw(authen.toString()).then(function(x) {
    return returnOK(res,'Cập nhật dữ liệu thành công');
}).catch(function(err){
    return returnFalse(res,err);
});

}

userCtrl.updateFistPages= async  function (req, res) {
  var tableSelect=mangerModelAdmin('pages_content');  
  if(!tableSelect.checkDataEditDatabase(req.currentUser.manifestid,tableSelect.getTypeTable())){
    return returnNotFound(res,{ message: "Database inval" });
  }
  var sqlUpdate = 'UPDATE pages_content SET set_to_fist = ( SELECT MAX(set_to_fist) + 1 ) WHERE deleteflag =0 and pages_content_id='+
          req.body['pages_content_id']+';'; 
  knex.raw(sqlUpdate).then(function(x) {
    return returnOK(res,x);     
  }).catch(function(err){
    return returnNotFound(res,err);    
  });
}


userCtrl.registerUser = async function (req, res) {
    var table ='users';
    var tableSelect=mangerModelAdmin(table);
    var exittingUser= await tableSelect.checkInvalUserExistingToRegister(req.body);
    if(exittingUser) {
      res.status(HttpStatus.UNAUTHORIZED).json({
          success: false,
          message: 'Tài khoản đã tồn tại xin vui lòng kiểm tra lại',
      });
    }
    var newUser = squel.insert().into('users')
                  .set('name', req.body.name)
                  .set('fullname', req.body.fullname)
                  .set('email', req.body.email)
                  .set('password', req.body.password)
                  .set('phoneNumber', req.body.phoneNumber)
                  .set('contact', req.body.contact)
                  .set('addrid', '0')
                  .set('avartar', '')
                  .set('created_at', 'NOW()',{dontQuote: true})
                  .set('updated_at', 'NOW()',{dontQuote: true})
                  .set('id_created', 0)
                  .set('id_updated', 0)
                  .set('note', '')
                  .set('manifestid', req.currentUser.manifestid)
                  .set('deleteflag', '0')
                  .set('oldid', '0');
                console.log(newUser.toString());
                knex.raw(newUser.toString())
                .then(result => {
                  return returnOK(res,{result:"Please waitting admin comfirm"});
                }
                , 
                error => {
                  return returnFalse(res,error);
                });
}

userCtrl.resetPass= async function  (req, res) {
  const data = req.body;
  User.query({
    where: {email: data.email},
    select: [
      'userid',
      'fullname',
      'manifestid'
    ]
  })
  .fetch({ require: false })
  .then((user) => {
      if (!user) {
        res.status(HttpStatus.NOT_FOUND).json({ error: 'No such this email' });
      } else {
      const userid = user.get('userid');
      const nameUser = user.get('fullname');
      var transporter = nodemailer.createTransport({
        // cofig mail server
        host: 'smtp.gmail.com',
        port: 465,
        secure: true,
        auth: {
            user: 'testairsense@gmail.com', //Tài khoản gmail Airsense
            pass: 'giang2001' //Mật khẩu  gmail Airsense
        },
        tls: {
            // do not fail on invalid certs
            rejectUnauthorized: false
        }      
      })
      let token = getRamdomData(90);
      const port = process.env.APP_PORT || 3000;
      const host =  process.env.APP_HOST || 'localhost';
      let URLtogetLink = 'http://' + host +':' + port + '/api/auth/resetPassword/' + userid + '/' + token;
      console.log(URLtogetLink);
      var content = '';
    content += `
    <div id="cover-mail" style=" width: 950px; background-color: #ccc; position: relative; margin: 0 auto;">
    <div class="logo-ass" style="position: absolute ;width:186px ; height:46px ; background: url(./assets/font-logo/airsense.png) top center / cover no-repeat; left: 0; right: 0; top: 36px; margin: 0 auto; "></div>
<div class="container" style="position: absolute; background-color: #fff; width: 625px; height: 267px;  left: 0; right: 0; top: 120px; margin: 0 auto;">
    <h2 style="font-family: Whitney,Helvetica Neue,Helvetica,Arial,Lucida Grande,sans-serif;
    font-weight: 500;
    font-size: 20px;
    color: #4f545c;
    letter-spacing: 0.27px; margin-top: 56px;"${nameUser} này,</h2>
    <p style=" margin-bottom: 35px;    color: #737f8d;
    font-family: Whitney,Helvetica Neue,Helvetica,Arial,Lucida Grande,sans-serif;
    font-size: 16px;
    line-height: 24px;
    text-align: left;">Mật khẩu Airsense của bạn có thể được reset bằng nút bên dưới. Nếu bạn không yêu cầu mật khẩu mới, hãy bỏ qua email này.</p>
    <div style=" width:150px ; height: 44px; margin-left: auto; margin-right: auto; margin-bottom: 42px;">
    <a href=${URLtogetLink} style=" border-radius: 1px; color: #fff; background: rgb(88, 219, 88); text-align: center; display: block; line-height: 44px; text-decoration: none;     color: white;
        font-family: Ubuntu,Helvetica,Arial,sans-serif;
        font-size: 15px;
        font-weight: normal;
        text-transform: none;">Reset Mật Khẩu</a></div>
    <div class="line" style="margin-bottom: 39px; background-color: #bec7d4; width: 100%; height: 2px;"></div>
    <p style="color: #747f8d;
    font-family: Whitney,Helvetica Neue,Helvetica,Arial,Lucida Grande,sans-serif;
    font-size: 13px;
    line-height: 16px;
    text-align: left;">Cần giúp đỡ? <a href="">Liên hệ nhóm hỗ trợ</a> hoặc thông qua Twitter <a href="">@discord</a>. </br>
        Muốn cung cấp phản hồi? Hãy cho chúng tôi biết ý kiến của bạn trên <a href="">trang phản hồi</a>.</p>
        <div id="footer-mail"  style="background-color: #f9f9f9; margin-top: 74px; color: #99aab5;
        font-family: Whitney,Helvetica Neue,Helvetica,Arial,Lucida Grande,sans-serif;
        font-size: 12px;
        line-height: 24px;
        text-align: center;">Được gửi từ hệ thống <a href="" style="text-decoration: none;">Airsense</a>
            - Địa chỉ: Số 1, Đại Cồ Việt, Hai Bà Trưng, Hà Nội 
        </div>
        </div>
    </div>
    `;
      // thiết lập đối tượng, nội dung gửi email
    var mainOptions = { 
      from: 'NQH-Test nodemailer',
      to: req.body.email,
      subject: 'Reset Password',
      html: content //Nội dung html mình đã tạo trên kia 
  }

  transporter.sendMail(mainOptions, function(err, info){
    if (err) {
        console.log(err);
        req.flash('mess', 'Lỗi gửi mail: '+err); //Gửi thông báo đến người dùng
        res.redirect('/');
    } else {
        console.log('Message sent: ' +  info.response);
        const current_id = userid;
        const manifestId = user.get('manifestid');
        var authen2 = squel.insert().into("oauthen2")
                .set("manifestid",manifestid)
                .set("userid",current_id)
                .set("tocken",token)
                .set("id_updated",current_id)
                .set("id_created",current_id)
                .set("deleteflag",0)
                .set("created_at",'NOW()',{dontQuote: true})
                .set("updated_at",'NOW()',{dontQuote: true})
                .set("deleteflag",0)
                .set("time_relase",'NOW() + INTERVAL 1 DAY',{dontQuote: true})
                .set('check_reset', 'reset');
      console.log(authen2.toString());
      knex.raw(authen2.toString())
                .then(function(x) {
                    res.json({
                        success: true,
                        message: 'Gửi email thành công'
                    });
                })
                .catch(function(err1){
                    res.status(HttpStatus.UNAUTHORIZED).json({
                        success: false,
                        message: 'Problem SQL.',
                    });
                });



        res.redirect('/');
    }
});


    }
    });
  
   
}


userCtrl.newResetPassword = async function(req, res) {
  const data = req.body;
  var checkToken = `SELECT tocken from oauthen2 WHERE userid = ${data.userId} AND check_reset = 'reset' AND created_at > date_sub(now(), interval 10 minute)`;
  var result = await knex.raw(checkToken.toString());
  if(!result) {
    console.log('Quá thời gian quy định, xin yêu cầu gửi email lại');
  }
  else {
    const tokenDB = result[0][0].tocken;
    console.log(tokenDB);
    if(tokenDB == data.token) {
      var authen = squel.update().table('users');
            authen.where('usersid='+data.userId)
              .set('password', data.password)
              .set('updated_at', 'NOW()',{dontQuote: true})
          console.log("updateDataauthen.toString() ",authen.toString());
          knex.raw(authen.toString())
          .then(function(x) {
                return returnOK(res,'Cập nhật mật khẩu thành công');
            })
            .catch(function(err){
                return returnFalse(res,err);
        })

    }
    else {
      console.log('Quá thời gian quy định, xin yêu cầu gửi email lại');
    }
  }

  
  

  
}

// code hust tech
userCtrl.changePassword1= async function(req, res) {
  //var acount="SELECT * FROM users " +request.body;
  var authen = squel.select().from('users')
                        .where("email='"+data["email"]+"'")
                        .where("forgot_pass_token='"+data["forgot_pass_token"]+"'")
                        .where("deleteflag=0");
   var result= await knex.raw(authen.toString());
   if ((result==null)||(result.length==0)) {
      return returnNotFound(res,{ message: "acao Not exitting "});
   }
   result[0][0].currentUser={users_id:0};
   result[0][0].table='users';
  //mailBoxSupport.sendEmailNomal(result[0]["add_table"].email,"đổi mat khau thanh cong")
   updateData(result[0][0],res);
}

// code airsense

userCtrl.changePassword = async (req, res) => {
  var tableSelect=mangerModelAdmin(req.body.table);  
  if(!!!tableSelect){
    return returnNotFound(res,{ message: "Database inval" });
  }
  if(!tableSelect.checkDataEditDatabase(req.currentUser.manifestid,tableSelect.getTypeTable())){

    return returnNotFound(res,{ message: "Database not Acess 1" });
  }
  let data=req.body;
  let dataUser=tableSelect.getFieldToDelete();
  User.query({
    where: {userid: data[dataUser.locationSelect]},
    select: [
      'password'
    ]
  })
  .fetch({ require: false })
  .then((user) => {
      if (!user) {
        res.status(HttpStatus.NOT_FOUND).json({ error: 'No such user' });
      } else {
        const password = user.get('password');
        if(password === data.oldPassword) {
          var authen = squel.update().table(tableSelect.getNameTable());
            authen.where(dataUser.locationSelect+'='+data[dataUser.locationSelect])
              .set('password', data.newPassword)
              .set('updated_at', 'NOW()',{dontQuote: true})
              .set("oldid", data[dataUser.locationSelect])
          console.log("updateDataauthen.toString() ",authen.toString());
          knex.raw(authen.toString())
          .then(function(x) {
                return returnOK(res,'Thay đổi mật khẩu thành công');
            })
            .catch(function(err){
                return returnFalse(res,err);
        })
      }
    }
    });


}



module.exports = userCtrl;
