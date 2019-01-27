#221 Fetching Orders

in the Orders container i want to fetch all my orders

```js
import axios from '../../axios-orders';
```

Orders.js

```js
import React, {Component} from 'react';
import Order from '../../components/Order/Order';
import axios from '../../axios-orders';

class Orders extends Component {
  state = {
    orders: [],
    loading: true
  }

  componentDidMount() {
    axios.get('/orders.json')
      .then(res => {
        console.log(res.data);
        this.setState({loading: false});
      })
      .catch(err => {
        this.setState({loading: false});
      });
  }
```

we get back a js object

```js
class Orders extends Component {
  state = {
    orders: [],
    loading: true
  }

  componentDidMount() {
    axios.get('/orders.json')
      .then(res => {
        console.log(res.data);

        const fetchedOrders = [];
        for (let key in res.data) {
          fetchedOrders.push({
            ...res.data[key],
            id: key
          });
        }

        this.setState({loading: false, orders: fetchedOrders});
      })
      .catch(err => {
        this.setState({loading: false});
      });
  }
```

I also want to handle any potential errors:

```js
import withErrorHandler from '../../hoc/withErrorHandler/withErrorHandler';
```

```js
export default withErrorHandler(Orders, axios);
```

