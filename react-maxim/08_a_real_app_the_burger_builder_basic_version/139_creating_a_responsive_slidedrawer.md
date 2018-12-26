#Using a Logo in our Application

components/Logo/Logo.js

assets/images/

components/Logo/Logo.js

```js
import React from 'react';

const logo = () => (
  <div>
    <img src="../../assets/images/burger-logo.png"/>
  </div>
);

export default logo;
```

this does not work. assets folder is not known by webpack.

we need to make webpack aware. we do that when importing the logo

```js
import burgerLogo from '../../assets/images/burger-logo.png';
```

burgerLogo receives the path of the image

```js
import React from 'react';
import burgerLogo from '../../assets/images/burger-logo.png';

const logo = () => (
  <div>
    <img src={burgerLogo} />
  </div>
);

export default logo;
```

Logo.css

```js
.Logo {
  background-color: white;
  padding: 8px;
  height: 100%;
}

.Logo img {
  height: 100%;
}
```

Logo.js

```js
import React from 'react';
import burgerLogo from '../../assets/images/burger-logo.png';
import classes from './Logo.css';

const logo = () => (
  <div className={classes.Logo}>
    <img src={burgerLogo} alt="myBurger"/>
  </div>
);

export default logo;
```

Toolbar.js

```js
import React from 'react';
import classes from './Toolbar.css';
import Logo from '../../Logo/Logo';

const toolbar = () => (
  <header className={classes.Toolbar}>
    <div>MENU</div>
    <Logo />
    <nav>
```


Logo.css

```js
.Logo {
  background-color: white;
  padding: 8px;
  height: 80%;
  box-sizing: border-box;
  border-radius: 5px;
}

.Logo img {
  height: 100%;
}
```




