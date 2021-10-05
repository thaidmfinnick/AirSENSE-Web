import * as React from 'react';
import PostIcon from '@material-ui/icons/Book';
import UserIcon from '@material-ui/icons/Group';
import { Admin, Resource, ListGuesser ,Layout } from 'react-admin';
import jsonServerProvider from 'ra-data-json-server';

import { PostList, PostEdit, PostCreate, PostShow } from './posts';
import UserList  from './container/manager/users.js';
import PagesContent  from './container/manager/PagesContent.js';
import RegisterPage  from './container/manager/RegisterPage.js';
import AdvertisementPage  from './container/manager/AdvertisementPage.js';
import LockScreen  from './container/manager/LockScreen.js';
import NomalTable  from './container/manager/NomalTable.js';
import LogoutPage  from './container/authen/LogoutPage.js';
import ChatBoxInternal  from './container/message/ChatBoxInternal.js';
import Dashboard from './container/manager/Dashboard';
import authProvider from './api/authProvider';
import {HOST_HTTP}  from './config/config.js';
import TreeMenu from '@bb-tech/ra-treemenu';

const App = () => (
    <Admin
        dataProvider={jsonServerProvider(HOST_HTTP)}
        authProvider={authProvider}
        dashboard={Dashboard}
        layout={(props) => <Layout {...props} menu={TreeMenu} />}
    >

        <Resource name="users" options={{label:'Tài khoản'  }} icon={UserIcon} list={UserList} />
        {/*  Mqtt*/}
        <Resource name="mqtt" options={{label:'Quản lý mqtt' ,"isMenuParent": true }} list={LockScreen} />
        <Resource name="mqtt_microservice" options={{label:'Tạo microservice',"menuParent": "mqtt"}} list={NomalTable} />
        <Resource name="mqtt_user" options={{label:'mqtt khách hàng',"menuParent": "mqtt"}} list={NomalTable} />
        {/* bài báo*/}
        <Resource name="sPages" options={{label:'Nhóm bài báo' ,"isMenuParent": true }}  list={LockScreen} />
        <Resource name="group_content_sub" options={{label:'Nhóm bài báo' ,"menuParent": "sPages"}} list={NomalTable} />
        <Resource name="managerpages" options={{label:'Quản lý bài báo',"menuParent": "sPages" }} list={PagesContent} />
        <Resource name="registerPage" options={{label:'viết bài',"menuParent": "sPages" }} list={RegisterPage} />
        {/* Quảng bá*/}
        <Resource name="advertisementDetail" options={{label:'Quảng bá' ,"isMenuParent": true }}  list={LockScreen} />
        <Resource name="advertisement_content" options={{label:'Danh sách',"menuParent": "advertisementDetail" }}  list={NomalTable} />
        <Resource name="advertisementPages" options={{label:'Quảng cáo',"menuParent": "advertisementDetail" }} list={AdvertisementPage} />
        {/* Dịch vụ*/}
        <Resource name="service_x" options={{label:'Dịch vụ' ,"isMenuParent": true }}  list={LockScreen} />
        <Resource name="service" options={{label:'Danh sách dịch vụ',"menuParent": "service_x" }}  list={NomalTable} />
        <Resource name="bill_service" options={{label:'Hóa đơn',"menuParent": "service_x" }}  list={NomalTable} />
        <Resource name="charging_service" options={{label:'Nạp tiền',"menuParent": "service_x" }}  list={NomalTable} />
        <Resource name="return_service" options={{label:'Trả lại dịch vụ',"menuParent": "service_x" }}  list={NomalTable} />
         {/* Sản phẩm*/}
        <Resource name="products" options={{label:'Sản phẩm' ,"isMenuParent": true }}  list={LockScreen} />
        <Resource name="backproduct" options={{label:'Trả lại hàng',"menuParent": "products" }}  list={NomalTable} />
        <Resource name="buyproduct" options={{label:'Mua hàng',"menuParent": "products" }}  list={NomalTable} />
        <Resource name="buyproductdetail" options={{label:'Hóa đơn',"menuParent": "products" }}  list={NomalTable} />
        <Resource name="lostproduct" options={{label:'Thất lạc',"menuParent": "products" }}  list={NomalTable} />
        <Resource name="product" options={{label:'Chi tiết sản phẩm',"menuParent": "products" }}  list={NomalTable} />
        <Resource name="storeproduct" options={{label:'Kho',"menuParent": "products" }}  list={NomalTable}  />
        {/* Khách hàng */}
        <Resource name="customers" options={{label:'Khách hàng' ,"isMenuParent": true }}  list={LockScreen} />
        <Resource name="company" options={{label:'Công ty',"menuParent": "customers" }}  list={NomalTable} />
        <Resource name="customer" options={{label:'Khách hàng',"menuParent": "customers" }}  list={NomalTable} />
        <Resource name="detailbank" options={{label:'Ngân hàng',"menuParent": "customers" }}  list={NomalTable} />
        <Resource name="enterprise" options={{label:'Doanh nghiệp',"menuParent": "customers" }}  list={NomalTable} />

        <Resource name="comments" options={{label:'comments'  }} list={ListGuesser} />
        <Resource name="chatbox" options={{label:'Nhắn tin'}} list={ChatBoxInternal} />
        <Resource name="logout" options={{label:'Đăng xuất'  }} list={LogoutPage} />
    </Admin>
);
export default App;
