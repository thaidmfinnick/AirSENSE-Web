import EditIcon from '@material-ui/icons/Edit';
import DeleteIcon from '@material-ui/icons/Delete';
import React from 'react';
import ManagerData from '../../actions/ManagerData.js'
import {ActionControl ,TypeDialgueShow,SelectHTml} from '../../utils/commonUtil';

export default class Course  {
    getColumeShow=(callback)=>{
        //"user_id","name","contactPhoneNumber","province","city","streetaddr","postCode"
        const columns = [
            {
              field: 'id',
              headerName: 'stt',
              width: 140,
            },
            {
              field: 'group_course',
              headerName: 'group_course',
              width: 200,
            },
            {
              field: 'group_course_main',
              headerName: 'group_course_main',
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
        mainID:'course_id',
        mainInfo:{
            field: 'name',
            headerName: 'Sản phẩm',
            width: 200,
        },
        detailEdit:[
          {
            field: 'group_course',
            headerName: 'group_course',
            width: 200,
          },
          {
            field: 'group_course_id',
            headerName: 'group_course_id',
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
      return ["group_course","group_course_id","title"];
    }
    getTitleToAdd(){
      return ["group_course","group_course_id","title"];
    }

    getHtmlAdd(){
      return  [TypeDialgueShow.EDIT_TEXT,TypeDialgueShow.SELECT_TABLE,TypeDialgueShow.EDIT_TEXT];
    }
    getTypeSelectToAdd(){
      return  [SelectHTml.NOT_CHECK_HTML,SelectHTml.NOT_CHECK_HTML,SelectHTml.NOT_CHECK_HTML];
    }
    getTypeSelectTabbleToAdd(){
      return  ["","group_course",""];
    }
    getColumeValidate(){
      return ["","",""];
    }
} 


