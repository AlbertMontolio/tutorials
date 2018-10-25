# 28 understanding the folder structure

route leve:

package.json

the dependencies.

react-scripts, web development server, next gen js

scirpts

npm start, npm build, npm test, npm eject

we dont see our compile code, everything happens in memory

node_modules holds all the dependencies

public folder

gets served by the web server at the end

we have index.html

is the single page we have

the scripts files will be there injected

we dont write html code

```js
<div id="root"></div>
```
we mount the react app here

manifest.json gives us a progressive web app out of the box

src

we will work here

index.js gets access to the getelementbyid root

it renders our render App

App from '.App'

it imports,

App.js

here we see our first react component


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

App.css, some styling

these are global stylings

index.css, also applies style general

registerServiceWorker.js































