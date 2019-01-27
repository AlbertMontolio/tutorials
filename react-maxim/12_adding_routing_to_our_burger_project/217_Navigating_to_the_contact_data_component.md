#217 Navigating to the Contact Data Component

Checkout/ContactData/ContactData.js

```js
.ContactData {
  margin: 20px auto;
  width: 80%;
  text-align: center;
}

@media (min-width: 600px) {
  .ContactData {
    width: 500px;
  }
}
```

```js
import React, {Component} from 'react';
import Button from '../../../components/UI/Button/Button';

class ContactData extends Component {
  state = {
    name: '',
    email: '',
    address: {
      street: '',
      postalCode: ''
    }
  }

  render () {
    return (
      <div>
        <h4>Enter your Contact Data</h4>
        <form>
          <input type="text" name="name" placeholder="Your Name" />
          <input type="email" name="email" placeholder="Your Email" />
          <input type="text" name="street" placeholder="Street" />
          <input type="text" name="postal" placeholder="Postal Code" />
          <Button btnType="Success">ORDER</Button>
        </form>
      </div>
    );
  }
}

export default ContactData;
```

Checkout.js

```js
return (
  <div>
    <CheckoutSummary 
      ingredients={this.state.ingredients} 
      checkoutCancelled={this.checkoutCancelledHandler}
      checkoutContinued={this.checkoutContinuedHandler}
    />
    <Route path={this.props.match.path + '/contact-data'} />
  </div>
);
```

we need to define which component to render

```js
import ContactData from './ContactData/ContactData';
```

```js
<Route path={this.props.match.path + '/contact-data'} component={ContactData}/>
```

now we want to get the ingredients in the ContactData component


