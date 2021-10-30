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
  console.log('this is the request');
  if(!!req.body.startPage) startPage=req.body.startPage;
  var tableSelect=mangerModelAdmin(req.body.table);
  if(!!tableSelect){
    if(!tableSelect.checkAcessGetDatabase(req.currentUser.permission_id,tableSelect.getTypeTable())){
      return returnNotFound(res,{ message: "Database inval" });
    }

   startPage =startPage*1000;
   var itemSelect=tableSelect.getValueToSelectToFind(req.body.dataFind);
   // notice here
   console.log('this is the current user');
   console.log(req.currentUser);
   console.log('The end !!!');
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
    if(!tableSelect.checkAcessGetDatabase(req.currentUser.permission_id,tableSelect.getTypeTable())){
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
    if(!tableSelect.checkAcessGetDatabase(req.currentUser.permission_id,tableSelect.getTypeTable())){
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
    if(!tableSelect.checkDataAddDatabase(req.currentUser.permission_id,tableSelect.getTypeTable())){
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
  if(!tableSelect.checkDataDeleteDatabase(req.currentUser.permission_id,tableSelect.getTypeTable()))  
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
  if(!tableSelect.checkDataEditDatabase(req.currentUser.permission_id,tableSelect.getTypeTable())){

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
  if(!tableSelect.checkDataEditDatabase(req.currentUser.permission_id,tableSelect.getTypeTable())){

    return returnNotFound(res,{ message: "Database not Acess 1" });
  }
  let data=req.body;
  var userid=req.currentUser.users_id;
  let dataUser=tableSelect.getFieldToDelete();
  var authen = squel.update().table(tableSelect.getNameTable());
  authen.where(dataUser.locationSelect+'='+userid)
              .set('name', data.name)
              .set('fullname', data.fullname)
              .set('phone', data.phone)
              .set('contact', data.contact)
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
  if(!tableSelect.checkDataEditDatabase(req.currentUser.permission_id,tableSelect.getTypeTable())){
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


userCtrl.registerUser = function (req, res) {
  var table ='users';
  var tableSelect=mangerModelAdmin(table);

  if(!!tableSelect){
    const saltRounds = 10;
    bcrypt.genSalt(saltRounds, function(err, salt) {
      bcrypt.hash(req.body.password, salt, function(err, hash) {
          // Store hash in your password DB.
        req.body.password = hash;
      });
  });
    var newUser = squel.insert().into('users')
                  .set('name', req.body.name)
                  .set('fullname', req.body.fullname)
                  .set('email', req.body.email)
                  .set('password', req.body.password)
                  .set('contact', req.body.contact)
                  .set('addrid', '0')
                  .set('avatar', '')
                  .set('created_at', 'NOW()',{dontQuote: true})
                  .set('updated_at', 'NOW()',{dontQuote: true})
                  .set('note', '')
                  .set('permission_id', req.currentUser.permission_id)
                  .set('deleteflag', '0');
                  
                  
              knex.raw(newUser.toString())
                  .then(function(x) {
                    var authen = squel.update().table('users');
                    authen.where('email='+req.body.email)
                      .set('password', PASSWORD(`${req.body.password}`))
                      .set('updated_at', 'NOW()',{dontQuote: true})
                  console.log("updateDataauthen.toString() ",authen.toString());
                  knex.raw(authen.toString())
                  .then(function(x) {
                        return returnOK(res,'Thay đổi mật khẩu thành công');
                    })
                    .catch(function(err){
                        return returnFalse(res,err);
                })

                      res.json({
                          success: true,
                          message: "Đăng kí thành công, xin chờ admin cấp quyền"
                      });
                  })
                  .catch(function(err1){
                      res.status(HttpStatus.UNAUTHORIZED).json({
                          success: false,
                          message: 'Problem SQL.',
                      });
                  });
    // if(!tableSelect.checkDataAddDatabase(req.currentUser.permission_id,tableSelect.getTypeTable())){
      
    //   return returnNotFound(res,{ message: "Database inval" });
    // }  
    // console.log('guys')

    // checkDatataBaseInval=true;
    // var userToget = squel.select().from('users').
    //                     where( squel.expr()
    //                                 .and("phone='"+req.body["phone"]+"'")
    //                                 .or("email='"+req.body["email"]+"'")
    //                     ).where("deleteflag=0");
    // console.log(userToget.toString());

    // knex.raw(userToget.toString())
    //       .then(result => {
    //           let data=req.body;
    //           let dataUser=  tableSelect.getFieldToAdd();//  DataTableFieldAdd[table];
    //           var authen = squel.insert().into(tableSelect.getNameTable());
    //           for(var i=0;i<dataUser.valueSetup.length;i++){
    //               let item=dataUser.valueSetup[i];
    //               if(!!!data[item]) authen.set(item,null);
    //               else
    //               authen.set(item,data[item]);
    //           }
    //           authen.set("id_created",0).set("id_updated",0)
    //           .set("created_at","NOW()",{dontQuote: true}) 
    //           .set("updated_at","NOW()",{dontQuote: true})
    //           .set("deleteflag",0);
    //           knex.raw(authen.toString())
    //             .then(result => {
    //               return returnOK(res,{result:"Please waitting admin comfirm"});
    //             }
    //             , 
    //             error => {
    //               return returnFalse(res,error);
    //             });
    //       }
    //       , 
    //       error => {
    //         return returnFalse(res,{ message: "phone and email is existing" } );
    //       });
  }
}

userCtrl.resetPass= async function  (req, res) {
  const data = req.body;
  User.query({
    where: {email: data.email},
    select: [
      'users_id',
      'permission_id'
    ]
  })
  .fetch({ require: false })
  .then((user) => {
      if (!user) {
        res.status(HttpStatus.NOT_FOUND).json({ error: 'No such this email' });
      } else {
      const userid = user.get('users_id');
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
        <div style="padding: 10px; background-color: #003375">
            <div style="padding: 10px; background-color: white;">
                <h4 style="color: #0085ff">Xin chào, chúng tôi đến hệ thống Airsense</h4>
                <p style="color: black">Có phải bạn đang yêu cầu lấy lại mật khẩu, vui lòng không cung cấp địa chỉ URL này cho bất cứ ai</p>
                <span style="color: black">${URLtogetLink}</span>
                <p style="color: red">Xin chân thành cảm ơn</p>
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
        const permission_id = user.get('permission_id');
        var authen2 = squel.insert().into("oauthen2")
                .set("permission_id",permission_id)
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
            authen.where('users_id='+data.userId)
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
  if(!tableSelect.checkDataEditDatabase(req.currentUser.permission_id,tableSelect.getTypeTable())){

    return returnNotFound(res,{ message: "Database not Acess 1" });
  }
  let data=req.body;
  var userid=req.currentUser.users_id;
  let dataUser=tableSelect.getFieldToDelete();
  User.query({
    where: {users_id: userid},
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
          console.log('OK');
          var authen = squel.update().table(tableSelect.getNameTable());
            authen.where(dataUser.locationSelect+'='+userid)
              .set('password', data.newPassword)
              .set('updated_at', 'NOW()',{dontQuote: true})
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
