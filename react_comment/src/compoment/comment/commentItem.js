import React from "react";


const CommentItem = ({messages}) => {
    console.log(messages);

    return (
        <>
        {
            messages.map(item => (
                <div>
                <p>{item.timeSend}</p>
                <p>{item.content.author_id}</p>
                <p>{item.content.content}</p>
                </div>
            ))
        }
        </>
    )
};

export default CommentItem;