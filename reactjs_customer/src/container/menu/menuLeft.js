//  src/Menu.js
import * as React from 'react';
import { createElement } from 'react';
import { useSelector } from 'react-redux';
import { useMediaQuery } from '@material-ui/core';
import { DashboardMenuItem, Menu, MenuItemLink, getResources } from 'react-admin';
import DefaultIcon from '@material-ui/icons/ViewList';
import LabelIcon from '@material-ui/icons/Label';

const MenuLeft = (props) => {
    console.log("Hello guys")
    const resources = useSelector(getResources);
    const open = useSelector(state => state.admin.ui.sidebarOpen);
    return (
        <Menu {...props} className='cus-menu-left'>
            <ul className='ul-left-nav'>
                <div className='cus-info-user'>
                    <div className='cus-picture-block'>
<img src='https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg' className='cus-profile-picture' alt='cus-profile-picture' />
</div>
<p className='cus-name'>Phung Ba Truong Giang</p>
                </div>
            {resources.map(resource => (
                <li className='li-left-nav'>
                <MenuItemLink
                    key={resource.name}
                    to={`/${resource.name}`}
                    primaryText={
                        (resource.options && resource.options.label) ||
                        resource.name
                    }
                    leftIcon={
                        resource.icon ? <resource.icon /> : <DefaultIcon />
                    }
                    onClick={props.onMenuClick}
                    sidebarIsOpen={open}
                />
                </li>
            ))}
            </ul>
            {/* add your custom menus here */}
        </Menu>
    );
                }
export default MenuLeft;