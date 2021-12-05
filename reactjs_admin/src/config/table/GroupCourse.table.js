import EditIcon from '@material-ui/icons/Edit';
import DeleteIcon from '@material-ui/icons/Delete';
import React from 'react';
import ManagerData from '../../actions/ManagerData.js'
import {ActionControl ,TypeDialgueShow,SelectHTml} from '../../utils/commonUtil';


class GroupCourse  {
    getColumeShow=(callback)=>{
        const columns = [
            {
              field: 'id',
              headerName: 'stt',
              width: 100,
            },
            {
              field: 'group_course',
              headerName: 'group_course',
              width: 200,
            },
            {
              field: 'title',
              headerName: 'title',
              width: 400,
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
        mainID:'group_course_id',
        mainInfo:{
          field: 'group_course',
          headerName: 'group_course',
          width: 400,
        },
        detailEdit:[
          {
            field: 'group_course',
            headerName: 'group_course',
            width: 200,
          },
          {
            field: 'title',
            headerName: 'title',
            width: 400,
          }
        ]
      }
    }

    getInfoToAdd(){
      return ["group_course","title"];
    }
    getTitleToAdd(){
      return ["group_course","title"];
    }

    getHtmlAdd(){
      return  [TypeDialgueShow.EDIT_TEXT,TypeDialgueShow.EDIT_TEXT];
    }
    getTypeSelectToAdd(){
      return  [SelectHTml.NOT_CHECK_HTML,SelectHTml.NOT_CHECK_HTML ];
    }
    getTypeSelectTabbleToAdd(){
      return  ["","" ];
    }
    getColumeValidate(){
      return ["",""];
    }
} 

export default  GroupCourse;
