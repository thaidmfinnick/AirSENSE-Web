import React, {useEffect} from "react";
import { useSelector, useDispatch } from "react-redux";
import { loadConversation, initComment } from "../../reducers/commentReducer";
import { getHistoryRoutes, getInfoArticle, sendMessageChat } from "../../api/httpBaseUtil";
import Launcher from "../chat/boot/components/Launcher";
import CommentItem from "./commentItem";
var child = React.createRef();
const ListComment = () => {
    const infoArticle = useSelector(state => state.commentReducer.infoArticle);
    const list_user = useSelector(state => state.commentReducer.listUser);
    const messageComment = useSelector(state => state.commentReducer.selectedConversation);
    const dispatch = useDispatch();
    console.log(messageComment)

    useEffect(() => {
        getInfoArticle().then(result => dispatch(initComment(result.data)));
        if(infoArticle.length > 0) {
            console.log(infoArticle)
            getHistoryRoutes({chatRoom:"/comment/" + infoArticle}).then(result=>{
                console.log('abc comment', result);
                dispatch(loadConversation(result.data.chatRoom));
            });
        }
    }, [dispatch, infoArticle])

    const onMessageWasSent = (message) => {
        console.log('message........', message);
        if(message.length > 0) {
            var infoChat={
                post_id:'1/1/1', // infoarticle
                content:message ,
                coment_tag:"" ,
                comment_atack:"",
                comment_parent_id:1634669318436225 
            };
        sendMessageChat(infoChat).then((info)=>{
            //dispatch(actionsMesage.sendMessage(info));
            dispatch(addMessageToConverSation(info.data));
            child.current.clearTextData();
        })
        .catch(err=>{
        });
        }
    }

    const replyMessage=(message)=> {
        console.log("replyMessage .....",message);
      }


    return (
        <>
        <div>
                <Launcher
                  ref={child}
                  agentProfile={{
                    teamName: '' ,
                    imageUrl: ""
                  }}
                  replyMessage ={replyMessage}
                  onMessageWasSent={onMessageWasSent}
                  messageList={messageComment}
                  showEmoji
                  listUser = {list_user}
                />
            </div>
        </>
    )
};

export default ListComment;