const TypeModel = require("../middlewareDatabase/TypeModel.js");
const TableView = require("../middlewareDatabase/TableView.js");
const TableManifest = require("../middlewareDatabase/TableManifest.js");
const TABLE_NAME = "bill_service";
const CommonModel = require("../middlewareDatabase/CommonModel.js");
const defineManifest = require("../../middlewares/CheckManifest.js");
const CustomerAcess= require('../middlewareDatabase/CustomerAcess.js');
/**
 * User model.
 */
class BillService extends CommonModel {
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
  customerAcess(){ 
    return  {edit:CustomerAcess.NOT_ACESS,
             add:CustomerAcess.ONLY_USER,
             view:CustomerAcess.ONLY_USER  }; 
  }
  /*
  verifyPassword(password) {
    return this.get('password') === password;
  } */
  getNameTable() {
    return TABLE_NAME;
  }
  getTypeTable() {
    return TypeModel.SELL_PRODUCT;
  }

  getFieldToAdd() {
    return {
      valueSetup: ["customer_id", "service_id", "value", "content"]// "bank", "status"],
    };
  }
  getFieldToDelete() {
    return {
      arrayCoppy: ["customer_id", "service_id", "value", "content", "created_at", "id_created"],
      locationSelect: "bill_service_id",
      valueSelect: "deleteflag",
      userUpdate: "id_updated",
    };
  }

  getSQLReport(currentUser) {
    console.log("getSQLReport...2....... ", currentUser.permission_id);
    return "SELECT bill_service.*,customer.email,service.name FROM bill_service LEFT JOIN customer ON customer.customer_id=bill_service.bill_service_id LEFT JOIN service ON service.service_id=bill_service.service_id ";
    // + defineManifest.checkManifestTableUser(currentUser.permission_id,currentUser.users_id,currentUser.value_manifest));
  }
  getJsonTofind() {
    return [];
  }
}

module.exports = BillService;
