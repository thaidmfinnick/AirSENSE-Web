import axios from 'axios';
import { resolve } from 'path/posix';
import {API_URL, JWT_TOKEN} from '../config/config.js';
import { checkErrorRetun } from '../utils/commonUtil.js';
import { setLocalStorage } from '../utils/storageUtil.js';
import { login } from './httpBaseUtil.js';

export default {
    // called when the user attempts to log in
    login: ({ username ,password }) => {
        axios
        .post(API_URL + 'auth/loginCustomer', {username, password})
        .then((response) => {
            setLocalStorage(JWT_TOKEN, response.data.token);
            resolve(response);

        })
        .catch((error) => {
            checkErrorRetun(error);
            reject(error);
        })
    },
    // called when the user clicks on the logout button
    logout: () => {
        localStorage.removeItem('username');
        return Promise.resolve();
    },
    // called when the API returns an error
    checkError: ({ status }) => {
        if (status === 401 || status === 403) {
            localStorage.removeItem('username');
            return Promise.reject();
        }
        return Promise.resolve();
    },
    // called when the user navigates to a new location, to check for authentication
    checkAuth: () => {
        var username =localStorage.getItem('username');
        if(username!=null){
            return Promise.resolve(username)
        }
        else
        {
            return Promise.reject();
        }
    },
    // called when the user navigates to a new location, to check for permissions / roles
    getPermissions: () => Promise.resolve(),
};
