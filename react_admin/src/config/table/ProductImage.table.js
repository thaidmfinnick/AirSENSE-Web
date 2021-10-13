import EditIcon from '@material-ui/icons/Edit';
import DeleteIcon from '@material-ui/icons/Delete';
import React from 'react';
import ManagerData from '../../actions/ManagerData.js'
import {ActionControl ,TypeDialgueShow,SelectHTml} from '../../utils/commonUtil';

class ProductImage  {
    getColumeShow=(callback)=>{
        const columns = [
            {
              field: 'id',
              headerName: 'stt',
              width: 140,
            },
            {
              field: 'name',
              headerName: 'name',
              width: 200,
            },
            {
              field: 'name_image_detail',
              headerName: 'name_image_detail',
              width: 200,
            },
            {
              field: 'image_info_detail',
              headerName: 'image_info_detail',
              width: 240,
            },
            {
              field: 'cost_detail',
              headerName: 'cost_detail',
              width: 240,
            },
            {
              field: 'action',
              headerName: 'Thao tác',
              width: 140,
              renderCell: () => (
                <div>
                  <span
                    onClick={() => {
                      if(callback!=null) callback(ActionControl.ACTION_UPDATE);
                    }}
                  >
                  <EditIcon />
                  </span>
                  <span
                      onClick={() => {
                        if(callback!=null) callback(ActionControl.ACTION_DELETE);
                        }}
                    >
                    <DeleteIcon />
                  </span>
                </div>
              ),
            },
          ];
        return columns;
    }
    getInfoToEdit(){
      return {
        mainID:'pages_content_id',
        mainInfo:{
          field: 'title',
          headerName: 'Chi tiết sản phẩm',
          width: 240,
        },
        detailEdit:[
            {
                field: 'name',
                headerName: 'name',
                width: 200,
            },
            {
                field: 'name_image_detail',
                headerName: 'name_image_detail',
                width: 200,
            },
            {
                field: 'image_info_detail',
                headerName: 'image_info_detail',
                width: 240,
            },
            {
                field: 'cost_detail',
                headerName: 'cost_detail',
                width: 240,
            },
        ]
      }
    }

    getInfoToAdd(){
      return  ["product_id","name_image_detail","image_info_detail","cost_detail"];
    }
    getTitleToAdd(){
      return  ["product_id","name_image_detail","image_info_detail","cost_detail"];
    }
    getHtmlAdd(){
      return  [TypeDialgueShow.SELECT_CUSTOM,TypeDialgueShow.EDIT_TEXT,TypeDialgueShow.EDIT_TEXT,TypeDialgueShow.EDIT_TEXT];
    }
    getTypeSelectToAdd(){
      return  [SelectHTml.SelectGroupContentSub,SelectHTml.NOT_CHECK_HTML,SelectHTml.NOT_CHECK_HTML,SelectHTml.NOT_CHECK_HTML];
    }
    getTypeSelectTabbleToAdd(){
      return  ["product","","",""];
    }
    getColumeValidate(){
      return ["","leng6","",""];
    }
} 

export default  ProductImage;
