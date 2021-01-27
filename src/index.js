// Import the React and ReactDOM libraries
import React from 'react';
import ReactDOM from 'react-dom';

import CommentDetail from './CommentDetail';
import ApprovalCard from './ApprovalCard';

if (module.hot) {
    module.hot.accept();
}

// Create a React component
const App = () => {
    return (
        <div className="ui container comments">
            <ApprovalCard>
                <CommentDetail
                    author="Boris"
                    time="Today at 4.45PM"
                    post="I am loving React!"
                    image='https://source.unsplash.com/random'
                />
            </ApprovalCard>
            <ApprovalCard>
                <CommentDetail
                    author="Michael"
                    time="Today at 5.45PM"
                    post="I am also loving React!"
                    image='https://source.unsplash.com/random'
                />
            </ApprovalCard>
            <ApprovalCard>
                <CommentDetail
                    author="Matt"
                    time="Today at 6.45PM"
                    post="I am loving React more!"
                    image='https://source.unsplash.com/random'
                />
            </ApprovalCard>
        </div>
    )
}

// Take the React component and show it on the screen
ReactDOM.render(<App />, document.querySelector('#root'));