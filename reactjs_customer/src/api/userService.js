import axios from 'axios';
import { push } from 'connected-react-router';
import { fetch } from '../utils/httpUtil';
import store from '../store/configureStore';
import { API_URL, JWT_TOKEN } from '../config/config';
import Swal from 'sweetalert2';
import {
  setLocalStorage,
  clearLocalStorage,
  getLocalStorage,
} from '../utils/storageUtil';

import { request } from 'https';

export const getCurUser = () => {
  return fetch('auth/customer');
};

function checkErrorRetun(error){
  if(!!!error.response){
    Swal.fire('Kết nối mạng có vấn đề');
  }
  else
  {
    if((error.response.data.error =="No token provided")){
      clearLocalStorage(JWT_TOKEN);
      Swal.fire('Quá phiên đăng nhập').then((value) => {
        localStorage.removeItem('username');
        window.location.href = window.location.protocol +'////'+ window.location.host +'/admin/#/login';
      });
      return;
    }
    console.log("......... error.  ........",error);
    var dataAcess=" Lỗi chi tiết "+ error;
    if(!!error.response.data)
    {
      if((!!error.response.data.data)&&(!!error.response.data.data.message)){
        dataAcess += "\r\n ||" +error.response.data.data.message;
      }

      if((!!error.response.data.error)&&(!!error.response.data.error.sqlMessage)){
        dataAcess += "\r\n ||" +error.response.data.error.sqlMessage;
      }

    }
  
    Swal.fire( " Lỗi",dataAcess,"ok");
  }
}

export const sendMessageToAnothenMobile = (data) => {
  console.log("sendMessageToAnothenMobile.........");

  return new Promise((resolve, reject) => {
    axios
      .post(
        API_URL + 'customers/send_message',Object.assign(data),
        {
          headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json',
            'X-XSRF-TOKEN': getLocalStorage(JWT_TOKEN),
            authorization: 'Beard ' + getLocalStorage(JWT_TOKEN),
          },
        }
      )
      .then((response) => {
        resolve(response);
      })
      .catch((error) => {
        checkErrorRetun(error);
        reject(error);
      });
  });
}

export const uploadfileDataExel = (data) => {
  console.log("uploadfileDataExel.........");

  return new Promise((resolve, reject) => {
   /* var xhr = new XMLHttpRequest();
    xhr.onreadystatechange=()=>{
      if(xhr.readyState==4 && xhr.status==200){
        store.dispatch({ type: LOADING.HIDE });
        resolve(xhr.response);
      }
      else
      {
        reject(xhr.response);
      }

    }
    xhr.open("POST", API_URL + 'customers/import-data');
    xhr.setRequestHeader('Accept','application/json');
    xhr.setRequestHeader('Content-Type','application/json');
    xhr.setRequestHeader('Authorization', 'Beard ' + getLocalStorage(JWT_TOKEN));
    xhr.send(data);
  });*/

    axios
      .post(
        API_URL + 'customers/import-data',Object.assign(data),
        {
          headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json',
            'X-XSRF-TOKEN': getLocalStorage(JWT_TOKEN),
            authorization: 'Beard ' + getLocalStorage(JWT_TOKEN),
          },
        }
      )
      .then((response) => {
        resolve(response);
      })
      .catch((error) => {
        checkErrorRetun(error);
        reject(error);
      });
  });
};

export const uploadfileDataImage = (data) => {
  console.log("uploadfileDataExel.........");
  return new Promise((resolve, reject) => {
    axios
      .post(
        API_URL + 'customers/import-image',Object.assign(data),
        {
          headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json',
            'X-XSRF-TOKEN': getLocalStorage(JWT_TOKEN),
            authorization: 'Beard ' + getLocalStorage(JWT_TOKEN),
          },
        }
      )
      .then((response) => {
        resolve(response);
      })
      .catch((error) => {
        checkErrorRetun(error);
        reject(error);
      });
  });
};

