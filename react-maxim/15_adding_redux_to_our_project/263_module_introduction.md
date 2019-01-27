#263 module introduction

we have all the stats in containers

BurgerBuilder.js

```js
class BurgerBuilder extends Component {

  state = {
    ingredients: null,
    totalPrice: 4,
    purchasable: false,
    purchasing: false,
    loading: false,
    error: false
  }
```

purchasing, to show or hide our modal

loading is used to display a spinner

purchasing, loading and error are kind of local purchase state

we could manage this with redux, but not necessary

ingredients & totalPrice, in redux for sure

purchasable, we pass it to buildcontrol, to enable button or not.

this is also ui state

Checkout.js

```js

class Checkout extends Component {

  state = {
    ingredients: null,
    price: 0
  }
```

we also have ingredients & price. here we are passing the ingredients through query params

not good, would be awesome to do the same with redux

ContactData.js

just ui state, we get some props, maybe w will get them from redux

Orders.js

```js
class Orders extends Component {
  state = {
    orders: [],
    loading: true
  }
```

orders come from firebase


