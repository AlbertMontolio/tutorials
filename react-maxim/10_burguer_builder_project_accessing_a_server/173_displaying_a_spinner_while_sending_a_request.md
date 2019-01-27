#173 Displaying a spinner while sending a request

a spinner inside the modal, instead of OrderSummary

UI/Spinner/Spinner.js

google: css spinners

```js
https://projects.lukehaas.me/css-loaders/
```

```js
import React from 'react';
import classes from './Spinner.css';

const spinner = () => (
  <div className={classes.Loader}>Loading...</div>
);

export default spinner;
```

BurgerBuilder.js

```js
class BurgerBuilder extends Component {

  state = {
    ingredients: {
      salad: 0,
      bacon: 0,
      cheese: 0,
      meat: 0
    },
    totalPrice: 4,
    purchasable: false,
    purchasing: false,
    loading: false
  }
```

```js
import Spinner from '../../components/UI/Spinner/Spinner';
```

```js
    let orderSummary = <OrderSummary 
      price={this.state.totalPrice.toFixed(2)}
      ingredients={this.state.ingredients}
      purchaseCancelled={this.purchaseCancelHandler}
      purchaseContinued={this.purchaseContinueHandler}
    />

    if (this.state.loading) {
      orderSummary = <Spinner />
    }

    return (
      <Aux>
        <Modal show={this.state.purchasing} modalClosed={this.purchaseCancelHandler}>
          {orderSummary}
        </Modal>
```

let's switch the state

```js
  purchaseContinueHandler = () => {
    this.setState({loading: true});
```

```js
axios.post('/orders.json', order)
      .then(response => {
        this.setState({loading: false, purchasing: false});
      })
      .catch(error => {
        this.setState({loading: false, purchasing: false});
      });
```

we didn't see the spinner

in Modal.js

we just update the component if the show state changes

Modal.js

```js
class Modal extends Component {

  shouldComponentUpdate(nextProps, nextState) {
    return nextProps.show !== this.props.show;
  }
```

now the children change, we are passing a spinner instead of the OrderSummary

```js
class Modal extends Component {

  shouldComponentUpdate(nextProps, nextState) {
    return nextProps.show !== this.props.show || nextProps.children !== this.props.children;
  }
```



