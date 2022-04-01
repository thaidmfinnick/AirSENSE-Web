import React, {useEffect} from "react";
import { useSelector, useDispatch } from "react-redux";
import { loadConversation, initComment } from "../../reducers/commentReducer";
import { getHistoryRoutes, getInfoArticle, sendMessageChat } from "../../api/httpBaseUtil";
import Launcher from "../chat/boot/components/Launcher";
var child = React.createRef();
const ListComment = () => {
    const infoArticle = useSelector(state => state.commentReducer.infoArticle);
    const list_user = useSelector(state => state.commentReducer.listUser);
    const messageComment = useSelector(state => state.commentReducer.selectedConversation);
    const subDataComment = useSelector(state => state.commentReducer.sub_data_comment);
    const dispatch = useDispatch();
    console.log('giang mess', messageComment)

    useEffect(() => {
        getInfoArticle().then(result => dispatch(initComment(result.data)));
        if(infoArticle.length > 0) {
            console.log(infoArticle)
            getHistoryRoutes({chatRoom:"/comment/" + infoArticle}).then(result=>{
                dispatch(loadConversation(result.data.chatRoom));
            });
        }
    }, [dispatch, infoArticle])

    const onMessageWasSent = (data) => {
        const message = data.stringValue
        if(message.length > 0) {
            var infoChat={
                post_id:'1/1/1', // infoarticle
                content:message ,
                coment_tag:subDataComment.comment_tag ,
                comment_atack:subDataComment.link_img,
                id_comment_reply: data.id_reply_comment
            };
            console.log('giang console', infoChat)
            sendMessageChat(infoChat).then((info)=>{
            dispatch(addMessageToConverSation(info.data));
            child.current.clearTextData();
        }
        )
        .catch(err=>{
        });
        }
    }



    return (
        <>
        <div>
                <Launcher
                  ref={child}
                  onMessageWasSent={onMessageWasSent}
                  messageList={messageComment}
                  listUser = {list_user}
                />
            </div>
        </>
    )
};

export default ListComment;