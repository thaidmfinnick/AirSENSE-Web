const TypeModel= require('../middlewareDatabase/TypeModel.js');
const TableView= require('../middlewareDatabase/TableView.js');
const TableManifest= require('../middlewareDatabase/TableManifest.js');
const TABLE_NAME = 'buyproduct';
const CommonModel= require('../middlewareDatabase/CommonModel.js');
const  defineManifest  = require('../../middlewares/CheckManifest.js');
const CustomerAcess= require('../middlewareDatabase/CustomerAcess.js');
var squel = require("squel");
/**
 * User model.
 */
class BuyProduct extends CommonModel {
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
  getNameTable(){ return TABLE_NAME;}
  getTypeTable(){ return TypeModel.SELL_PRODUCT;}
  customerAcess(){ 
    return  {edit:CustomerAcess.NOT_ACESS,
             add:CustomerAcess.ONLY_USER,
             view:CustomerAcess.ONLY_USER  }; 
  }
  getFieldToAdd(){
      return {
          valueSetup: ["user_id","selled_id","KM","Total"]
      };
  }
  getFieldToDelete(){
      return {
          arrayCoppy:["user_id","selled_id","KM","Total","created_at","id_created"],
          locationSelect:"buyproduct_id",
          valueSelect:"deleteflag",
          userUpdate:"id_updated"
      };
  }
  
  
  getSQLReport(currentUser){
    console.log("getSQLReport...2....... " ,currentUser.permission_id); 
      return ('SELECT buyproduct.* FROM buyproduct ');
         // + defineManifest.checkManifestTableUser(currentUser.permission_id,currentUser.users_id,currentUser.value_manifest));
  }
  getJsonTofind(){
      return [];
  }

  buyProductSQL(user_id,selled_id,dataInfo){
    var thebill = squel.insert().into('buyproduct');
    thebill.set("user_id",user_id);
    thebill.set("selled_id",selled_id);
    thebill.set("KM",0);
    thebill.set("Total",dataInfo["Total"]);
    thebill.set("id_created",0).set("id_updated",0)
            .set("created_at","NOW()",{dontQuote: true}) 
            .set("updated_at","NOW()",{dontQuote: true})
            .set("deleteflag",0)
            .set("oldid",0);
    return thebill.toString();
  }



  
}

module.exports =  BuyProduct;
