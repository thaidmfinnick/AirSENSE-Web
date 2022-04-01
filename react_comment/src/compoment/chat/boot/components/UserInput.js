import React from 'react';
import UserInputEditor from './UserInputEditor';
import ManagerData from '../../../../actions/ManagerData';
import noAvatar from '../../../../assets/imgage/noavatar.png';
import ProfileImage from '../../../form/ProfileImage';
import { useSelector } from 'react-redux';
const UserInput = ({onSubmit, replyComment, infoReply}) =>  {
  const userCurrent = ManagerData.saveInfoUser;
  const subDataComment = useSelector(state => state.commentReducer.sub_data_comment);
  const linkImgUpload = subDataComment.link_img;
 


    return (
      <>      {replyComment?<form className={`sc-user-input `}>
      <div className='avatar-cmt'>
        {
        !!userCurrent.avartar?
        <img src={userCurrent.avartar} className='avatar-cmt-img' width={'40px'} height={'40px'} />
        :<img src={noAvatar} className='avatar-cmt-img' width={'40px'} height={'40px'} />
    }
      </div>
      <UserInputEditor 
        className='input-cmt'
            infoReply={infoReply}
            summitData={(text)=>{onSubmit(text)}} />
      <div className="sc-user-input--buttons">
        <ProfileImage />
      </div>
      <div className={!!linkImgUpload?'upload-img-comment':'no-display'}>
              <img src={linkImgUpload} className='picture-upload' width="200px" height="300px" />
          </div>
    </form>
      :<form className={`sc-user-input `}>
      <div className='avatar-cmt'>
        {
        !!userCurrent.avartar?
        <img src={userCurrent.avartar} className='avatar-cmt-img' width={'50px'} height={'50px'} />
        :<img src={noAvatar} className='avatar-cmt-img' width={'50px'} height={'50px'} />
    }
      </div>
      <UserInputEditor 
        className='input-cmt'
            summitData={(text)=>{onSubmit(text)}} />
      <div className="sc-user-input--buttons">
        <ProfileImage />
      </div>
      <div className={!!linkImgUpload && replyComment == false?'upload-img-comment':'no-display'}>
              <img src={linkImgUpload} className='picture-upload' width="200px" height="300px" />
          </div>
    </form>}
      </>
    );
  
};


export default UserInput;
