import React, { Component } from "react";
import Message from './Messages';
import ManagerData from '../../../../actions/ManagerData';
import noAvatar from '../../../../assets/imgage/noavatar.png'
class MessageItem extends Component {


    onUserInputSubmit(message) {
        this.props.onUserInputSubmit(message);
      }

    render() {
    const listUser = ManagerData.list_user;
    let d = new Date(this.props.message.time * 1000);
    var date = d.getDate() + '/' + (d.getMonth() + 1) + '/' + d.getFullYear() + ' ' + d.getHours() + ':' + d.getMinutes();
    return(
        <div className='comment-item'>
              {
                  listUser.map(item => {

                    if(item.userid == this.props.message.content.author_id)
                      return (
                          !!item.avartar?
                          <img src={item.avartar} className='avatar-cmt-img' width={'40px'} height={'40px'} />
                          :<img src={noAvatar} className='avatar-cmt-img' width={'40px'} height={'40px'} />
                          
                          )
                  })
                }
              
           <Message message={this.props.message} date={date}  onUserInputSubmit = {this.onUserInputSubmit.bind(this)} />
      </div>
    )
    }
};

export default MessageItem;