import * as React from 'react';
import { Admin, Resource, ListGuesser ,Layout } from 'react-admin';
import jsonServerProvider from 'ra-data-json-server';

import './styles/style.css';
import Dashboard from './container/manager/Dashboard';
import AccountCircleIcon from '@material-ui/icons/AccountCircle';
import { Comment, Settings, Send, Contacts, FeaturedPlayList, KeyboardBackspace, TextFormat, Business, GroupWork } from '@material-ui/icons';
import LockScreen  from './container/manager/LockScreen.js';
import NomalTable  from './container/manager/NomalTable.js';
import LogoutPage  from './container/authen/LogoutPage.js';
import InfoAccount from './container/authen/account';
import TreeMenu from '@bb-tech/ra-treemenu';
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
            layout={(props) => <Layout {...props} menu={TreeMenu} appBar={MenuHeader} />}>
        <Resource name="userstest" options={{label:'Dashboard' }}  list={Dashboard} />  
        <Resource name="ustest" options={{label:'Tài khoản' }} icon={AccountCircleIcon} list={InfoAccount} />   
        <Resource name="usersst" options={{label:'Khóa học đăng kí' }} icon={FeaturedPlayList} list={ListGuesser} />   
        <Resource name="usstest" options={{label:'Bài tập' }} list={ListGuesser} />   
        <Resource name="usst" options={{label:'Feedback khóa học' }} list={ListGuesser} />     
        {/* Station for customer */}
        <Resource name="service_x" options={{label:'Trạm' ,"isMenuParent": true }}   list={LockScreen} />
        <Resource name="sparc_access_location_sensor" options={{label:'Đăng kí trạm', "menuParent": "service_x" }} list={NomalTable} />
        <Resource name="sparc_access_location_sensor" options={{label:'Các trạm đã đăng kí', "menuParent": "service_x" }} list={NomalTable} />
        <Resource name="logout" options={{label:'Đăng xuất'  }} icon={KeyboardBackspace} list={LogoutPage} />

        </Admin>
        </div>
    );
    
    };
export default App;