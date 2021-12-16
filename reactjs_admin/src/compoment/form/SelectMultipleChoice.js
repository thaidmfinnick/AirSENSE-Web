import React, { useState } from 'react';
import PropTypes from 'prop-types';
import {
  FormControl,
  Button,
  InputLabel,
  MenuItem,
  Select,
  Input,
  Checkbox,
  TextField,
} from '@material-ui/core';
import ManagerData from '../../actions/ManagerData.js';
import AddCircleOutlineIcon from '@material-ui/icons/AddCircleOutline';
import RemoveCircleOutlineIcon from '@material-ui/icons/RemoveCircleOutline';

var infoQuestion =[{id:0,info:"Trả lời viết"},{id:1,info:"Trắc nghiệm"}];
var TextIndex =['A','B','C','D','E','F','G','H'];

function convertHTML(lstQuestion,mode,responseText){
    if(mode==1){
        var html=`<div id="check_question_id"><ul class="selct_resspose" seclectCange="myfunction()">`;
        var response=[];
        lstQuestion.foreach((item,index)=>{
            html =html+`<li>`+item.id+'. '+item.info+`</li>`;
            if(item.isTrue) response.push(indexQuestion[index]);
        })
        html =html+`</ul> </div>`;
        return {mode:1,html:html,response:response.tostring()};
    }
    return {mode:0,html:"",response:responseText};
}




const SelectMultipleChoice = ({ detailValue,onchange}) => {
    // const [ handleClose] = useState()
    const [selectQuestion, setSelectQuestion] = useState(0);
    const [lstQuestion, setLstQuestion] = useState([]);
    const [responseQuestion, setResponseQuestion] = useState("");


    const onChangeQuestion = (content) => {
        setSelectQuestion(content);
        onchange(convertHTML(lstQuestion,selectQuestion,responseQuestion));
    }
    const editInfoQuestion = (index,name,value) => {
        var prevContent = lstQuestion;
        prevContent[index][name] =value;
        setLstQuestion(prevContent);
        onchange(convertHTML(lstQuestion,selectQuestion,responseQuestion));
    }
    const removeInfoQuestion = (id) => {
        onchange(convertHTML(lstQuestion,selectQuestion,responseQuestion));
    }
    const addInfoQuestion = () => {
        setLstQuestion(lstQuestion.concat({id:TextIndex[lstQuestion.length],info:"thêm câu hỏi",isTrue:false})); 
        console.log("lstQuestion",lstQuestion);
        onchange(convertHTML(lstQuestion,selectQuestion,responseQuestion));
    }

    return (
        <div className={'dp-i'}>
            <FormControl variant="outlined" className={'dp-i__type-answer'}>
                <InputLabel
                    className={'register-label'}
                    shrink
                    id="demo-simple-select-menu"
                    >
                Loại câu trả lời:
                </InputLabel>
                <Select
                    className={'margin-right-register'}
                    labelId="demo-simple-select-menu"
                    id="status"
                    value={selectQuestion}
                    onChange={(event) => {
                        onChangeQuestion(event.target.value);
                    }}
                    >
                    {infoQuestion.map((vars) => (
                        <MenuItem value={vars.id} key={vars.id}>
                        {vars.info}
                        </MenuItem>
                    ))}
                </Select>
            </FormControl>
            <br/>
            {selectQuestion==0? <Input name="name_image_detail" value={responseQuestion}
                                    onChange={(e)=>setResponseQuestion(e.target.value)} />:""}
            {selectQuestion==1?
                <div className={'messages-dm-message'}>
                    {(!!lstQuestion&&lstQuestion.length>0)?lstQuestion.map((item, index) => (
                        <div className={'title-dm-message'}>
                            <div onClick={() => {removeInfoQuestion(index)}}>
                                    <RemoveCircleOutlineIcon />
                                    {item.id}
                                    <Input name="name_image_detail" value={item.info}
                                        onChange={(e)=>editInfoQuestion(index,"info",e.target.value)} />
                                    Chọn câu trả lời 
                                    <Checkbox value={item.isTrue}
                                            onChange={(e)=>editInfoQuestion(index,"isTrue",e.target.value)}/>
                            </div>
                           
                        </div>
                    )):""}
                    <div onClick={addInfoQuestion}>
                        <AddCircleOutlineIcon />
                    </div>
                </div>
                :""
            }
        </div>
    );
};

export default SelectMultipleChoice;
