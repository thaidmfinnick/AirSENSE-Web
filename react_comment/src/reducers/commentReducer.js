import { createSlice } from "@reduxjs/toolkit";
import ChatMessage from '../utils/ChatMessage';
import ManagerData from '../actions/ManagerData.js'
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
            console.log('truong giang', state.list_user);

        },
        addMessageToConverSation: (state, action) => {
            var infoData= newInfo.insertChatboxDataChat(state.selectedConversation,action.payload,state.list_user);
                console.log("addMessageToConverSation   ...........   ",infoData);
              state.selectedConversation =infoData;
        },
    }
});

export const {initComment, loadConversation, initUserList, addMessageToConverSation} = commentReducer.actions;
export default commentReducer.reducer;
