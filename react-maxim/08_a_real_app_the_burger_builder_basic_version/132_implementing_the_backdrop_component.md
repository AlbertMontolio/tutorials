# Creating the Order Summary Modal

let's create a modal component

components/UI/Modal/Modal.js
components/UI/Backdrop/Backdrop.js

Modal.js

```js
import React from 'react';
import classes from './Modal.css';

const modal = (props) => (
  <div className={classes.Modal}>
    {props.children}
  </div>
);

export default modal;
```

BurgerBuilder.js

```js
import Modal from '../../components/UI/Modal/Modal';
```

```js
return (
  <Aux>
    <Modal />
    <Burger ingredients={this.state.ingredients} />
    <BuildControls 
```

we don't add the logic for the Modal in BurgerBuilder, it's getting to crowdy

Burger/OrderSummary/OrderSummary.js

```js
import React from 'react';
import Aux from '../../../hoc/Aux';

const orderSummary = (props) => {
  const ingredientSummary = Object.keys(props.ingredients)
    .map(igKey => {
      return (<li><span style={{textTransform: 'capitalize'}}>{igKey}</span>: {props.ingredients[igKey]}</li>):
    });
  return (
    <Aux>
      <h3>Your Order</h3>
      <p>A delicious burger with the following ingredients: </p>
      <ul>
        {ingredientSummary}
      </ul>
      <p>Continue to checkout?</p>
    </Aux>
  );
};

export default orderSummary;
```

BurgerBuilder.js

```js
import OrderSummary from '../../components/Burger/OrderSummary/OrderSummary';
```

```js
return (
  <Aux>
    <Modal>
      <OrderSummary ingredients={this.state.ingredients} />
    </Modal>
```

we forgot the key in OrderSummary.js

```js
const ingredientSummary = Object.keys(props.ingredients)
    .map(igKey => {
      return (<li key={igKey}><span style={{textTransform: 'capitalize'}}>{igKey}</span>: {props.ingredients[igKey]}</li>);
    });
  return (
```














