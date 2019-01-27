#266 Finishing the reducer for ingredients

```js
const reducer = (state = initialState, action) => {
  switch (action.type) {
    case actionTypes.ADD_INGREDIENT:
      return {

      }
    case actionTypes.REMOVE_INGREDIENT:
      return {
        
      }
    default:
      return state;
  }
}
```

BurgerBuilder.js

```js
  componentDidMount () {
    // axios.get('https://react-my-burger-9169c.firebaseio.com/ingredients.json')
    //   .then(response => {
    //     this.setState({ingredients: response.data});
    //   })
    //   .catch(error => {
    //     this.setState({error: true});
    //   });
  }
```

ingredients in my state, are no longer null at the beginning

```js
const initialState = {
  ingredients: null,
  totalPrice: 4,
}
```

instead

```js
const initialState = {
  ingredients: {
    salad: 0,
    bacon: 0,
    cheese: 0,
    meat: 0
  },
  totalPrice: 4,
}
```

when we add an ingredient, we need to know which one we are adding

just distributing state, won't do immutability in ingredients

does not create deep clones

```js
const reducer = (state = initialState, action) => {
  switch (action.type) {
    case actionTypes.ADD_INGREDIENT:
      return {
        ...state,
        ingredients: {
          ...state.ingredients,
          [action.ingredientName]: state.ingredients[action.ingredientName] + 1 //es6 to create var dynamically
        }
      }
```

let's remove

```js
 case actionTypes.REMOVE_INGREDIENT:
      return {
        ...state,
        ingredients: {
          ...state.ingredients,
          [action.ingredientName]: state.ingredients[action.ingredientName] - 1 //es6 to create var dynamically
        }
      }
```

we need to connect our store to our app
