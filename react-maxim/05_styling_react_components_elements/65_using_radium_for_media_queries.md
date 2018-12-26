# 65 Using radium for media queries

Person.js

```js
export default Radium(person);
```

```js
import React from 'react';
import Radium from 'radium';

import './Person.css';

const person = (props) => {

  const style = {
    "@media (min-width: 500px)": {
      width: '450px'
    }
  }

  return (
    <div className="Person" style={style}>
```

we have an error

```js
resolve-styles.js:244 Uncaught Error: To use plugins requiring `addCSS` (e.g. keyframes, media queries), please wrap your application in the StyleRoot component. Component name: `person`.
```

wrapping component with radium is enough for pseudo-selector, but not for media queries

in App.js, wrapp the whole application

```js
import Radium, {StyleRoot} from "radium";
```


and wrapp content of the return

```js
return (
  <StyleRoot>
    <div className="App">
      <h1>hi i am a react app</h1>
      <p className={classes.join(" ")}>This is workingg</p>
      <button 
        style={style}
        onClick={this.togglePersonsHandler}
      >
        Toggle persons
      </button>
      {persons}
    </div>
  </StyleRoot>
);
```










