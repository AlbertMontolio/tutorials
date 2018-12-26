#Adding a toolbar

components/Navigation/Toolbar/Toolbar.js

```js
import React from 'react';

const toolbar = () => (
  <header>
    <div>MENU</div>
    <div>LOGO</div>
    <nav>
      <ul>
        ...
      </ul>
    </nav>
  </header>
);

export default toolbar;
```

Toolbar.css

```js
.Toolbar {
  height: 56px;
  width: 100%;
  position: fixed;
  top: 0px;
  left: 0px;
  background-color: #703B09;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0px 20px;
  box-sizing: border-box;
  z-index: 90;
}

.Toolbar nav {
  height: 100%;
}
```

Toolbar.js

```js
import classes from './Toolbar.css';

const toolbar = () => (
  <header className={classes.Toolbar}>
```

we put in the layout

Layout.js

```js
import Toolbar from '../Navigation/Toolbar/Toolbar';
```

the main element div is olverlapped with the toolbar

Layout.css

```js
.Content {
  margin-top: 72px;
  background-color: rgb(200,200,200);
}
```






