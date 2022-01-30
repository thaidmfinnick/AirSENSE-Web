import PropTypes from 'prop-types';
import React, { Component } from 'react';
import MessageList from './MessageList';
import UserInput from './UserInput';
import Header from './Header';
import ManagerData from '../../../../actions/ManagerData';
class ChatWindow extends Component {
  constructor(props) {
    super(props);
    this.child = React.createRef();
  }

  clearTextData(){
    this.child.current.clearTextData();
  }

  onUserInputSubmit(message) {
    this.props.onUserInputSubmit(message);
  }

  onFilesSelected(filesList) {
    this.props.onFilesSelected(filesList);
  }

  render() {
    const userCurrent = ManagerData.saveInfoUser
    let messageList = this.props.messageList || [];
    let classList = [
      'sc-chat-window',
      (this.props.isOpen ? 'opened' : 'closed')
    ];
    return (
      <div className={classList.join(' ')}>
        <Header
          teamName={this.props.agentProfile.teamName}
          imageUrl={this.props.agentProfile.imageUrl}
          onClose={this.props.onClose}
        />
        <div>
          <p>{userCurrent.name}</p>
          <img src={userCurrent.avartar} width={'50px'} height={'50px'} />
        </div>
        <UserInput  ref={this.child}
          onSubmit={this.onUserInputSubmit.bind(this)}
          onFilesSelected={this.onFilesSelected.bind(this)}
          showEmoji={this.props.showEmoji}
        />
        <MessageList
          messages={messageList}
          replyMessage ={this.props.replyMessage}
          imageUrl={this.props.agentProfile.imageUrl}
          listUser = {this.props.listUser}
        />
      </div>
    );
  }
}

ChatWindow.propTypes = {
  agentProfile: PropTypes.object.isRequired,
  isOpen: PropTypes.bool.isRequired,
  onClose: PropTypes.func.isRequired,
  replyMessage: PropTypes.func.isRequired,
  onFilesSelected: PropTypes.func,
  onUserInputSubmit: PropTypes.func.isRequired,
  showEmoji: PropTypes.bool
};

export default ChatWindow;
