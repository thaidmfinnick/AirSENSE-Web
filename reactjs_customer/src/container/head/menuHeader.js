import * as React from 'react';
import { AppBar ,UserMenu ,MenuItemLink } from 'react-admin';
import Typography from '@material-ui/core/Typography';
import { makeStyles } from '@material-ui/core/styles';
import { Layout } from 'react-admin';
import AccountCircle from '@material-ui/icons/AccountCircle';
import SettingsIcon from "@material-ui/icons/Settings";
import Avatar from '@material-ui/core/Avatar';
import ManagerData from '../../actions/ManagerData';
import Header from '../../compoment/header/header.js'
import PathDirect from '../../compoment/PathDirect/pathDirect.js'

const UserMenuData = (props) => {
    const [linkAvartar, setLinkAvartar] = React.useState("");
    const [nameUser, setNameUser] = React.useState("");
    const checkUser=()=>{
        if(!!ManagerData.saveInfoUser.username){
                setLinkAvartar(ManagerData.saveInfoUser.avatar);
                setNameUser(ManagerData.saveInfoUser.username);
        }
    };
    setTimeout(()=>{checkUser() },5000);
    return (
        <>
      <UserMenu  label={nameUser}  {...props}
        icon={
            <Avatar
                src={linkAvartar}
            />
        }
      >
      </UserMenu>
      </>
    );
};
  

const MenuHeader = props => {
    
    // useEffect(() => {
    //     ManagerData.getInfoUser();
    //     }, [])
    
    // const dataPath = [
    //     { title: 'Trang chủ', link: '/' },
    //     { title: 'Tài khoản', link: '/account' }
    //   ];
    return (
        <>
            <Header />
{/* 
        <AppBar {...props} className='header-customer'  userMenu={<UserMenuData />} >

            <PathDirect data={dataPath} />
            <span className={'menu-header-spacer'} />
        </AppBar> */}
        </>
    );
};


export default MenuHeader;