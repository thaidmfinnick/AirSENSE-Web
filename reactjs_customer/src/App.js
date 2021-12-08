import * as React from 'react';
import { Admin, Resource, ListGuesser ,Layout } from 'react-admin';
import jsonServerProvider from 'ra-data-json-server';

import './styles/style.css';
import Dashboard from './container/manager/Dashboard';
import AccountCircleIcon from '@material-ui/icons/AccountCircle';
import { Comment, Settings, Send, Contacts, FeaturedPlayList, KeyboardBackspace, TextFormat, Business, GroupWork } from '@material-ui/icons';


import MenuHeader from './container/head/menuHeader';
import MenuLeft from './container/menu/menuLeft';
import {HOST_HTTP}  from './config/config.js';
import LoginPage from './container/authen/LoginPage';
import authProvider from './api/authProvider';
import './styles/style.css';
const App = () => {

    return (
        <div>
        <Admin
            dataProvider={jsonServerProvider(HOST_HTTP)}
            authProvider={authProvider}
            loginPage = {LoginPage}
            layout={(props) => <Layout {...props} menu={MenuLeft} appBar={MenuHeader} />}>
        <Resource name="userstest" options={{label:'Dashboard' }}  list={Dashboard} />  
        <Resource name="ustest" options={{label:'Tài khoản' }} icon={AccountCircleIcon} list={ListGuesser} />   
        <Resource name="usersst" options={{label:'Khóa học đăng kí' }} icon={FeaturedPlayList} list={ListGuesser} />   
        <Resource name="usstest" options={{label:'Bài tập' }} list={ListGuesser} />   
        <Resource name="usst" options={{label:'Feedback khóa học' }} list={ListGuesser} />     


        </Admin>
        </div>
    );
    
    };
export default App;