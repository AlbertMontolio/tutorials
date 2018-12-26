#Adding Reusable Navigation Items

outsource navigation items into its own component

Navigation/NavigationItems/NavigationItems.js

```js
import React from 'react';

const navigationItems = (props) => (
  <ul>
    <li><a href="/">A link</a></li>
  </ul>
);

export default navigationItems;
```

NavigationItems/NavigationItem/NavigationItem.js

```js
import React from 'react';

const navigationItem = (props) => (
  <li><a href="/">A link</a></li>
);

export default navigationItem;
```

NavigationItem.css

```js
.NavigationItems {
  margin: 0px;
  padding: 0px;
  list-style: none;
  display: flex;
  align-items: center;
  height: 100%;
}
```

NavigationItem.css

```js
.NavigationItem {
  margin: 0px;
  box-sizing: border-box;
  display: flex;
  height: 100%;
  align-items: center;
}

.NavigationItem a {
  color: white;
  text-decoration: none;
  height: 100%;
  padding: 16px 10px;
  border-bottom: 4px solid transparent;
  box-sizing: border-box;
  display: block;
}

.NavigationItem a:hover, .NavigationItem a:active, .NavigationItem a.active {
  background-color: #8F5c2c;
  border-bottom: 4px solid #40A4C8;
  color: white;
}

```

NavigationItems.js

```js
import React from 'react';
import classes from './NavigationItems.css';

const navigationItems = (props) => (
  <ul className={classes.navigationItems}>
    
  </ul>
);

export default navigationItems;
```

NavigationItem.js

```js
import React from 'react';
import classes from './navigationItem.css';

const navigationItem = (props) => (
  <li className={classes.NavigationItem}>
    <a href="/">A link</a>
  </li>
);

export default navigationItem;
```

NavigationItems.js

```js
import React from 'react';
import classes from './NavigationItems.css';
import NavigationItem from './NavigationItem/NavigationItem';

const navigationItems = (props) => (
  <ul className={classes.navigationItems}>
    <NavigationItem />
  </ul>
);

export default navigationItems;
```

NavigationItem.js

```js
import React from 'react';
import classes from './navigationItem.css';

const navigationItem = (props) => (
  <li className={classes.NavigationItem}>
    <a 
      href={props.link}
      className={props.active ? classes.active : null}
    >
      {props.children}
    </a>
  </li>
);

export default navigationItem;
```

NavigationItems.js

```js
const navigationItems = (props) => (
  <ul className={classes.navigationItems}>
    <NavigationItem link="/" active>Burger Builder</NavigationItem>
    <NavigationItem link="/">Checkout</NavigationItem>
  </ul>
);
```

Toolbar.js

```js
import NavigationItems from '../NavigationItems/NavigationItems';
```

```js
const toolbar = () => (
  <header className={classes.Toolbar}>
    <div>MENU</div>
    <Logo />
    <nav>
      <NavigationItems />
    </nav>
  </header>
);
```















