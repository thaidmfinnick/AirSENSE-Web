/*if (!global._babelPolyfill) {
	require('babel-polyfill');
}*/

import { getallInfoTable,getNumberPageOnTable,
  addOneDataToTable,deleteOneDataToTable,updateOneDataInfoTable }
 from '../api/httpBaseUtil';
 import {ActionControl} from '../utils/commonUtil';


let ManagerData={
    lstData:{},
    callBackFunc:null,
    saveInfoUser:{},
    dialogueNomalSave:{},
    dialogueCustomizationSave:{},
    checkTableInfoUpdate(table,data){
        if(!!!ManagerData.lstData[table]) ManagerData.lstData[table] ={data:[], page:0,numberPage:0 ,dataToFindMain:{}};
        ManagerData.lstData[table].data  = data;   
    },
    getTable(table){
      if(!!!ManagerData.lstData[table]) ManagerData.lstData[table] ={data:[], page:0,numberPage:0 ,dataToFindMain:{}};
      return ManagerData.lstData[table].data;
    },
    setNumberPagesData(table,data){
      if(!!!ManagerData.lstData[table]) ManagerData.lstData[table] ={data:[], page:0,numberPage:0 ,dataToFindMain:{}};
      ManagerData.lstData[table]['numberPage'] = data;
    },
    setFindMainData(table,data){
      if(!!!ManagerData.lstData[table]) ManagerData.lstData[table] ={data:[], page:0,numberPage:0 ,dataToFindMain:{}};
      ManagerData.lstData[table]['dataToFindMain'] = data;
    },
    checkDataExistting(table){
      return !!ManagerData.lstData[table];
    },
    getLstDataPromise(tableName,fillter=null) {
      return new Promise((resolve, reject) => {
        getallInfoTable(tableName,fillter)
        .then((result) => {
          let data = result.data;
          for (var i = 0; i < data.result.length; i++) data.result[i].id = i;
          ManagerData.checkTableInfoUpdate(tableName,data.result);
          resolve(data.result);
        })
        .catch((error) => {reject(error)});
      });
    },
    getNumberDataTableDetail(table,addInfo=null){
        return new Promise((resolve, reject) => {
          getNumberPageOnTable(table,addInfo)
                .then((result) => {
                    var dataFillter={};
                    for(var i=0;i<result.detailFillter.length;i++){
                    let dataExame =result.detailFillter[i];
                    dataFillter[dataExame]=null;
                    }
                    ManagerData.numberPagesMain=result.numberPage;
                    ManagerData.dataToFindMain=dataFillter;
                    ManagerData.setFindMainData(table,dataFillter);
                    ManagerData.setNumberPagesData(table,result.numberPage);
                    resolve(result.numberPage);
                })
                .catch((error) => { reject(error);});
        });
    },
    initdialogueNomal(table,inputToSheetX){
      ManagerData.dialogueNomalSave={
        titleDialogue:"",
        action:ActionControl.NO_ACTION,
        format:{ inputToSheet:inputToSheetX,dataTitleDetail:null},
        dataInput:{},
        tableToManager:table
      };
    },
    actionChangeInfoDataDialogueNomal(name,actionSelect){
      ManagerData.dialogueNomalSave.titleDialogue=name;
      ManagerData.dialogueNomalSave.action= actionSelect;
      if(actionSelect==ActionControl.ACTION_ADD){
        ManagerData.dialogueNomalSave.dataInput = {};
        for (var k in ManagerData.dialogueNomalSave.format.inputToSheet) 
          ManagerData.dialogueNomalSave.dataInput[ManagerData.dialogueNomalSave.format.inputToSheet[k]] = null;
      }
    },
    initdialogueCustomization(table){
      ManagerData.dialogueCustomizationSave={
        titleDialogue:"",
        action:ActionControl.NO_ACTION,
        dataInput:{},
        tableToManager:table
      };
    },
    actionChangeInfoDataDialogueCustomization(name,actionSelect){
      ManagerData.dialogueCustomizationSave.titleDialogue=name;
      ManagerData.dialogueCustomizationSave.action= actionSelect;
      if(actionSelect==ActionControl.ACTION_ADD){
        ManagerData.dialogueNomalSave.dataInput = {};
      }
    },

    selectActionManager(action){
      if(ManagerData.callBackFunc!=null) ManagerData.callBackFunc(action);
    }

}

export default ManagerData;