#227 Creating a Custom Dynamic Input Component

UI/Input/Input.css

```js
.Input {
  width: 100%;
  padding: 10px;
  box-sizing: border-box;
}

.Label {
  font-weight: bold;
  display: block;
  margin-bottom: 8px;
}

.InputElement {
  outline: none;
  border: 1px solid #ccc;
  background-color: white;
  font: inherit;
  padding: 6px 10px;
}

.InputElement:focus {
  outline: none;
  background-color: #ccc;
}
```

Input.js

```js
import React from 'react';
import classes from './Input.css';

const input = (props) => {
  let inputElement = null;

  switch (props.inputType) {
    case ('input'):
      inputElement = <input className={classes.InputElement} {...props} />;
      break;
    case ('textarea'):
      inputEelement = <textarea className={classes.InputElement} {...props} />
      break;
    default:
      inputElement = <input className={classes.InputElement} {...props} />
  }

  return (
    <div className={classes.Input}>
      <label className={classes.Label}>{props.label}</label>
      {inputElement}
    </div>
  );
};

export default input;
```

let's use the Input component

ContactData.js

```js
import Input from '../../../components/UI/Input/Input';
```

```js
let form = (
      <form>
        <Input inputType="input" type="text" name="name" placeholder="Your Name" />
        <Input inputType="input" type="email" name="email" placeholder="Your Email" />
        <Input inputType="input" type="text" name="street" placeholder="Street" />
        <Input inputType="input" type="text" name="postal" placeholder="Postal Code" />
        <Button btnType="Success" clicked={this.orderHandler}>ORDER</Button>
      </form>
    );
```

cuz of new react, we need lower case

```js
switch (props.inputtype) {
```

```js
<Input inputtype="input" type="text" name="name" placeholder="Your Name" />
```

