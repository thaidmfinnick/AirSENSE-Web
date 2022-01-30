import React, { Component } from 'react';
import Message from './Messages';
import PropTypes from 'prop-types';
import ManagerData from '../../../../actions/ManagerData';
class MessageList extends Component {


  componentDidUpdate(_prevProps, _prevState) {
    this.scrollList.scrollTop = this.scrollList.scrollHeight;
  }


  render () {
    const listUser = ManagerData.list_user
    return (
      <div className="sc-message-list" ref={el => this.scrollList = el}>
        {this.props.messages.map((message, i) => {
          let d = new Date(message.time * 1000);
          var date = d.getDate() + '/' + (d.getMonth() + 1) + '/' + d.getFullYear() + ' ' + d.getHours() + ':' + d.getMinutes();
          return(
            <div>
              {
                  listUser.map(item => {
                    if(item.userid == message.content.author_id)
                      return (
                        <div>
                          <img src={item.avartar} width={'50px'} height={'50px'} />
                      <p>{item.name}</p>
                      </div>
                      )
                  })
                }
              
           <Message message={message} key={i}  onClick ={()=> {
            console.log("Message message={message} key={i} ");
            if(!!this.props.replyMessage)
                this.props.replyMessage(message);
          }
          } />
          <p>{date}</p>
          </div>
          );
        })}
      </div>);
  }
}

MessageList.propTypes = {
  replyMessage: PropTypes.func.isRequired
};

export default MessageList;
