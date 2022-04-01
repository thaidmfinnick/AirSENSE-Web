import React, {
  useCallback,
  useMemo,
  useRef,
  useEffect,
  useState,
} from 'react';
import { EditorState, ContentState,RichUtils,Modifier  } from 'draft-js';
import Editor,{createEditorStateWithText} from '@draft-js-plugins/editor';
import createMentionPlugin, {defaultSuggestionsFilter,} from '@draft-js-plugins/mention';
import { useDispatch,useSelector } from 'react-redux';
import { convertToHTML, convertFromHTML } from 'draft-convert';
import createEmojiPlugin from '@draft-js-plugins/emoji';
import "draft-js/dist/Draft.css";
import "@draft-js-plugins/emoji/lib/plugin.css";
import { commentTagUser } from '../../../../reducers/commentReducer';
var listUserData = null;

// emotion
const emojiPlugin = createEmojiPlugin();
const { EmojiSelect } = emojiPlugin;


export default function UserInputEditor({summitData, infoReply}) {
  const ref = useRef(null);
  const [editorState, setEditorState] = useState(createEditorStateWithText(''));
  const [open, setOpen] = useState(false);
  const [onChange, setOnChange] = useState(true);
  const [suggestions, setSuggestions] = useState([]);
  const listUser = useSelector(state => state.commentReducer.list_user);

  const dispatch = useDispatch();
  // suggestion
const { MentionSuggestions, plugins } = useMemo(() => {
  const mentionPlugin = createMentionPlugin({
    entityMutability: 'IMMUTABLE',
   // theme: mentionsStyles,
    mentionPrefix: '@',
    supportWhitespace: true,
  });
  // eslint-disable-next-line no-shadow
  const { MentionSuggestions } = mentionPlugin;
  // eslint-disable-next-line no-shadow
  const plugins = mentionPlugin;
  return { plugins, MentionSuggestions };
}, []);

const allPlugins = [plugins, emojiPlugin];


  useEffect(() => {
      var infoValue = JSON.parse(JSON.stringify(listUser));
      listUserData = infoValue;
  },[listUser])

  const onOpenChange = useCallback((_open) => { setOpen(_open); }, []);
  const onSearchChange = useCallback(({ value }) => {
      setSuggestions(defaultSuggestionsFilter(value, listUserData));
  }, []);

  const checkKey=(e)=> {
      e = e || window.event;
      if (e.keyCode == '13') {
          // right arrow
          e.preventDefault(); //Prevent default browser behavior mentionsRef.current.toHtml()
          //convertToHTML(this.state.editorState.getCurrentContent()
          console.log("...listUser ",ref);
          console.log("...listUser ",editorState.getCurrentContent().getPlainText());
          // ref.current.editor.editor.innerHTML
          
          var stringValue = editorState.getCurrentContent().getPlainText();
          var stringHtml = convertToHTML(editorState.getCurrentContent());
          let id_reply_comment = 0;
          if(infoReply) {
            console.log('giang reply', infoReply)
            id_reply_comment = infoReply.comment_id;
          }
          if(stringValue.length > 0) {
              summitData({stringValue, id_reply_comment});
          }
          let contentState = editorState.getCurrentContent();
          // console.log("...listUser stringValue stringHtml",stringValue,stringHtml);
          setTimeout(() => {
            setEditorState(EditorState.createEmpty());
          }, 100);
      }
  }

  return (
    <div
      className={"editor"}
      onClick={() => { ref.current.focus();}}>
        {onChange?
      <Editor
        editorKey={'editor'}
        editorState={editorState}
        onChange={setEditorState}
        keyBindingFn={checkKey}
        plugins={allPlugins}
        ref={ref}
        placeholder={'Write a comment'}
      />
      :""}
      <MentionSuggestions
        open={open}
        onOpenChange={onOpenChange}
        suggestions={suggestions}
        onSearchChange={onSearchChange}
        onAddMention={(user) => {
          dispatch(commentTagUser(user));
        }}
      />
      <div className='emotion-icon'>
      <EmojiSelect />
      </div>
    </div>
  );
}
