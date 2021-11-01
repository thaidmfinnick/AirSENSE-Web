const HttpStatus = require('http-status-codes');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
var squel = require("squel");
const User = require('../models/database/user.model.js');
const Oauthen2 = require('../models/database/oAuthen2.model.js');
const OAuthen2Customer = require('../models/database/oAuthen2Customer.model.js');
const {returnOK,returnNotAuthen,returnNotFound } = require('../utils/returnResponse.js');
var oauthen2=new Oauthen2();
var oAuthen2Customer=new OAuthen2Customer();
var lstLogin=[];
var lstLoginCustomer=[];
var authCtrl={};
/**
 * Returns jwt token if valid email and password is provided
 *
 * @param {object} req
 * @param {object} res
 * @returns {*}
 */
 authCtrl.login = function(req, res) {
  const { email, password } = req.body;
  lstLogin =lstLogin.filter(o=>((Date.now() - o.time)<2000));
  var emailExist=lstLogin.filter(o=>o.email==email);
  if(emailExist.length==1){
    return returnNotAuthen(res,{success: false,message: 'Bạn dang đăng nhập tài khoản hơn 2 lần trong 1s.'});
  }
  else if(emailExist.length>1)
  {
    return returnNotAuthen(res,{success: false,message: 'Bạn dang đăng nhập tài khoản hơn 2 lần trong 1s.'});
  }

  User.query({
    where: {email:email, deleteflag: 0}
  })
    .fetch({ require: false })
    .then((user) => {
     
      if (user) {
       

        lstLogin =lstLogin.filter(o=>o.email!=email);
        // bcrypt.compare(password,  user.get('password')).then(function(result) {
        //   console.log("user Inval",result);
        //   if(result) {
        //     console.log(a)
        //     oauthen2.responseLogin(res,user);  
        //   }      
        //   else{
        //     console.log('b')
        //     return returnNotAuthen(res,{success: false,message:'Authentication failed. Invalid password'});
        //   }
        // })
        // .catch(()=>{
        //   console.log('c');
        //   return returnNotAuthen(res,{success: false,message:'Authentication failed. Invalid password'});
        // });
        const userPassword = user.get('password');
        console.log("user Inval",userPassword);
        if(password==userPassword) {
          oauthen2.responseLogin(res,user); 
        }
        else{
            return returnNotAuthen(res,{success: false,message:'Authentication failed. Invalid password'});
        }

      } 
        else {
        lstLogin.push({email:email,count:1,time:Date.now()});
        return returnNotAuthen(res,{success: false,message:'Invalid username or password.'});
      }
    });
}




authCtrl.logOut = function(req, res) {
  var stringTocken = request.headers["authorization"];
        var stringData = stringTocken.split("Bearer ");
        var data = squel.update().table("oauthen2").set("deleteflag", 1)
            .set("updated_at", "NOW()", { dontQuote: true }).where("tocken = '" + stringData[1] + "'");
        var SQL = data.toString();
        // mySQLConfig.queryDbSQL(SQL).then(function (result) {
        //     callback(true);
        // })
        //     .catch(function (err) { callback(false, err); });
        // Oauthen2.query(SQL)
        console.log(SQL);

}


module.exports =authCtrl;