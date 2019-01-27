#216 Passing Ingredients via Query Params

BurgerBuilder.js

instead of 

```js
  purchaseContinueHandler = () => {
    this.props.history.push('/checkout');
```

we do

```js
purchaseContinueHandler = () => {
    this.props.history.push({
      pathname: '/checkout',
      search: ''
    });
```

```js
  purchaseContinueHandler = () => {

    const queryParams = [];
    for (let i in this.state.ingredients) {
      queryParams.push(encodeURIComponent(i) + '=' + encodeURIComponent(this.state.ingredients[i])) // important for white spaces in the url
    }
    const queryString = queryParams.join('&');

    this.props.history.push({
      pathname: '/checkout',
      search: '?' + queryString
    });
```

Checkout.js

```js
componentDidMount() {
    const query = new URLSearchParams(this.props.location.search);
    const ingredients = {};

    for (let param of query.entries()) {
      // ['salad', '1]
      ingredients[param[0]] = +param[1];
    }
    this.setState({ingredients: ingredients});
  }
```




