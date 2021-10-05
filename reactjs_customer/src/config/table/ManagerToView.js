
import User_View from './user.table.js';

import Adress from './Adress.table';
import DecentralizationAccess from './DecentralizationAccess.table';
import GroupContent from './GroupContent.table';
import MqttMicroservice from './MqttMicroservice.table';
import MqttUser from './MqttUser.table';
import PagesContent from './PagesContent.table';
import AdvertisementContent from './AdvertisementContent.table';
import BackProduct from './BackProduct.table';
import BillService from './BillService.table';
import LostProduct from './LostProduct.table';
import Enterprise from './Enterprise.table';
import DetailBank from './DetailBank.table';
import Customer from './Customer.table';
import Company from './Company.table';
import StoreProduct from './StoreProduct.table';
import Product from './Product.table';
import BuyProductDetail from './BuyProductDetail.table';
import BuyProduct from './BuyProduct.table';
import ReturnService from './ReturnService.table';
import ChargingService from './ChargingService.table';
import Service from './Service.table';
import GroupContentSub from './GroupContentSub.table';


const classesFactory = {User_View ,Adress,DecentralizationAccess,GroupContent,
    MqttMicroservice,MqttUser,PagesContent ,AdvertisementContent ,BillService
    ,LostProduct,Enterprise ,DetailBank ,Customer ,Company ,StoreProduct ,Product,BuyProductDetail
    ,BuyProduct,BackProduct,ReturnService ,ChargingService ,Service,GroupContentSub};
const classesFactorryMapping = {  users:"User_View", adress:"Adress" ,
                                decentralization_access:"DecentralizationAccess",group_content:"GroupContent" 
                                , mqtt_microservice:"MqttMicroservice",
                                mqtt_user:"MqttUser" , pages_content:"PagesContent",
                                advertisement_content:"AdvertisementContent", backproduct:"BackProduct",
                                bill_service:"BillService" ,lostproduct:"LostProduct" ,enterprise:"Enterprise"
                                ,detailbank:"DetailBank", customer:"Customer",company:"Company" ,
                                storeproduct:"StoreProduct" ,product:"Product",buyproductdetail:"BuyProductDetail",
                                buyproduct:"BuyProduct",return_service:"ReturnService",charging_service:"ChargingService",
                                service:"Service",group_content_sub:"GroupContentSub" };   

export const exportColumeData = (table,callback=null) =>{
    var nameConvert=classesFactorryMapping[table];
    if(!!nameConvert){
        var tableSelect=new classesFactory[nameConvert]();
        if(!!tableSelect) return tableSelect.getColumeShow(callback);
    }
    return [];
};

export const exportColumeEdit = (table) =>{
    var nameConvert=classesFactorryMapping[table];
    if(!!nameConvert){
        var tableSelect=new classesFactory[nameConvert]();
        if(!!tableSelect) return tableSelect.getInfoToEdit();
    }
    return {};
};

export const exportColumeAdd = (table) =>{
    var nameConvert=classesFactorryMapping[table];
    if(!!nameConvert){
        var tableSelect=new classesFactory[nameConvert]();
        if(!!tableSelect)
        {
            var dataValue = {};
            dataValue.view= tableSelect.getInfoToAdd();
            dataValue.title= tableSelect.getTitleToAdd();
            dataValue.html= tableSelect.getHtmlAdd();
            dataValue.typeSelect= tableSelect.getTypeSelectToAdd();
            dataValue.selectTabble= tableSelect.getTypeSelectTabbleToAdd();
            return dataValue;
        }  
    }
    return {};
};
