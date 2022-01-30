
import { configureStore } from '@reduxjs/toolkit';
import chatBoxData from '../reducers/chat-box-acess';
import commentReducer from '../reducers/commentReducer';
export default configureStore({
  reducer: {
    todos: commentReducer,
  },
});

