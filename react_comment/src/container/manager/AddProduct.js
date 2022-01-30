"use strict";

import React, {useState, useEffect } from 'react';
import TableDataView from '../../compoment/table/TableDataView.js';
import classNames from 'classnames';
import ManagerData from '../../actions/ManagerData.js'
import Swal from 'sweetalert2';
import InfoMaterial from '../../compoment/info/InfoMaterial.js';
import StoreMaterial from '../../compoment/info/StoreMaterial.js';
import DetailProduct from '../../compoment/info/DetailProduct.js';
import {addOneDataToTable,updateOneDataInfoTable} from '../../api/httpBaseUtil.js'
  var newInfo={
    product:{product_id:0,company_id:0,name:"",detail:"",image:"" ,store:0},
    product_store:[], product_image:[]
  };
  const AddProduct = ({oldProduct=null}) => {
    const [state, setState] = useState(oldProduct!=null?oldProduct:newInfo);
    const [loading, setLoading] = useState(false);
    const [allProduct, setAllProduct] = useState([]);

    useEffect(() => {
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
      currenInfo.product_store.company_id= currenInfo.product.company_id;
      currenInfo.product_image.forEach(element => {
        element.company_id= currenInfo.product.company_id;
      });
      sendDataInfo("product",currenInfo.product,currenInfo.product.product_id).then((product_id) => {
        currenInfo.product.product_id= product_id;
        currenInfo.product_store.product_id= product_id;
        currenInfo.product_image.forEach(element => {
          element.company_id=  product_id;
        });
        currenInfo.product_image.push({image_id:0,product_id:product_id, id:0,
                                        name_image_detail:"",image_info_detail:currenInfo.product.image,cost_detail:0});
        setState(currenInfo);
        setLoading(false);
      });
    }

    function sendProductStore(index){
      var currenInfo=state;
      setLoading(true);
      let data=currenInfo.product_store[index];
      sendDataInfo("product_store",data,data.id).then((infoproduct) => {
        currenInfo.product_store[index].store_product_id=infoproduct;
        currenInfo.product_store[index].id=infoproduct;
        /*currenInfo.product_store.push({store_product_id:0, product_id:currenInfo.product.product_id,
                                      company_id:currenInfo.product.company_id, content:"",id:0,
                                       product_image:"", number:0, contain:0, expridate:""});*/
        setState(currenInfo);
        setLoading(false);
      });
    }
    function sendDetailProduct(index){
      var currenInfo=state;
      setLoading(true);
      let data=currenInfo.product_image[index];
      sendDataInfo("product_image",data,data.id).then((infoproduct) => {
        currenInfo.product_image[index].image_id=infoproduct;
        currenInfo.product_image[index].id=infoproduct;
        currenInfo.product_store.push({store_product_id:0, product_id:currenInfo.product.product_id,
                                      company_id:currenInfo.product.company_id, content:"",id:0,
                                       product_image:0, number:0, contain:0, expridate:""});
        setState(currenInfo);
        setLoading(false);
      });
    }


    return (
      <div className={'root-dm-message'}>
        <br/>
        {loading?"loading":""}
        <br/>
        <InfoMaterial 
              info={state.product} 
              select={allProduct}
              changeData={(value)=>{onChange("product",value);}}
              sendTemplate={()=>sendProduct()}/>
        {state.product.product_id? 
              <div>
                  <DetailProduct  info={state.product_image} 
                        idProduct={state.product.product_id}
                        changeData={(value)=>{onChange("product_image",value);}} 
                        sendTemplate={(index)=>sendDetailProduct(index)} />
                  <StoreMaterial  info={state.product_store}
                        product_image={state.product_image}
                        idProduct={state.product.product_id}
                        companyId={state.product.company_id} 
                        changeData={(value)=>{onChange("product",value);}}
                        sendTemplate={(index)=>sendProductStore(index)}  />
              </div>
              :
              ""
        }
      
      </div>
    );
  };
  
  export default AddProduct;
