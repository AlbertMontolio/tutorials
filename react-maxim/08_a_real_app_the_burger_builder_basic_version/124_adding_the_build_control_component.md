#124 Adding the build control component

Burger/BuildControls/BuildControls.js

```js
import React from 'react';
const buildControls = (props) => (
  <div>
    
  </div>
);

export default buildControls;
```

BuildControls.css

```js
.BuildControls {
  width: 100%;
  background-color: #CF8F2E;
  display: flex;
  flex-flow: column;
  align-items: center;
  box-shadow: 0 2px 1px #ccc;
  margin: auto;
  padding: 10px 0px;
}
```

BuildControls/BuildControl/BuildControl.js

```js
import React from 'react';

const buildControl = (props) => (
  <div>
    <div>{props.label}</div>
    <button>Less</button>
    <button>More</button>
  </div>
);

export default buildControl;
```

BuildControl.js

```js
import React from 'react';
import classes from '.BuildControl.css';

const buildControl = (props) => (
  <div className={classes.BuildControl}>
    <div className={classes.Label}>{props.label}</div>
    <button className={classes.Less}>Less</button>
    <button className={classes.More}>More</button>
  </div>
);

export default buildControl;
```














