#124 Connecting state to Build Controls

BurgerBuilder.js

```js
import React, {Component} from 'react';
import Aux from '../../hoc/Aux';
import Burger from '../../components/Burger/Burger';
import BuildControls from '../../components/Burger/BuildControls/BuildControls';

const INGREDIENT_PRICES = {
  salad: 0.5,
  cheese: 0.4,
  meat: 1.3,
  bacon: 0.7
}

class BurgerBuilder extends Component {

  state = {
    ingredients: {
      salad: 0,
      bacon: 0,
      cheese: 0,
      meat: 0
    },
    totalPrice: 4
  }

  addIngredientHandler = (type) => {
    const oldCount = this.state.ingredients[type];
    const updatedCount = oldCount + 1;
    const updatedIngredients = {
      ...this.state.ingredients
    }
    updatedIngredients[type] = updatedCount;
    const priceAddition = INGREDIENT_PRICES[type];
    const oldPrice = this.state.totalPrice;
    const newPrice = oldPrice + priceAddition;
    this.setState({totalPrice: newPrice, ingredients: updatedIngredients});
  }

  removeIngredientHandler = (type) => {

  }

  render() {
    return (
      <Aux>
        <Burger ingredients={this.state.ingredients} />
        <BuildControls />
      </Aux>
    );
  }
}

export default BurgerBuilder;
```


```js
return (
  <Aux>
    <Burger ingredients={this.state.ingredients} />
    <BuildControls ingredientAdded={this.addIngredientHandler} />
  </Aux>
);
```

BuildControls.js

```js
const buildControls = (props) => (
  <div className={classes.buildControls}>
    {controls.map(ctrl => (
      <BuildControl 
        key={ctrl.label} 
        label={ctrl.label}
        type={ctrl.type}
        added={props.ingredientAdded}
      />
    ))}
  </div>
);
```

or

```js
<BuildControl 
  key={ctrl.label} 
  label={ctrl.label}
  added={() => props.ingredientAdded(ctrl.type)}
/>
```

added property needs to be connect to the more btn

buildControl.js

```js
import React from 'react';
import classes from './BuildControl.css';

const buildControl = (props) => (
  <div className={classes.BuildControl}>
    <div className={classes.Label}>{props.label}</div>
    <button className={classes.Less}>Less</button>
    <button className={classes.More} onClick={props.added}>More</button>
  </div>
);

export default buildControl;
```









