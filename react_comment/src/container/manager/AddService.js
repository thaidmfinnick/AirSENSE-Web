"use strict";

import React, {useState, useEffect } from 'react';
import TableDataView from '../../compoment/table/TableDataView.js';
import classNames from 'classnames';
import ManagerData from '../../actions/ManagerData.js'
import Swal from 'sweetalert2';
import InfoService from '../../compoment/info/InfoService.js';
import DetailService from '../../compoment/info/DetailService.js';
import {addOneDataToTable,updateOneDataInfoTable} from '../../api/httpBaseUtil.js'
  var newInfo={
    product:{service_group_id:0,company_id:0,image:"",title:"",content:"",page_service_id:0,titleAb:""},
    service:[]
  };

  const AddService = ({oldProduct=null}) => {
    const [state, setState] = useState(oldProduct!=null?oldProduct:newInfo);
    const [loading, setLoading] = useState(false);
    const [allAdvertisement, setAdvertisement] = useState([]);
    const [allProduct, setAllProduct] = useState([]);

    useEffect(() => {
        ManagerData.getLstDataPromise('advertisement_content').then(()=>{
            setAdvertisement(ManagerData.getTable('advertisement_content'));
        });
        ManagerData.getLstDataPromise('company').then(()=>{
            setAllProduct(ManagerData.getTable('company'));
        });
    }, []);

    const onChange = (name,value) => {
      setState((prev) => ({ ...prev, [name]: value }));
    };

    const sendDataInfo=(table,value,id)=>{
      return new Promise((resolve, reject) => {
        if(id<1) //adđ
            addOneDataToTable(table,value).then((response) => {resolve(response.data.result.insertId)}).catch((error) => {reject(error);});
        else  // edit
            updateOneDataInfoTable(table,value).then((response) => {resolve(response)}).catch((error) => {reject(error);})
      });
    }

    const sendProduct=()=>{
      var currenInfo=state;
      setLoading(true);
      sendDataInfo("service_group",currenInfo.product,currenInfo.product.service_group_id).then((service_group_id) => {
        currenInfo.product.service_group_id= service_group_id;
        setState(currenInfo);
        setLoading(false);
      });
    }

    function sendDetailProduct(index){
      var currenInfo=state;
      setLoading(true);
      let data=currenInfo.service[index];
      data.service_group_id = currenInfo.product.service_group_id;
    //  page_service_id
      sendDataInfo("service",data,data.id).then((infoproduct) => {
        currenInfo.service[index].service_id=infoproduct;
        currenInfo.service[index].id=infoproduct;
        setState(currenInfo);
        setLoading(false);
      });
    }


    return (
        <div className={'root-dm-message'}>
            <br/>
            {loading?"loading":""}
            <br/>
            <InfoService 
                info={state.product} 
                select={allProduct}
                changeData={(value)=>{onChange("product",value);}}
                sendTemplate={()=>sendProduct()}/>
            {state.product.service_group_id?
              <DetailService  info={state.service} 
                    idProduct={state.product.product_id}
                    changeData={(value)=>{onChange("service",value);}} 
                    sendTemplate={(index)=>sendDetailProduct(index)} />
              :""
            }
            
        </div>
    );
  };
  
  export default AddService;
