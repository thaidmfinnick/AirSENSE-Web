const TypeModel= require('../middlewareDatabase/TypeModel.js');
const CustomerAcess= require('../middlewareDatabase/CustomerAcess.js');

const TableView= require('../middlewareDatabase/TableView.js');
const TableManifest= require('../middlewareDatabase/TableManifest.js');
const CommonModel= require('../middlewareDatabase/CommonModel.js');
const TABLE_NAME = 'product_image';
const  defineManifest  = require('../../middlewares/CheckManifest.js');




/**
 * User model.
 */
class ProductImage extends CommonModel {
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
    return  {edit:CustomerAcess.ONLY_USER,
             add:CustomerAcess.ONLY_USER,
             view:CustomerAcess.ONLY_USER  }; 
  }

  getFieldToAdd(){
      return {
          valueSetup: ["product_id","name_image_detail","image_info_detail","cost_detail"]
      };
  }
  getFieldToDelete(){
      return {
          arrayCoppy:["product_id","name_image_detail","image_info_detail","cost_detail","created_at","id_created"],
          locationSelect:"image_id",
          valueSelect:"deleteflag",
          userUpdate:"id_updated"
      };
  }
  
  
  getSQLReport(currentUser){
    console.log("getSQLReport...2....... " ,currentUser.permission_id); 
      return ('SELECT product_image.* FROM product_image ');
         // + defineManifest.checkManifestTableUser(currentUser.permission_id,currentUser.users_id,currentUser.value_manifest));
  }
  getJsonTofind(){
      return [];
  }

  
}

module.exports =  ProductImage;
