const TypeModel= require('../middlewareDatabase/TypeModel.js');
const TableView= require('../middlewareDatabase/TableView.js');
const TableManifest= require('../middlewareDatabase/TableManifest.js');
const TABLE_NAME = 'mqtt_microservice';
const CommonModel= require('../middlewareDatabase/CommonModel.js');
const  defineManifest  = require('../../middlewares/CheckManifest.js');
const CustomerAcess= require('../middlewareDatabase/CustomerAcess.js');
/**
 * User model.
 */
class MqttMicroservice extends CommonModel {
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
             add:CustomerAcess.NOT_ACESS,
             view:CustomerAcess.NOT_ACESS  }; 
  }
  getFieldToAdd(){
      return {
          valueSetup: ["content","mqtt_pub","mqtt_sub","mqtt_user","mqtt_pass","mqtt_id"]
      };
  }
  getFieldToDelete(){
      return {
          arrayCoppy:["content","mqtt_pub","mqtt_sub","mqtt_user","mqtt_pass","mqtt_id","created_at","id_created"],
          locationSelect:"mqtt_microservice_id",
          valueSelect:"deleteflag",
          userUpdate:"id_updated"
      };
  }
  
  
  getSQLReport(currentUser){
    console.log("getSQLReport...2....... " ,currentUser.permission_id); 
      return ('SELECT mqtt_microservice.* FROM mqtt_microservice ');
        //  + defineManifest.checkManifestTableUser(currentUser.permission_id,currentUser.users_id,currentUser.value_manifest));
  }
  getJsonTofind(){
      return [];
  }

}

module.exports =  MqttMicroservice;
