#Removing ingredients safely

BurgerBuilder.js

```js
removeIngredientHandler = (type) => {
    const oldCount = this.state.ingredients[type];
    const updatedCount = oldCount - 1;
    const updatedIngredients = {
      ...this.state.ingredients
    }
    updatedIngredients[type] = updatedCount;
    const priceDeduction = INGREDIENT_PRICES[type];
    const oldPrice = this.state.totalPrice;
    const newPrice = oldPrice - priceDeduction;
    this.setState({totalPrice: newPrice, ingredients: updatedIngredients});
  }
```

```js
render() {
  return (
    <Aux>
      <Burger ingredients={this.state.ingredients} />
      <BuildControls 
        ingredientAdded={this.addIngredientHandler} 
        ingredientRemoved={this.removeIngredientHandler} 
      />
    </Aux>
  );
}
```

BuildControls.js

```js
const buildControls = (props) => (
  <div className={classes.buildControls}>
    {controls.map(ctrl => (
      <BuildControl 
        key={ctrl.label} 
        label={ctrl.label}
        added={() => props.ingredientAdded(ctrl.type)}
        removed={() => props.ingredientRemoved(ctrl.type)}
      />
    ))}
  </div>
);
```

BuildControl.js

```js
const buildControl = (props) => (
  <div className={classes.BuildControl}>
    <div className={classes.Label}>{props.label}</div>
    <button className={classes.Less} onClick={props.removed}>Less</button>
    <button className={classes.More} onClick={props.added}>More</button>
  </div>
);
```

```js
  removeIngredientHandler = (type) => {
    const oldCount = this.state.ingredients[type];

    if (oldCount <= 0) {
      return;
    }
```

BurgerBuilder.js

```js
render() {

  const disabledInfo = {
    ...this.state.ingredients
  }

  for (let key in disabledInfo) {
    disabledInfo[key] = disabledInfo[key] <= 0;
  }

  return (
    <Aux>
      <Burger ingredients={this.state.ingredients} />
      <BuildControls 
        ingredientAdded={this.addIngredientHandler} 
        ingredientRemoved={this.removeIngredientHandler} 
        disabled={disabledInfo}
      />
    </Aux>
  );
}
```

BuildControls.js

```js
const buildControls = (props) => (
  <div className={classes.buildControls}>
    {controls.map(ctrl => (
      <BuildControl 
        key={ctrl.label} 
        label={ctrl.label}
        added={() => props.ingredientAdded(ctrl.type)}
        removed={() => props.ingredientRemoved(ctrl.type)}
        disabled={props.disabled[ctrl.type]}
      />
    ))}
  </div>
```

BuildControl.js

```js
const buildControl = (props) => (
  <div className={classes.BuildControl}>
    <div className={classes.Label}>{props.label}</div>
    <button className={classes.Less} onClick={props.removed} disabled={props.disabled}>Less</button>
    <button className={classes.More} onClick={props.added}>More</button>
  </div>
);
```








