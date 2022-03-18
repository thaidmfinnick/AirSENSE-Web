import * as React  from 'react';

import { Admin, Resource } from 'react-admin';
import jsonServerProvider from 'ra-data-json-server';

import authProvider from './api/authProvider';
import {HOST_HTTP}  from './config/config.js';
import LoginPage from './container/authen/LoginPage';
import commentReducer from './reducers/commentReducer';
import Comment from './container/comment/comment';
const App = () => {
    return (
    <div>
        <Admin
            dataProvider={jsonServerProvider(HOST_HTTP)}
            authProvider={authProvider}
            loginPage = {LoginPage}
            customReducers={{ commentReducer }}
            >
         <Resource name="comment" list={Comment} />

        </Admin>
        
        
    </div>
    );
    
    };
export default App;
