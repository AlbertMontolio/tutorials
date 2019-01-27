#267 Connecting the Burger Builder Container to our Store

now it's time to work in the BurgerBuilder to receive the data there

we need the connect function

BurgerBuilder.js

```js
import { connect } from 'react-redux';
```

we have an issue:

we already have a hoc wrapping our component

```js
export default withErrorHandler(BurgerBuilder, axios);
```

not a problem, we can have as many hoc as we want

as long we pass the props in our hoc, all good

withErrorHandler.js

```js
<WrappedComponent {...this.props} />
```

BurgerBuilder.js

```js
import * as actionTypes from '../../store/actions';
```

```js
const mapStateToProps = state => {
  return {
    ings: state.ingredients
  };
}

const mapDispatchToProps = dispatch => {
  return {
    onIngredientAdded: () => dispatch({type: actionTypes.ADD_INGREDIENT})
  }
}
```

ADD_INGREDIENT & REMOVE_INGREDIENT require a payload

we need to pass the ingredient name

```js
const mapStateToProps = state => {
  return {
    ings: state.ingredients
  };
}

const mapDispatchToProps = dispatch => {
  return {
    onIngredientAdded: (ingName) => dispatch({type: actionTypes.ADD_INGREDIENT, ingredientName: ingName}),
    onIngredientRemoved: (ingName) => dispatch({type: actionTypes.REMOVE_INGREDIENT, ingredientName: ingName})
  }
}
```

```js
export default connect(mapStateToProps, mapDispatchToProps)(withErrorHandler(BurgerBuilder, axios));
```

let's use the props (ings, onIngredientAdd, etc.) in our BurgerBuilder

BurgerBuilder.js

```js
  render() {

    const disabledInfo = {
      ...this.state.ingredients
    }
```

now

```js
  render() {

    const disabledInfo = {
      ...this.props.ings
    }
```

```js
if (this.props.ings) {
```

and so on, everywhere

```js
<BuildControls 
            ingredientAdded={this.props.onIngredientAdded} 
            ingredientRemoved={this.props.onIngredientRemoved} 
```

both functions need an argument

we are already doing it

```js
        added={() => props.ingredientAdded(ctrl.type)}
        removed={() => props.ingredientRemoved(ctrl.type)}
```

ctrl.type is already the ingredient

order btn is not working

cuz purchasable prop



