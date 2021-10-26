// in src/LoginPage.js
import React, { useState } from 'react';
import { useLogin } from 'react-admin';
import { Register } from '../../api/httpBaseUtil';
import decor from './img/DecorLogin.png';
import './authen.css';
const LoginPage = () => {
    const [userName, setUserName] = useState('');
    const [password, setPassword] = useState('');
    const login = useLogin();

    const submit = (e) => {
        e.preventDefault();
        // gather your data/credentials here
        const credentials = { 
          username: userName,
          password: password
        };
        // Dispatch the userLogin action (injected by connect)
        login(credentials);
    }

        return (
          <div class="login">
          <p class="login-adver">Đăng nhập cùng chúng tôi để có nhiều trải nghiệm hơn</p>
          <img src={decor} className='login-image-decor'/>
          <form class="login-form">
              <p class="login-note">Vietnamese</p>
              <h2 class="login-title">Đăng nhập</h2>
              <div class="login-with-google">
                  <p class="login-with-para">Đăng nhập với</p>
  
              </div>
              <div class="login-with-facebook">
                  <p class="login-with-para">Đăng nhập với</p>
                  
              </div>
              <input type="text" class="login-input-email" placeholder="Email hoặc số điện thoại" value={userName} onChange={(e) => setUserName(e.target.value)} />
              <input type="password" class="login-input-password" placeholder="Mật khẩu" value={password} onChange={e => setPassword(e.target.value)}/>
              <button class="login-button" onClick={submit}>Đăng nhập</button>
              <a href="http://127.0.0.1:3000/api/auth/resetPassword" class="link-forgot-pasword">Quên mật khẩu</a>
              <p class="link-to-register">Nếu bạn chưa có tài khoản, xin mời&nbsp;<a href="http://127.0.0.1:3000/api/auth/register" class="link-register">đăng kí</a></p>
  
          </form>
      </div>

        ); 
};

export default LoginPage;