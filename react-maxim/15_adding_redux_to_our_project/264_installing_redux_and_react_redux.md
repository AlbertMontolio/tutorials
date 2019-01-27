#264 Installing Redux and React Redux

```js
npm install --save redux react-redux
```

create store, reducer and actions

src/store/reducer.js
src/store/actions.js

BurgerBuilder.js

which actions do we need? we have a look at the methods

add ingredients, remove ingredient

actions.js

```js
export const ADD_INGREDIENT = 'ADD_INGREDIENT';
export const REMOVE_INGREDIENT = 'REMOVE_INGREDIENT';
```

reducer.js

```js
import * as actionTypes from './actions';

const initialState = {
  ingredients: null,
  totalPrice: 4,
}

const reducer = (state = initialState, action) => {

}

export default reducer;
```

index.js

we already wrapp our app with the browserrouter

```js
const app = (
  <BrowserRouter>
    <App />
  </BrowserRouter>
)
```

where do we add provider? inside or outside browserRouter?




