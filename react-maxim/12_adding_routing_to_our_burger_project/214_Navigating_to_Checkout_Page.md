
#214 Navigating to the Checkout Page

the purchasedContinueHandler who continues

BurgerBuilder.js

we comment out everything in purchaseContinueHandler, cuz we don't want to send the order to firebase, we just want to go to checkout page

we have the special props (history,match), in components loaded by routing. in its children we don't have them

we could have this

Burger.js

not loaded by routing, it is child of BurgerBuilder

if we use a special hoc provided by react-router-dom, we kind of inject these special props in any component

```js
import {withRouter} from 'react-router-dom';
```

```js
export default withRouter(burger);
```

now if we console log the props in the componentDidMount, we see the routing props

we delete that, was just to show it

BurgerBuilder.js

```js
  purchaseContinueHandler = () => {

    this.props.history.push('/checkout');
```



