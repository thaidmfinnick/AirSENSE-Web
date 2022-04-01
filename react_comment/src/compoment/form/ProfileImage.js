
import React, { useState } from 'react';
import {
    FormControl,
    Button,
    InputLabel,
    MenuItem,
    Select,
    TextField
  } from '@material-ui/core';
import PublishIcon from '@material-ui/icons/Publish';
import { uploadfileDataImage } from '../../api/httpBaseUtil.js';
import Swal from 'sweetalert2';
import {HOST_HTTP}  from '../../config/config.js';
import ImageIcon from '@material-ui/icons/Image';
import { uploadImgComment } from '../../reducers/commentReducer.js';
import { useDispatch } from 'react-redux';
const ProfileImage = () => {
        const [state, setState] = useState({link:''});
        const dispatch = useDispatch();
        const uploadImageData=(event)=>{
            console.log("Content: " + event);
            event.preventDefault();
            const data = new FormData() 
            data.append('file', event.target.files[0]);  
            console.log(data);  
            uploadfileDataImage(data).then((response)=>{
                var value = response.data.url;
                console.log("uploadfileDataImage.....................",response,response.data.path,value);
                Swal.fire("Cập nhật thông tin thành công");
                setState({ link:value});
                dispatch(uploadImgComment(value));
            });
        }

        return (
            <div className='upload-imgage-block'>
            <Button variant="outlined" component="label" disableElevation style={{width:20,height: 20}}>
                <ImageIcon />
                <input type="file" 
                        name="fileUpload1"
                        id="fileUpload1"
                        accept=".png,.jpg,.jpeg"
                        onChange={(event)=> {uploadImageData(event)}}
                        hidden />
            </Button>
            </div>
        );
}

export default ProfileImage;

