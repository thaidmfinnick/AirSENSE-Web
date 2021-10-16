import React, { Component } from 'react';
import ManagerData from '../../actions/ManagerData.js'


const InfoAccount = () => {
    const user = ManagerData.saveInfoUser;

    return (
        <div className='new-user-data'>
        <div className="account-info">  
      <h2 className='account-info-title'>Thông tin cá nhân</h2>
    <form className='account-info-user'>
      <div className='account-form-divide'>
      <div className='account-form-item-half'>
      <label className='account-label'>Tên người dùng</label>
      <input className='account-field' type="text" placeholder value={user.name} />
      </div>
      <div className='account-form-item-half'>
      <label className='account-label'>Họ và tên</label>
      <input className='account-field' type="text" placeholder value={user.fullname} />
      </div>
      <div className='account-form-item-half'>
      <label className='account-label'>Email</label>
      <input className='account-field' type="text" placeholder value={user.email} />
      </div>
      <div className='account-form-item-half'>
      <label className='account-label'>Số điện thoại</label>
      <input className='account-field' type="text" placeholder value={user.phone} />
      </div>
      </div>
      <label className='account-label'>Địa chỉ</label>
      <input className='account-field' type="text" placeholder value={user.contact}/>
      <label className='account-label'>Vai trò</label>
      <input className='account-field' type="text" placeholder />
      
      <div className="account-image">
    <img className='account-img' src='https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg' />
    <a href="#">Chọn ảnh đại diện khác</a>
  </div>


    </form>

    <div className="account-button">
      <button type='submit' className="account-button-item">Lưu thay đổi</button>
    </div>
    <a href="#">Thay đổi mật khẩu</a>

  </div>
        </div>
    )
}
export default InfoAccount;