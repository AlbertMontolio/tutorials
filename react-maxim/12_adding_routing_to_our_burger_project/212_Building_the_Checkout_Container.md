#212 Building the Checkout Container

containers/Checkout/Checkout

state will be involved

```js
import React, {Component} from 'react';

class Checkout extends Component {

}

export default Checkout;
```

we could show the burger again, as a confirmation

components/Order/CheckoutSummary/CheckoutSummary.js

```js
.CheckoutSummary {
  text-align: center;
  width: 80%;
  margin: auto;
}

@media (min-width: 600px) {
  .CheckoutSummary {
    width: 500px;
  }
}
```

```js
import React from 'react';
import Burger from '../../Burger/Burger';
import Button from '../../UI/Button/Button';
import classes from './checkoutSummary';

const checkoutSummary = (props) => {
  return (
    <div className={classes.CheckoutSummary}>
      <h1>We hope it tastes well!</h1>
      <div style={{width: '300px', height: '300px', margin: auto}}>
        <Burger ingredients={props.ingredients}/>
      </div>
      <Button btnType="Danger" clicked>CANCEL</Button>
      <Button btnType="Success" clicked>CONTINUE</Button>
    </div>
  );
}

export default checkoutSummary;
```

Checkout.js

which ingredients? for now, dummy ingredients

we will use routing to pass the ingredients

```js
import React, {Component} from 'react';
import CheckoutSummary from '../../components/Order/CheckoutSummary/CheckoutSummary';

class Checkout extends Component {

  state = {
    ingredients: {
      salad: 1,
      meat: 1,
      cheese: 1,
      bacon: 1
    }
  }

  render() {
    return (
      <div>
        <CheckoutSummary ingredients={this.state.ingredients} />
      </div>
    );
  }
}

export default Checkout;
```

App.js

```js
return (
  <div>
    <Layout>
      <BurgerBuilder />
      <Checkout />
    </Layout>
  </div>
);
```

the goal is, when we click order now, continue, that we display the checkout page, and not the BurgerBuilder






