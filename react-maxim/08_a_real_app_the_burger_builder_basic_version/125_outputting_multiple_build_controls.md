#123 Outputting Multiple Build Controls

BuildControls.js

create a constant, not a state

```js
import React from 'react';
import classes from './BuildControls.css';
import BuildControl from './BuildControl/BuildControl';

const controls = [
  {label: 'Salad', type: 'salad'},
  {label: 'Bacon', type: 'bacon'},
  {label: 'Cheese', type: 'cheese'},
  {label: 'Meat', type: 'meat'},
]

const buildControls = (props) => (
  <div className={classes.buildControls}>
    {controls.map(ctrl => (
      <BuildControl key={ctrl.label} label={ctrl.label} />
    ))}
  </div>
);

export default buildControls;
```

BurgerBuilder.js

```js
render() {
  return (
    <Aux>
      <Burger ingredients={this.state.ingredients} />
      <BuildControls />
    </Aux>
  );
}
```








