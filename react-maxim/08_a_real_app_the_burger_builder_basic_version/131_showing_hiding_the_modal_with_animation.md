# Adding the Order Button

let's do a modal

let's do a checkout btn under the body of the buildControls

BuildControls.js

```js
  <div className={classes.BuildControls}>
    <p>Current price: <strong>{props.price.toFixed(2)}</strong></p>
    {controls.map(ctrl => (
      <BuildControl 
        key={ctrl.label} 
        label={ctrl.label}
        added={() => props.ingredientAdded(ctrl.type)}
        removed={() => props.ingredientRemoved(ctrl.type)}
        disabled={props.disabled[ctrl.type]}
      />
    ))}
    <button>ORDER NOW</button>
  </div>
```

BuildControls.css

```js
 <button className={classes.OrderButton}>ORDER NOW</button>
```

BurgerBuilder.js

```js  
state = {
  ingredients: {
    salad: 0,
    bacon: 0,
    cheese: 0,
    meat: 0
  },
  totalPrice: 4,
  purchaseable: false
}
```

```js
  updatePurchaseState () {
    const ingredients = {
      ...this.state.ingredients
    }
    const sum = Object.keys(ingredients)
      .map(igKey => {
        return ingredients[igKey];
      })
      .reduce((sum, el) => {
        return sum + el;
      }, 0);
    this.setState({purchasable: sum > 0});
  }
```

```js
<BuildControls 
  ingredientAdded={this.addIngredientHandler} 
  ingredientRemoved={this.removeIngredientHandler} 
  disabled={disabledInfo}
  price={this.state.totalPrice}
  purchasable={this.state.purchasable}
/>
```

BuildControls.js

```js
<button 
  className={classes.OrderButton}
  disabled={!props.purchasable}
>ORDER NOW</button>
```

BurgerBuilder.js

we need to call the method

```js
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
    this.updatePurchaseState();
  }
```

we get the old array, we need the new ingredients, with the new one or wo the removed one

```js
this.updatePurchaseState(updatedIngredients);
```

```js
  updatePurchaseState (ingredients) {
    const sum = Object.keys(ingredients)
```


