
const Adress = require('./adress.model.js');
const DecentralizationAccess = require('./decentralizationAccess.model.js');
const GroupContent = require('./groupContent.model.js');
const MqttMicroservice = require('./MqttMicroservice.model.js');
const MqttUser = require('./MqttUser.model.js');
const PagesContent = require('./PagesContent.model.js');
const GroupContentSub = require('./groupContentSub.model.js');
const Permission = require('./permission.model.js');
const User = require('./user.model.js');
const BackProduct = require('./backProduct.model.js');
const BillService = require('./billService.model.js');
const BuyProduct = require('./buyProduct.model.js');
const BuyProductDetail = require('./buyProductDetail.model.js');
const ChargingService = require('./chargingService.model.js');
const Company = require('./company.model.js');
const Customer = require('./customer.model.js');
const DetailBank = require('./detailBank.model.js');
const Enterprise = require('./enterprise.model.js');
const LostProduct = require('./lostProduct.model.js');
const Product = require('./product.model.js');
const ProductImage = require('./productImage.model.js');

const ReturnService = require('./returnService.model.js');
const Service = require('./service.model.js');
const StoreProduct = require('./storeProduct.model.js');
const AdvertisementContent = require('./advertisementContent.model.js');

const SparcPosts = require('./sparcPosts.model');
const sparcSensorWarning = require('./sparcSensorWarning.model');
const sparcSensorMaxMin = require('./sparcSensorMaxMin.model');
const SparcAcessLocationSensor = require('./sparcAcessLocationSensor.model');



const classesFactory = {User,Permission ,Adress,DecentralizationAccess,GroupContent,
    MqttMicroservice,MqttUser,PagesContent,GroupContentSub,BackProduct,
    BillService,BuyProduct,BuyProductDetail,ChargingService,Company,Customer,DetailBank,
    Enterprise,LostProduct,Product,ReturnService,Service ,StoreProduct,AdvertisementContent};
const classesFactorryMapping = {  users:"User" , permission:"Permission",adress:"Adress" ,
                            decentralization_access:"DecentralizationAccess",group_content:"GroupContent" 
                            , mqtt_microservice:"MqttMicroservice", 
                            mqtt_user:"MqttUser" , pages_content:"PagesContent",group_content_sub:"GroupContentSub",
                            backproduct:"BackProduct",bill_service:"BillService", buyproduct:"BuyProduct",
                            buyproductdetail:"BuyProductDetail",charging_service:"ChargingService",
                            company:"Company",customer:"Customer",detailbank:"DetailBank",
                            enterprise:"Enterprise",lostproduct:"LostProduct",
                            product:"Product",return_service:"ReturnService",
                            service:"Service" ,storeproduct:"StoreProduct",
                            advertisement_content:'AdvertisementContent',
                            product_image:"ProductImage"
                        };
                        
const classesFactorryMappingUser = {  adress:"Adress" ,
                        decentralization_access:"DecentralizationAccess",group_content:"GroupContent" ,
                        mqtt_user:"MqttUser" , pages_content:"PagesContent",group_content_sub:"GroupContentSub",
                        backproduct:"BackProduct",bill_service:"BillService", buyproduct:"BuyProduct",
                        buyproductdetail:"BuyProductDetail",charging_service:"ChargingService",
                        company:"Company",customer:"Customer",detailbank:"DetailBank",
                        enterprise:"Enterprise",lostproduct:"LostProduct",
                        product:"Product",return_service:"ReturnService",
                        service:"Service" ,storeproduct:"StoreProduct",
                        advertisement_content:'AdvertisementContent',
                        product_image:"ProductImage"
                    };      


exports.mangerModelAdmin = function  (table) {
    var nameConvert=classesFactorryMapping[table];
    if(!!nameConvert){
        var tableSelect=new classesFactory[nameConvert]();
        if(!!tableSelect) return tableSelect;
    }
    return false;
};

exports.mangerModelUser = function  (table) {
    var nameConvert=classesFactorryMappingUser[table];
    if(!!nameConvert){
        var tableSelect=new classesFactory[nameConvert]();
        if(!!tableSelect) return tableSelect;
    }
    return false;
};