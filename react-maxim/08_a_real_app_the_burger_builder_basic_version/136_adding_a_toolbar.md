#Implementing the Button Component

OrderSummary.js

```js
import Button from '../../UI/Button/Button';
```

```js
<Button btnType="Danger" clicked={}>CANCEL</Button>
<Button btnType="Success" clicked={}>CONTINUE</Button>
```

OrderSummary is used in BurgerBuilder.js

BurgerBuilder.js

```js
  purchaseContinueHandler = () => {
    alert('you continue!');
  }
```

```js
return (
  <Aux>
    <Modal show={this.state.purchasing} modalClosed={this.purchaseCancelHandler}>
      <OrderSummary 
        ingredients={this.state.ingredients}
        purchaseCancelled={this.purchaseCancelHandler}
        purchaseContinued={this.purchaseContinueHandler}
      />
```

let's implement these two properties in the order summary

OrderSummary.js

```js
      <Button btnType="Danger" clicked={props.purchaseCancelled}>CANCEL</Button>
      <Button btnType="Success" clicked={props.purchaseContinued}>CONTINUE</Button>
```



