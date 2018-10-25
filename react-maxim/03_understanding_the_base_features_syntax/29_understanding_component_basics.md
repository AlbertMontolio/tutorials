# 29

index.js

```js
ReactDOM.render(<App />, document.getElementById('root'));

```

we could even put html instead of the app

```js
ReactDOM.render(<h1>TEST<h1/>, document.getElementById('root'));
```

We render one root component! just one!

the app component, you would nest all the components your application might need

App extends Component

which comes from the react library


```js
import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

class App extends Component {
  render() {
    return (
      <div className="App">
        <h1>hi i am a react app</h1>
      </div>
    );
  }
}

export default App;
```


this class has the render()

react calls this method.

every component needs to render some html

we can reach out to the internet, listen to events, calculations, but we need to render some html to the dom

then we export default App;

if you import this file, then you import the class App

App.js someetimes is App.jsx

actually we dont return html, we return jsx





























