#Implementing the Backdrop Component

Backdrop.js

```js
import React from 'react';

const backdrop = () => (
  props.show ? <div></div> : null
);

export default backdrop;
```

Backdrop.css

```js
.Backdrop {
  width: 100%;
  height: 100%;
  position: fixed;
  z-index: 100;
  left: 0px;
  top: 0px;
  background-color: rgba(0,0,0,0.5);
}
```

Backdrop.js

```js
import React from 'react';
import classes from './Backdrop.css';

const backdrop = () => (
  props.show ? <div className={classes.Backdrop}></div> : null
);

export default backdrop;
```

where do we add this backdrop?

u could put it in app.s or layout.js

but, we will put in modal

```js
import Aux from '../../../hoc/Aux';
import Backdrop from '../Backdrop/Backdrop';

const modal = (props) => (
  <Aux>
    <Backdrop show={} />
    <div 
      className={classes.Modal}
      style={{
        transform: props.show ? 'translateY(0)' : 'translateY(-100vh)',
        opacity: props.show ? '1' : '0'
      }}
    >
      {props.children}
    </div>
  </Aux>
);
```

let's make the backdrop clickable

add click listener inside the backdrop

```js
const backdrop = (props) => (
  props.show ? <div className={classes.Backdrop} onClick={props.clicked}></div> : null
);
```

Modal.js

```js
const modal = (props) => (
  <Aux>
    <Backdrop show={props.show} clicked={props.modalClosed} />
```

BurgerBuilder.js

```js
<Modal show={this.state.purchasing} modalClosed={}>
```

```js
  purchaseCancelHandler = () => {
    this.setState({purchasing: false});
  }
```


```js
<Modal show={this.state.purchasing} modalClosed={this.purchaseCancelHandler}>
```


