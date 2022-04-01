import React, { useState } from 'react';
import TextMessage from './TextMessage';
import ManagerData from '../../../../../actions/ManagerData.js'
import UserInput from '../UserInput.js'
import RemoveIcon from '@material-ui/icons/Remove';
import { replyComment } from '../../../../../reducers/commentReducer';
import { useDispatch } from 'react-redux';
const Message = ({message, date, onUserInputSubmit}) => {
  const dispatch = useDispatch();
  const listUser = ManagerData.list_user;
  const [showReplyBox, setShowReplyBox] = useState(false);
  const _replyMessage = (item) => {
    console.log('reply message', item);
    setShowReplyBox(true);
    dispatch(replyComment(item));
  }
  const _openImageInCommentItem = (url) => {
    let w = window.open('about:blank');
    let image = new Image();
    image.src = url;
    w.document.write(image.outerHTML);
  }

  const abc = (text) => {
    onUserInputSubmit(text);
  }


  return (
    <div>
    <div className="sc-message comment-item-message">
        {
                  listUser.map(item => {
                    if(item.userid == message.content.author_id)
                      return (
                        <div>
                      <p className='comment-item-name'>{item.name}</p>
                      </div>
                      )
                  })
                }
        <TextMessage props={message} />

      </div>
      {!!message.content.comment_atack?<img src={message.content.comment_atack} className='img-comment-item' onClick={()=>_openImageInCommentItem(message.content.comment_atack)} />:''}
      <p className='ultis-comment'> <span className='reply-button-cmt'>Thích</span> <span className='reply-button-cmt' onClick={()=>_replyMessage(message)}>Trả lời</span> <span className='display-date-comment'>{date}</span></p>
      {showReplyBox?<div className='reply-comment-box'>
      <RemoveIcon className='icon-remove-reply-box' onClick={()=>setShowReplyBox(false)} />
      <div className='reply-input'>
      <UserInput
          onSubmit={(text)=>abc(text)}
          replyComment={true}
          infoReply = {message}
        />
        </div>
        </div>:''}
      </div>
      );
  
};

export default Message;













// class Message1 extends Component {

//   _renderMessageOfType(type='text') {
//     switch(type) {
//     case 'text':
//       return <TextMessage {...this.props.message} />;
//     case 'emoji':
//       return <EmojiMessage {...this.props.message} />;
//     case 'file':
//       return <FileMessage {...this.props.message} />;
//     default:
//       console.error(`Attempting to load message with unsupported file type '${type}'`);
//     }
//   }

  // render () {
    // const listUser = ManagerData.list_user;
    // const message = this.props.message;
    // let contentClassList = [
    //   'sc-message--content',
    //   (this.props.message.content.author_id === ManagerData.saveInfoUser.users_id ? 'sent' : 'received')
    // ];
//     return (
//       <div className="sc-message comment-item-message">
//         {
//                   listUser.map(item => {
//                     if(item.userid == message.content.author_id)
//                       return (
//                         <div>
//                       <p className='comment-item-name'>{item.name}</p>
//                       </div>
//                       )
//                   })
//                 }
//         <div className={contentClassList.join(' ')}  onClick={this.props.onClick}>
//           {this._renderMessageOfType()}
//         </div>
//       </div>);
//   }
// }
// Message.propTypes = {
//   onClick: PropTypes.func.isRequired
// };

