#172 Sending a POST Request

BurgerBuilder.js

```js
  purchaseContinueHandler = () => {
    alert('you continue!');
  }
```

```js
import axios from '../../axios-orders';
```

```js
  purchaseContinueHandler = () => {
    // alert('you continue!');
    const order = {
      ingredients: this.state.ingredients,
      price: this.state.totalPrice,
      customer: {
        name: 'Max Schwarzmüller',
        address: {
          street: 'Test street 1',
          zipCode: '45246',
          country: 'Germany'
        },
        email: 'test@test.com'
      },
      deliveryMethod: 'fastest'
    }
    axios.post('/orders.json');
  }
```


```js
    axios.post('/orders.json', order)
      .then(response => console.log(response))
      .catch(error => console.log(error));
  }
```


