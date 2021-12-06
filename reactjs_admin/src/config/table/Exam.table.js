import EditIcon from '@material-ui/icons/Edit';
import DeleteIcon from '@material-ui/icons/Delete';
import React from 'react';
import ManagerData from '../../actions/ManagerData.js'
import {ActionControl ,TypeDialgueShow,SelectHTml} from '../../utils/commonUtil';

export default class Exam  {
    getColumeShow=(callback)=>{
        //"user_id","name","contactPhoneNumber","province","city","streetaddr","postCode"
        const columns = [
            {
              field: 'id',
              headerName: 'stt',
              width: 140,
            },
            {
              field: 'group_exam',
              headerName: 'group_exam',
              width: 200,
            },
            {
              field: 'group_exam_main',
              headerName: 'group_exam_main',
              width: 200,
            },
            {
              field: 'title',
              headerName: 'title',
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
            }
            
          ];
        return columns;
    }


    getInfoToEdit(){
      return {
        mainID:'exam_id',
        mainInfo:{
            field: 'name',
            headerName: 'Sản phẩm',
            width: 200,
        },
        detailEdit:[
          {
            field: 'group_exam',
            headerName: 'group_exam',
            width: 200,
          },
          {
            field: 'group_exam_id',
            headerName: 'group_exam_id',
            width: 200,
          },
          {
            field: 'title',
            headerName: 'title',
            width: 240,
          },
          
        ]
      }
    }

    getInfoToAdd(){
      return ["group_exam","group_exam_id","title"];
    }
    getTitleToAdd(){
      return ["group_exam","group_exam_id","title"];
    }

    getHtmlAdd(){
      return  [TypeDialgueShow.EDIT_TEXT,TypeDialgueShow.SELECT_TABLE,TypeDialgueShow.EDIT_TEXT];
    }
    getTypeSelectToAdd(){
      return  [SelectHTml.NOT_CHECK_HTML,SelectHTml.NOT_CHECK_HTML,SelectHTml.NOT_CHECK_HTML];
    }
    getTypeSelectTabbleToAdd(){
      return  ["","group_exam",""];
    }
    getColumeValidate(){
      return ["","",""];
    }
} 


