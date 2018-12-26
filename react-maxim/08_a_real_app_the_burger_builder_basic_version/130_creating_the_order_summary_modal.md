# Displaying and updating the burger price

BuildControls.js

```js
const buildControls = (props) => (
  
  <div className={classes.BuildControls}>
    <p>Current price: <strong>{props.price.toFixed(2)}</strong></p>
```

BurgerBuilder.js

```js
return (
  <Aux>
    <Burger ingredients={this.state.ingredients} />
    <BuildControls 
      ingredientAdded={this.addIngredientHandler} 
      ingredientRemoved={this.removeIngredientHandler} 
      disabled={disabledInfo}
      price={this.state.totalPrice}
    />
  </Aux>
);
```


