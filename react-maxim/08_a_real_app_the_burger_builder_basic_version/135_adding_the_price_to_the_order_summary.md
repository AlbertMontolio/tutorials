#Adding a custom Button Component

we need btns in our orderSummary

OrderSummary.js

we could have the btns there, but since we'll reuse the style, let's make it in a component

UI/Button/Button.js

```js
import React from 'react';

const button = (props) => (
  <button onClicked={props.clicked}>{props.children}</button>
);

export default button;
```

Button.css

style

Button.js

```js
import React from 'react';
import classes from './Button.css'

const button = (props) => (
  <button
    className={[classes.Button, classes[props.btnType]].join(" ")}
    onClicked={props.clicked}
  >{props.children}</button>
);

export default button;
```



