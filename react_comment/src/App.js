import * as React  from 'react';
import { Settings, Send, Contacts, FeaturedPlayList, KeyboardBackspace, TextFormat, Business, GroupWork } from '@material-ui/icons';

import { Admin, Resource, ListGuesser ,Layout } from 'react-admin';
import jsonServerProvider from 'ra-data-json-server';

//import './styles/index.js';
import Dashboard from './container/manager/Dashboard';
import authProvider from './api/authProvider';
import {HOST_HTTP}  from './config/config.js';
import TreeMenu from '@bb-tech/ra-treemenu';
import { connect } from 'react-redux';
import { Provider } from 'react-redux';
import { applyMiddleware, combineReducers, compose, createStore } from 'redux';
import messageInfo  from './reducers/index';
import MenuHeader from './container/head/menuHeader';
import LoginPage from './container/authen/LoginPage';
import AddProduct from './container/manager/AddProduct.js';
import AddService from './container/manager/AddService.js';
import store from './store/index.jsx';
import chatBoxData from './reducers/chat-box-acess';
import commentReducer from './reducers/commentReducer';
import Comment from './container/comment/comment';
const App = () => {
    return (
    <div>
        <Admin
            dataProvider={jsonServerProvider(HOST_HTTP)}
            authProvider={authProvider}
            loginPage = {LoginPage}
            customReducers={{ chatBoxData, commentReducer }}
            layout={(props) => <Layout {...props} menu={TreeMenu}  appBar={MenuHeader}  />}
            >
         <Resource name="comment" icon={TextFormat} list={Comment} />

            {/* <FooterChat /> */}
        </Admin>
        
    </div>
    );
    
    };
export default App;
