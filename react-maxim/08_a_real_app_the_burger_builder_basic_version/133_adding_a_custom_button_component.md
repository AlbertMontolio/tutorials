#Showing & Hiding the Modal (with Animation)

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
    purchasable: false,
    purchasing: false
  }
```

BuildControls.js

```js
<button 
  className={classes.OrderButton}
  disabled={!props.purchasable}
  onClick={props.ordered}
>
  ORDER NOW
</button>
```

BurgerBuilder.js

```js
<BuildControls 
  ingredientAdded={this.addIngredientHandler} 
  ingredientRemoved={this.removeIngredientHandler} 
  disabled={disabledInfo}
  price={this.state.totalPrice}
  purchasable={this.state.purchasable}
  ordered={this.purchaseHandler}
/>
```

tiny animation on the modal

```js
<Modal>
  <OrderSummary ingredients={this.state.ingredients} />
</Modal>
```

we can't not get rid of it and put it back, we need to change a css property in order to animate it

```js
return (
  <Aux>
    <Modal show={this.state.purchasing}>
      <OrderSummary ingredients={this.state.ingredients} />
    </Modal>
```

Modal.js

```js
const modal = (props) => (
  <div 
    className={classes.Modal}
    style={{
      transform: props.show ? 'translateY(0)' : 'translateY(-100vh)',
      opacity: props.show ? '1' : '0'
    }}
  >
    {props.children}
  </div>
);
```

BurgerBuilder.js

```js
  purchaseHandler () {
    this.setState({purchasing: true})
  }
```

this is undefined

cuz of the syntax

if the method is triggered by an event

arrow functions contain the state or the context of this

```js
  purchaseHandler = () => {
    this.setState({purchasing: true})
  }
```





