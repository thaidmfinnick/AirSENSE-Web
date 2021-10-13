import EditIcon from '@material-ui/icons/Edit';
import DeleteIcon from '@material-ui/icons/Delete';
import React from 'react';
import ManagerData from '../../actions/ManagerData.js'
import {ActionControl ,TypeDialgueShow,SelectHTml} from '../../utils/commonUtil';


class GroupService  {
    getColumeShow=(callback)=>{
        const columns = [
            {
              field: 'id',
              headerName: 'stt',
              width: 140,
            },
            {
              field: 'title',
              headerName: 'title',
              width: 200,
            },
            {
              field: 'content',
              headerName: 'content',
              width: 400,
            },
            {
                field: 'image',
                headerName: 'image',
                width: 300,
            },
            {
                field: 'page_service_id',
                headerName: 'page_service_id',
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
        mainID:'service_group_id',
        mainInfo:{
          field: 'title',
          headerName: 'title',
          width: 400,
        },
        detailEdit:[
          {
            field: 'title',
            headerName: 'title',
            width: 200,
          },
          {
            field: 'content',
            headerName: 'content',
            width: 400,
          },
          {
            field: 'image',
            headerName: 'image',
            width: 300,
            },
          {
            field: 'page_service_id',
            headerName: 'page_service_id',
            width: 240,
          },
        ]
      }
    }

    getInfoToAdd(){
      return ["title","content","image","page_service_id"];
    }
    getTitleToAdd(){
      return ["title","content","image","page_service_id"];
    }

    getHtmlAdd(){
      return  [TypeDialgueShow.EDIT_TEXT,TypeDialgueShow.EDIT_TEXT,TypeDialgueShow.EDIT_TEXT,TypeDialgueShow.EDIT_TEXT];
    }
    getTypeSelectToAdd(){
      return  [SelectHTml.NOT_CHECK_HTML,SelectHTml.NOT_CHECK_HTML,SelectHTml.NOT_CHECK_HTML,SelectHTml.NOT_CHECK_HTML ];
    }
    getTypeSelectTabbleToAdd(){
      return  ["","","","" ];
    }
    getColumeValidate(){
      return ["","","",""];
    }
} 

export default  GroupService;
