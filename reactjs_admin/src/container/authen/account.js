import React, { Component } from 'react';
import ManagerData from '../../actions/ManagerData.js'


const InfoAccount = () => {
    const user = ManagerData.saveInfoUser;
    console.log(user);

    return (
        <div className='user-data'>
        <div className="info">  
  <h2>Thông tin cá nhân</h2>
  <div className="center">
    <form>
      <label>Tên người dùng</label>
      <input type="text" placeholder value={user.name} />
      <label>Họ và tên</label>
      <input type="text" placeholder value={user.fullname} />
      <label>Email</label>
      <input type="text" placeholder value={user.email} />
      <label>Số điện thoại</label>
      <input type="text" placeholder value={user.phone} />
      <label>Địa chỉ</label>
      <input type="text" placeholder />
      <label>Liên hệ</label>
      <input type="text" placeholder value={user.contact}/>
      <label>Vai trò</label>
      <input type="text" placeholder />
    </form>
    <div className="change-info">
      <button className="submit2">Hủy</button>
      <button className="submit2">Lưu thay đổi</button>
    </div>
  </div>
  <div className="img">
    <div className="user-img" />
    <p>Chọn ảnh đại diện khác</p>
    <a href="#">Chọn file</a>
  </div>
</div>

        </div>
    )
}
export default InfoAccount;