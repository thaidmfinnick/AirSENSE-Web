import { createSlice } from "@reduxjs/toolkit";
import ChatMessage from '../utils/ChatMessage';

var newInfo = new ChatMessage();


export const commentReducer = createSlice({
    name: 'commentReducer',
    initialState: {
        content_group: null,
        content_page: null,
        content_sub: null,
        data: [],
        infoArticle: '',
        selectedConversation: [],
        list_user: [],
        sub_data_comment: {},
    },
    reducers: {
        initComment: (state, action) => {
            console.log('init comment', state, action);
            console.log(state.list_user)
            state.content_group = action.payload.data.content_group;
            state.content_sub = action.payload.data.content_sub;
            state.content_page = action.payload.data.content_page;
            state.infoArticle = action.payload.data.content_group+'/'+action.payload.data.content_sub+'/'+action.payload.data.content_page
        },
        loadConversation: (state, action) => {
            console.log("loadConversation   ...........   ",state.infoArticle);
            console.log('list user .......', state.list_user)
            state.selectedConversation = newInfo.informChatboxDataChat(action.payload,state.list_user);// action.payload;
          console.log(state.selectedConversation);


        },
        initUserList: (state,action) => {
            state.list_user =action.payload ;   

        },
        addMessageToConverSation: (state, action) => {
            var infoData= newInfo.insertChatboxDataChat(state.selectedConversation,action.payload,state.list_user, state.all_comment);
            console.log("addMessageToConverSation   ...........   ",infoData);
            state.selectedConversation =infoData;
            state.sub_data_comment = {};
        },
        commentTagUser: (state, action) => {
            console.log(action.payload.userid)
            state.sub_data_comment.comment_tag = action.payload.userid;

        },
        uploadImgComment: (state, action) => {
            console.log(action.payload)
            state.sub_data_comment.link_img = action.payload;
        },
        replyComment: (state, action) => {
            console.log(action.payload)
            state.sub_data_comment.reply_id = action.payload.content.comment_id;
        },
    }
});

export const {initComment, loadConversation, initUserList, addMessageToConverSation, commentTagUser, uploadImgComment, replyComment} = commentReducer.actions;
export default commentReducer.reducer;
