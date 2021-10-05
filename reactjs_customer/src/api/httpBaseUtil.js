import axios from 'axios';
import { useLogout  } from 'react-admin';
import React, { forwardRef } from 'react';
import { API_URL, JWT_TOKEN } from '../config/config';
import Swal from 'sweetalert2';
import {
  setLocalStorage,
  clearLocalStorage,
  getLocalStorage,
} from '../utils/storageUtil';

import {
  loginSuccess,
  loginFailure,
  logoutSuccess,
} from '../actions/authAction';




function checkErrorRetun(error){
  if(!!!error.response){
      Swal.fire('Kết nối mạng có vấn đề');
  }
  else
  {
      if (401 === error.response.status) {
        // redirect to login page
        clearLocalStorage(JWT_TOKEN);
          Swal.fire('Quá phiên đăng nhập').then((value) => {
            localStorage.removeItem('username');
            //localStorage.removeItem('username');
            window.location.href = window.location.protocol +'////'+ window.location.host +'/admin/#/login';
          });

          return;
      }
      if (404 === error.response.status) {
        // redirect to 404 page
      }
      if (500 === error.response.status) {
        // redirect to 500 page
      }
      if((error.response.data.error =="No token provided")){
          clearLocalStorage(JWT_TOKEN);
          Swal.fire('Quá phiên đăng nhập').then((value) => {
            localStorage.removeItem('username');
            window.location.href = window.location.protocol +'////'+ window.location.host +'/admin/#/login';
          });
          return;
      }
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


export const httpBase = () => {
  const api = axios.create({
    baseURL: `${API_URL}`,
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
      'X-XSRF-TOKEN': getLocalStorage(JWT_TOKEN),
      authorization: 'Beard ' + getLocalStorage(JWT_TOKEN),
    },
    responseType: 'json',
  });

  api.interceptors.response.use(
    (response) => {
      return response;
    },
    (error) => {
      checkErrorRetun(error);
      return Promise.reject(error);
    }
  );

  return api;
};


export const httpPostData = (url, data) => {
  Swal.fire({
      title: 'Xin vui lòng đợi '
  });
  Swal.showLoading();
  return new Promise((resolve, reject) => {
    axios
      .post(url,
        data,
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
        Swal.close();
        resolve(response);
      })
      .catch((error) => {
        checkErrorRetun(error);
        reject(error);
      });
  });
};

export const httpGetData = (url, data) => {
  Swal.fire({
      title: 'Xin vui lòng đợi '
  });
  Swal.showLoading();  
  return new Promise((resolve, reject) => {
    axios
      .get(url,
        data,
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
        Swal.close();
        resolve(response);
      })
      .catch((error) => {
        checkErrorRetun(error);
        reject(error);
      });
  });
};


export const login = ({ email, password }) => {
  return new Promise((resolve, reject) =>  {
    axios
      .post(API_URL + 'auth/login_customer', { email, password })
      .then((response) => {
        setLocalStorage(JWT_TOKEN, response.data.token);
        resolve(response);
      })
      .catch((error) => {
        checkErrorRetun(error);
        reject(error);
        //logout();
      });
  });
}

export const logout = () => {
  return (dispatch) => {
    clearLocalStorage(JWT_TOKEN);
    dispatch(logoutSuccess());
    dispatch(push('/tool/#/'));
    return false;
  };
}



export const getallInfoTable = (table,addInfo=null) => {
  var dataUpload= null;
  if(addInfo!=null) {
    addInfo["table"]=table;
    dataUpload=addInfo;
  }
  else  dataUpload={ table: table };
  return new Promise((resolve, reject) => {
      httpPostData(API_URL + 'customers/report',dataUpload)
      .then((response) => {
        resolve(response);
      })
      .catch((error) => {
          reject(error);
      });
  });
}

export const getNumberPageOnTable = (table,addInfo=null) => {
  var dataUpload= null;
  if(addInfo!=null) {
    addInfo["table"]=table;
    dataUpload=addInfo;
  }
  else  dataUpload={ table: table };
  return new Promise((resolve, reject) => {
    httpPostData(API_URL + 'customers/report-page',dataUpload)
      .then((response) => {
          var numberPage=0;
          var detailInfo={numberPage:0,detailFillter:null};
          if(!!response.data.result[0][0]["COUNT(*)"]){
            numberPage= response.data.result[0][0]["COUNT(*)"];
          }
          detailInfo.numberPage = Math.round(numberPage/1000);
          detailInfo.detailFillter=response.data.dataFind
          resolve(detailInfo);
      })
      .catch((error) => {
          reject(error);
      });
  });
}

export const addOneDataToTable = (table, data) => {
  return new Promise((resolve, reject) => {
    httpPostData(API_URL + 'customers/manager_add' ,Object.assign(data, { table: table }))
      .then((response) => {
        resolve(response);
      })
      .catch((error) => {
          reject(error);
      });
  });
}

export const deleteOneDataToTable = (table, data) => {
  return new Promise((resolve, reject) => {
    httpPostData(API_URL + 'customers/manager_delete' ,Object.assign(data, { table: table }))
      .then((response) => {
        resolve(response);
      })
      .catch((error) => {
          reject(error);
      });
  });
}

export const updateOneDataInfoTable = (table, data) => {
  return new Promise((resolve, reject) => {
    httpPostData(API_URL + 'customers/manager_update' ,Object.assign(data, { table: table }))
    .then((response) => {
      resolve(response);
    })
    .catch((error) => {
        reject(error);
    });
    
  });
}


export const updatePagesToFist = (data) => {
  return new Promise((resolve, reject) => {
    httpPostData(API_URL + 'customers/fist_pages' ,data)
    .then((response) => {
      resolve(response);
    })
    .catch((error) => {
        reject(error);
    });
    
  });
}

export const registerPageToWriter = ( data) => {
  return new Promise((resolve, reject) => {
    httpPostData(API_URL + 'document/registerPages' ,data)
    .then((response) => {
      resolve(response);
    })
    .catch((error) => {
        reject(error);
    });
  });
}

export const updatePageToWriter = ( data) => {
  return new Promise((resolve, reject) => {
    httpPostData(API_URL + 'document/updatePages' ,data)
    .then((response) => {
      resolve(response);
    })
    .catch((error) => {
        reject(error);
    });
  });
}


export const registerPageToAdvertisement = ( data) => {
  return new Promise((resolve, reject) => {
    httpPostData(API_URL + 'document/registerAdvertisement' ,data)
    .then((response) => {
      resolve(response);
    })
    .catch((error) => {
        reject(error);
    });
  });
}

export const updatePageToAdvertisement = ( data) => {
  return new Promise((resolve, reject) => {
    httpPostData(API_URL + 'document/updateAdvertisement' ,data)
    .then((response) => {
      resolve(response);
    })
    .catch((error) => {
        reject(error);
    });
  });
}

export const uploadfileDataImage = (data) => {
  Swal.fire({
      title: 'Xin vui lòng đợi '
  });
  Swal.showLoading();
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
        Swal.close();
        resolve(response);
      })
      .catch((error) => {
        checkErrorRetun(error);
        reject(error);
      });
  });
};



