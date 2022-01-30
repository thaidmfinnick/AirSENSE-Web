
import User_View from './user.table.js';

import Adress from './Adress.table';
import DecentralizationAccess from './DecentralizationAccess.table';
import GroupContent from './GroupContent.table';
import MqttMicroservice from './MqttMicroservice.table';
import MqttUser from './MqttUser.table';
import PagesContent from './PagesContent.table';
import AdvertisementContent from './AdvertisementContent.table';
import ProductBack from './ProductBack.table';
import ServiceBill from './ServiceBill.table';
import ProductLost from './ProductLost.table';
import Enterprise from './Enterprise.table';
import DetailBank from './DetailBank.table';
import Customer from './Customer.table';
import Company from './Company.table';
import ProductStore from './ProductStore.table';
import Product from './Product.table';
import ProductBuyDetail from './ProductBuyDetail.table';
import ProductBuy from './ProductBuy.table';
import ReturnService from './ReturnService.table';
import ServiceCharging from './ServiceCharging.table';
import Service from './Service.table';
import GroupContentSub from './GroupContentSub.table';
import ServiceGroup from './ServiceGroup.table';

import {validateEmail,validatePhone,isNumeric,validateDate } from '../../utils/commonUtil';


const classesFactory = {User_View ,Adress,DecentralizationAccess,GroupContent,
    MqttMicroservice,MqttUser,PagesContent ,AdvertisementContent ,ServiceBill
    ,ProductLost,Enterprise ,DetailBank ,Customer ,Company ,ProductStore ,Product,ProductBuyDetail
    ,ProductBuy,ProductBack,ReturnService ,ServiceCharging ,Service,GroupContentSub,ServiceGroup};
const classesFactorryMapping = {  users:"User_View", adress:"Adress" ,
                                decentralization_access:"DecentralizationAccess",group_content:"GroupContent" 
                                , mqtt_microservice:"MqttMicroservice",
                                mqtt_user:"MqttUser" , gro_pages_content:"PagesContent",
                                advertisement_content:"AdvertisementContent", product_back:"ProductBack",
                                service_bill:"ServiceBill" ,product_lost:"ProductLost" ,enterprise:"Enterprise"
                                ,detailbank:"DetailBank", customer:"Customer",company:"Company" ,
                                product_store:"ProductStore" ,product:"Product",product_buy_detail:"ProductBuyDetail",
                                product_buy:"ProductBuy",return_service:"ReturnService",service_charging:"ServiceCharging",
                                service:"Service",group_content_sub:"GroupContentSub",service_group:"ServiceGroup" };   

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
            dataValue.selectValidate= tableSelect.getColumeValidate();
            return dataValue;
        }  
    }
    return {};
};


export const checkValidateValue = (infoTitle,value) =>{
    var validate = {validate:true ,err:" "};
    for(var i=0;i<infoTitle.length;i++){
        let detail=infoTitle[i].view;
        let titleCheck = infoTitle[i].title;
        let accessValue = value[detail];
        let checkValidate =infoTitle[i].selectValidate;
        validate.err =  titleCheck +"= " +accessValue +" ! ";
        if(checkValidate=="email"){
            if(!validateEmail(accessValue)){
                validate.validate=false;
                validate.err += "Xin vui lòng check email";
                break; 
            }
        } else if(checkValidate=="phone"){
            if(!validatePhone(accessValue)){
                validate.validate=false;
                validate.err += "Xin vui lòng kiểm tra định dạng phone";
                break; 
            }
        } else if(checkValidate=="password"){
            if(accessValue.length<6){
                validate.validate=false;
                validate.err += "Độ dài mật khẩu <6";
                break; 
            }
        } else if(checkValidate=="leng3"){
            if(accessValue.length<3){
                validate.validate=false;
                validate.err += "Độ dài ký tự không hợp lệ , độ dài >3";
                break; 
            }
        } else if(checkValidate=="leng6"){
            if(accessValue.length<6){
                validate.validate=false;
                validate.err += "Độ dài ký tự không hợp lệ , độ dài >6";
                break; 
            }
        } else if(checkValidate=="number"){
            if(!isNumeric(accessValue)){
                validate.validate=false;
                validate.err += "Định dạng phải là số";
                break; 
            }
        } else if(checkValidate=="date"){
            if(!validateDate(accessValue)){
                validate.validate=false;
                validate.err += "Không đúng định dạng ngày tháng năm";
                break; 
            }
        }    
    }
    return validate;
}

