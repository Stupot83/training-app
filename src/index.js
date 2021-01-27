// Import the React and ReactDOM libraries
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';

if (module.hot) {
    module.hot.accept();
}

ReactDOM.render(<App />, document.querySelector('#root'));