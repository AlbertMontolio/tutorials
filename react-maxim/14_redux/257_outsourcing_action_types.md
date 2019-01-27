#257 Outsourcing action types

reducer.js

we have switch with multiple cases, where we have the key words INCREMENT, DECREMENT etc.

Counter.js

we also have the words there, but we can do tiny typos.

is a good practice to outsource

store/actions.js

```js
export const INCREMENT = 'INCREMENT';
export const DECREMENT = 'DECREMENT';
export const ADD = 'ADD';
export const SUBSTRACT = 'SUBSTRACT';
export const STORE_RESULT = 'STORE_RESULT';
export const DELETE_RESULT = 'DELETE_RESULT';
```

reducer.js

```js
import * as actionTypes from './actions';
```

```js
case actionTypes.INCREMENT:
```

Counter.js

```js
import * as actionTypes from '../../store/actions';
```

```js
const mapDispatchToProps = dispatch => {
    return {
        onIncrementCounter: () => dispatch({type: actionTypes.INCREMENT}),
        onDecrementCounter: () => dispatch({type: actionTypes.DECREMENT}),
        onAddCounter: () => dispatch({type: actionTypes.ADD, val: 10}),
        onSubstractCounter: () => dispatch({type: actionTypes.SUBSTRACT, val: 15}),
        onStoreResult: () => dispatch({type: actionTypes.STORE_RESULT}),
        onDeleteResult: (id) => dispatch({type: actionTypes.DELETE_RESULT, resultElId: id })
    }
}
```





