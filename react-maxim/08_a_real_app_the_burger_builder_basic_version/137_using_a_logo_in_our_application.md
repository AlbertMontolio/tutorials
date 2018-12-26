#Adding the price to the order summary

OrderSummary.js

```js
</ul>
<p><strong>Total Price: {props.price}</strong></p>
<p>Continue to checkout?</p>
```

BurgerBuilder.js

```js
<OrderSummary 
  price={this.state.totalPrice.toFixed(2)}
```


