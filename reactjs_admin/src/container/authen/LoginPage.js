// in src/LoginPage.js
import React, { useState } from 'react';
import { useLogin } from 'react-admin';
import { Register } from '../../api/httpBaseUtil';
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
          <div className="authen-center">
  <form>
    <div className="authen-text-field">
      <input type="text" placeholder="Tên đăng nhập" value={userName} onChange={e =>setUserName(e.target.value)} />

      <span />
      <label>Email hoặc Số điện thoại</label>
    </div>
    <div className="authen-text-field">
    <input type="password" placeholder="Mật khẩu" value={password} onChange={e => setPassword(e.target.value)} />

      <span />
      <label>Mật khẩu</label>
    </div>
    <div className="authen-pass"><a href="/api/auth/resetPassword">Quên mật khẩu?</a></div>
    <button className="authen-submit-button" type='submit' onClick={submit} >Login</button>
  </form>
  <div className="authen-pass"><a href="http://127.0.0.1:3000/api/auth/register">Đăng kí thành viên mới</a></div>
  <input className="authen-submit-button" defaultValue="Đăng nhập" onClick={submit} />
  <div className="authen-signup-link">
    <span>Hoặc đăng nhập với</span>
  </div>
  <div className="authen-signup">
    <input className="authen-submit2" defaultValue="FACEBOOK" />
    <input className="authen-submit2" defaultValue="GOOGLE+" />
  </div>
</div>

        ); 
};

export default LoginPage;