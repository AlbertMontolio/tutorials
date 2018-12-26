#Creating a responsive sidedrawer

Navigation/SideDrawer/SideDrawer.js

```js
import React from 'react';
import Logo from '../../Logo/Logo';
import NavigationItems from '../NavigationItems/NavigationItems';

const sideDrawer = (props) => {
  // ...

  return (
    <div>
      <Logo />
      <nav>
        <NavigationItems />
      </nav>
    </div>
  );
};

export default sideDrawer;
```

SideDrawer.css

```js
.SideDrawer {
  position: fixed;
  width: 280px;
  max-width: 70%;
  height: 100%;
  left: 0px;
  top: 0px;
  z-index: 200;
  background-color: white;
  padding: 32px 16px;
  box-sizing: boder-box;
  transition: transform 0.3s ease-out;
}

@media (min-width: 500px) {
  .SideDrawer {
    display: none;
  }
}

.Open {
  transform: translateX(0);
}

.Close {
  transform: translateX(-100%);
}
```

SideDrawer.js

```js
import classes from './SideDrawer.css';

const sideDrawer = (props) => {
  // ...

  return (
    <div className={classes.SideDrawer}>
```

Where do we use this SideDrawer component?

we have our Layout! our Toolbar!

Layout.js

```js
import SideDrawer from '../Navigation/SideDrawer/SideDrawer';

const layout = (props) => (
  <Aux>
    <Toolbar />
    <SideDrawer />
```





