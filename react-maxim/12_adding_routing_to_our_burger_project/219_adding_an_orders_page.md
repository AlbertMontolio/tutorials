#219 Adding an orders page

containers/Orders/Orders.js

```js
import React, {Component} from 'react';

class Orders extends Component {
  render () {
    return ();
  }
}

export default Orders;
```

Order/Order.css
Order/Order.js

```js
import React from 'react';

const order = (props) => (
  <div>
    <p>Ingredients: Salad (1)</p>
    <p>Price: <strong>USD 4.55</strong></p>
  </div>
);

export default order;
```

Order.css

```js
.Order {
  width: 100%;
  border: 1px solid #eee;
  box-shadow: 0 2px 3px #ccc;
  padding: 10px;
  margin: 10px auto;
  box-sizing: border-box;
}
```

Order.js

```js
import React from 'react';
import classes from './Order.css';

const order = (props) => (
  <div className={classes.Order}>
    <p>Ingredients: Salad (1)</p>
    <p>Price: <strong>USD 4.55</strong></p>
  </div>
);

export default order;
```

the orders will come from firebase

Orders.js

```js
import Order from '../../components/Order/Order';
```

```js
class Orders extends Component {
  render () {
    return (
      <div>
        <Order />
        <Order />
      </div>
    );
  }
}
```

Orders page should be loaded instead of burgerBuilder or checkout page

in App.js

```js
import Orders from './containers/Orders/Orders';
```

```js
<Layout>
  <Switch>
    <Route path="/checkout" component={Checkout} />
    <Route path="/orders" component={Order} />
    <Route path="/" component={BurgerBuilder} />
  </Switch>
</Layout>
```


