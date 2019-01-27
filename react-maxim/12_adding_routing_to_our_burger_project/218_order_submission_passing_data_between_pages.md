#218 Order Submission & Passing Data Between Pages

when we click the btn, we want to submit the order (firebase)

```js
 <form>
          <input className={classes.Input} type="text" name="name" placeholder="Your Name" />
          <input className={classes.Input} type="email" name="email" placeholder="Your Email" />
          <input className={classes.Input} type="text" name="street" placeholder="Street" />
          <input className={classes.Input} type="text" name="postal" placeholder="Postal Code" />
          <Button btnType="Success">ORDER</Button>
        </form>
```

```js
<Button btnType="Success" clicked={this.orderHandler}>ORDER</Button>
```

we need the ingredients

in the Checkout.js, we built the component like this:

```js
<Route path={this.props.match.path + '/contact-data'} component={ContactData}/>
```

i want to somehow pass the ingredients, which i have in this component

the render property takes a function

```js
<Route path={this.props.match.path + '/contact-data'} 
          render={() => (<ContactData ingredients={this.state.ingredients} />)}/>
```

ContactData.js

```js
  orderHandler = (event) => {
    event.preventDefault;
    console.log(this.props.ingredients);
  }
```

we need the price

BurgerBuilder.js

```js
queryParams.push('price=' + this.state.totalPrice);
    const queryString = queryParams.join('&');
    this.props.history.push({
      pathname: '/checkout',
      search: '?' + queryString
    });
```

i have to get it inside my Checkout.js

```js
class Checkout extends Component {

  state = {
    ingredients: null,
    price: 0
  }

  componentDidMount() {
    const query = new URLSearchParams(this.props.location.search);
    const ingredients = {};
    let price = 0;

    for (let param of query.entries()) {
      // ['salad', '1]
      if (param[0] === 'price') {
        price = param[1];
      } else {
        ingredients[param[0]] = +param[1];
      }
    }
    this.setState({ingredients: ingredients, totalPrice: price});
  }
```

now i want to pass the price on to the ContactData.js

```js
<Route path={this.props.match.path + '/contact-data'} 
          render={() => (<ContactData ingredients={this.state.ingredients} price={this.state.totalPrice}/>)}/>
```

ContactData.js

i receive the property

```js
class ContactData extends Component {
  state = {
    name: '',
    email: '',
    address: {
      street: '',
      postalCode: ''
    },
    loading: false
  }

  orderHandler = (event) => {
    event.preventDefault();
    console.log(this.props.ingredients);

    this.setState({loading: true});

    const order = {
      ingredients: this.props.ingredients,
      price: this.props.price,
```

ContactData.js

```js
import axios from '../../../axios-orders';
```

we have a problem in Checkout.js

ingredients are null in state, at the beginning

we can change componentDidMount for compnentWillMount

let's add a spinner

ContactData.js

```js
import Spinner from '../../../components/UI/Spinner/Spinner';
```

```js
render () {

    let form = (
      <form>
        <input className={classes.Input} type="text" name="name" placeholder="Your Name" />
        <input className={classes.Input} type="email" name="email" placeholder="Your Email" />
        <input className={classes.Input} type="text" name="street" placeholder="Street" />
        <input className={classes.Input} type="text" name="postal" placeholder="Postal Code" />
        <Button btnType="Success" clicked={this.orderHandler}>ORDER</Button>
      </form>
    );

    if (this.state.loading) {
      form = <Spinner />
    }

    return (
      <div className={classes.ContactData}>
        <h4>Enter your Contact Data</h4>
        {form}
      </div>
    );
  }
```

let's redirect once we are done

normally, we could run 

```js
this.props.history.push('/');
```

however, since we are rendering ContactData in the Checkout.js with the render method and the function 

```js
<Route path={this.props.match.path + '/contact-data'} 
          render={() => (<ContactData ingredients={this.state.ingredients} price={this.state.totalPrice}/>)}/>
```

we don't have the history object available

1 - we can wrap the ContactData component with the withRouter hoc

2 - pass history through props

```js
<Route path={this.props.match.path + '/contact-data'} 
          render={(props) => (<ContactData ingredients={this.state.ingredients} price={this.state.totalPrice} {...props}/>)}/>
```

ContactData.js

```js
axios.post('/orders.json', order)
  .then(response => {
    this.setState({loading: false});
    this.props.history.push('/');
  })
```





