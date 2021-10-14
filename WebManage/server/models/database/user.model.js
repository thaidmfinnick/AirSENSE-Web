const TypeModel= require('../middlewareDatabase/TypeModel.js');
const TableView= require('../middlewareDatabase/TableView.js');
const TableManifest= require('../middlewareDatabase/TableManifest.js');
const TABLE_NAME = 'users';
var squel = require("squel");
const knex = require('../../config/knex.js');
const CommonModel= require('../middlewareDatabase/CommonModel.js');
const  defineManifest  = require('../../middlewares/CheckManifest.js');
const CustomerAcess= require('../middlewareDatabase/CustomerAcess.js');
/**
 * User model.
 */
class User extends CommonModel {
  /**
   * Get table name.
   */
  get tableName() {
    return TABLE_NAME;
  }

  /**
   * Table has timestamps.
   */
  get hasTimestamps() {
    return true;
  }
/*
  verifyPassword(password) {
    return this.get('password') === password;
  } */
  getNameTable=()=>{ return TABLE_NAME;}
  getTypeTable(){ return TypeModel.SELL_PRODUCT;}
  customerAcess(){ 
    return  {edit:CustomerAcess.NOT_ACESS,
             add:CustomerAcess.NOT_ACESS,
             view:CustomerAcess.NOT_ACESS  }; 
  }
  getFieldToAdd(){
      return {
          valueSetup: ["username","email","password","phone","avatar","fullname","permission_id","address","note" ]
      };
  }
  getFieldToDelete(){
      return {
          arrayCoppy:["username","email","password","phone","avatar","fullname","permission_id","address","note" ,"created_at","id_created"],
          locationSelect:"users_id",
          valueSelect:"deleteflag",
          userUpdate:"id_updated"
      };
  }
  
  
  getSQLReport(currentUser){
    console.log("getSQLReport...2....... " ,currentUser.permission_id); 
      return ('SELECT users.users_id,users.username,users.email,users.phone,users.avatar,users.fullname,users.permission_id,users.address,users.note'
      +',db.username  As name_create, dc.username  As name_update ,de.content As manifest_content FROM users LEFT JOIN users db ON db.users_id=users.id_created LEFT JOIN users dc ON dc.users_id=users.id_updated  LEFT JOIN permission de ON de.permission_id=users.permission_id');
   //       + defineManifest.checkManifestTableUser(currentUser.permission_id,currentUser.users_id,currentUser.value_manifest));
  }

  getConditionManisfest(info){
    return "users.deleteflag=0 AND users.permission_id>"+info.permission_id+ " ";
  }

  getJsonTofind(){
      return [];
  }

  async checkValueEmailData(email){
    var squelGet=squel.select().from('users').where('email="' + email +'"').where('deleteflag=0');
    var info= await knex.raw(squelGet.toString());
    if((info!=null)&&(info.length>0)) {
      return true;
    }
    return false;
  }


}

module.exports =  User;
