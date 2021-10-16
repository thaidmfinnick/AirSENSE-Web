const bcrypt = require('bcrypt');
const HttpStatus = require('http-status-codes');
const knex = require('../config/knex.js');
var squel = require("squel");
const TableManifest= require('../models/middlewareDatabase/TableManifest.js');
const {mangerModelAdmin} = require('../models/database/managerAll.model.js');
const {returnOK,returnFalse,returnNotFound } = require('../utils/returnResponse.js');
var userCtrl={};
 


                          
userCtrl.getTableData =function (req, res) {
  var startPage=0;
  if(!!req.body.startPage) startPage=req.body.startPage;
  var tableSelect=mangerModelAdmin(req.body.table);
  if(!!tableSelect){
    if(!tableSelect.checkAcessGetDatabase(req.currentUser.permission_id,tableSelect.getTypeTable())){
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
  //var acount="SELECT * FROM users " +request.body;
  var authen = squel.select().from('users')
                        .where("email='"+data["email"]+"'")
                        .where("forgot_pass_token='"+data["forgot_pass_token"]+"'")
                        .where("deleteflag=0");
   var result= await knex.raw(authen.toString());
   if ((result==null)||(result.length==0)) {
    return returnNotFound(res,{ message: "acao Not exitting "});
   }
   ////mailBoxSupport.sendEmailNomal(result[0]["add_table"].email,"please comfirm email "+result[0]["add_table"].forgot_pass_token)
}

userCtrl.changePassword= async function(req, res) {
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


module.exports = userCtrl;
