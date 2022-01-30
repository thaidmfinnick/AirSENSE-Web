import React, { useEffect } from "react";
import {getInfoClientMqtt, getInfoArticle } from '../../api/httpBaseUtil'; 
import ManagerData from '../../actions/ManagerData.js'
import {initComment, initUserList, addMessageToConverSation} from '../../reducers/commentReducer'
import { useDispatch } from "react-redux";
import { getListUserChat } from "../../api/httpBaseUtil";
import ListComment from "../../compoment/comment/commentList";

var mqtt    = require('mqtt');
var options = {
	protocol: 'mqtts',
	// clientId uniquely identifies client
	// choose any string you wish
	clientId: 'b0908853' 	
};
var client =null;

const Comment = () => {

    
    const dispatch = useDispatch();


    if(client!=null){
        client.on('message', function (topic, message) {
            var note = message.toString();
            // Updates React state with message 
            console.log("topic",topic,note);
            dispatch(addMessageToConverSation(JSON.parse(note)));
    
        });
      }

    useEffect(() => {
        let isMounted = true; 
        ManagerData.getInfoUser();
        ManagerData.getListUserChat();
        getListUserChat().then(result=>{ dispatch(initUserList(result));  });

        getInfoClientMqtt().then(result=>{ 
            console.log("Connect mqtt ManagerData.result:", result);
            ManagerData.mqtt.isloaded = true;
            ManagerData.mqtt.port = result.data.port;
            ManagerData.mqtt.password = result.data.password;
            ManagerData.mqtt.username = result.data.username;
            ManagerData.mqtt.server = result.data.server;
            ManagerData.mqtt.topic_sub = '#',// '/chat/1';

            ManagerData.mqtt.config={
                port:ManagerData.mqtt.port,
                clientId : 'message_' + Math.random().toString(16).substr(2, 8),
                username : ManagerData.mqtt.username,
                useNewUrlParser: true,
                password: ManagerData.mqtt.password
            };
            console.log("Connect mqtt ManagerData.mqtt:", ManagerData.mqtt);
 
            client = mqtt.connect(ManagerData.mqtt.server, ManagerData.mqtt.config);
            console.log("Connect mqtt ManagerData.config: to start");
            client.subscribe(ManagerData.mqtt.topic_sub);

        });

        return () => { isMounted = false };
    }, 
    [dispatch]);

    return (
        <div className="user-data">
        <p>This is the comment</p>
        <ListComment />
        </div>
    );
}

export default Comment;