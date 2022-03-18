import React, { Component } from 'react';
import MessageItem from './MessageItem';

class MessageList extends Component {
  

  componentDidUpdate(_prevProps, _prevState) {
    this.scrollList.scrollTop = this.scrollList.scrollHeight;
  }


  onUserInputSubmit(message) {
    this.props.onUserInputSubmit(message);
  }


  render () {
    
    console.log(this.props.messages)
    return (
      <div className="sc-message-list margin-top" ref={el => this.scrollList = el}>
        {this.props.messages.map((message, i) => {
          const children = message.children;
          return(
            <div>
          <MessageItem 
          message={message} 
          onUserInputSubmit={this.props.onUserInputSubmit} 
          />
          <div className='reply-comment-block'>
          {children.map(item => {
              return (
                <MessageItem 
                message={item} 
                onUserInputSubmit={this.props.onUserInputSubmit} 
          />
              )
            })
          }
          </div>
          </div>

          );

  })}
  </div>);
}
}



export default MessageList;
