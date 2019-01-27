

#258 Combining Multiple Reducers

in our app, all actions are funneled by one reducer.

we can combine multiple reduceres into one. behind the scenes we always have one

without that, our reducer would be insanely big

let's have two reducers, one reducer for counter, one reducer for results

src/reducers/result.js
src/reducers/counter.js

we copy the here the code from reducer.js

```js
import * as actionTypes from '../actions';

const initialState = {
  counter: 0
};

const reducer = (state = initialState, action) => {

  switch (action.type) {
    case actionTypes.INCREMENT:
      const newState = Object.assign({}, state);
      newState.counter = state.counter + 1;
      return newState;
    case actionTypes.DECREMENT:
      return {
        ...state,
        counter: state.counter - 1
      }
    case actionTypes.ADD:
      return {
        ...state,
        counter: state.counter + action.val
      }
    case actionTypes.SUBSTRACT:
      return {
        ...state,
        counter: state.counter - action.val
      }
  }
  return state;
}

export default reducer;
```

result.js

```js
import * as actionTypes from './actions';

const initialState = {
  counter: 0,
  results: []
};

const reducer = (state = initialState, action) => {

  switch (action.type) {
    case actionTypes.STORE_RESULT:
      return {
        ...state,
        results: state.results.concat({id: new Date(), value: state.counter})
      }
    case actionTypes.DELETE_RESULT:
      // const id = 2;
      // const newArray = [...state.results]
      // newArray.results.splice(id, 1);
      const updatedArray = state.results.filter(result => result.id !== action.resultElId );
      return {
        ...state,
        results: updatedArray
      }
  }
  return state;
}

export default reducer;
```

we will have one reducer, one state, the two reducers will be merged

index.js

```js
import counterReducer from './store/reducers/counter';
import resultReducer from './store/reducers/result';
```

to combine them, i need to import a helper function from the redux package

```js
import {createStore, combineReducers} from 'redux';
```

this is a function, merges everything in one reducer

```js
const rootReducer = combineReducers({
  ctr: counterReducer,
  res: resultReducer
});
```

```js
const store = createStore(rootReducer);
```

Counter.js

```js
<ul>
    {this.props.storedResults.map(strResult => (
        <li key={strResult.id} onClick={() => this.props.onDeleteResult(strResult.id)}>{strResult.value}</li>
    ))}
</ul>
```

storedResults does not work, cuz we combined reducers. We will have one state at the end, to avoid naming conflicts, redux adds one level of nesting, with ctr and res

which gives access to this sub states

instead of

```js
const mapStateToProps = state => {
    return {
        ctr: state.counter,
        storedResults: state.results
    };
}
```

we use what we defined in the rootReducer (index.js)

```js
const mapStateToProps = state => {
    return {
        ctr: state.ctr.counter,
        storedResults: state.res.results
    };
}
```

app is working, except store result button

the reason is, storedResult is undefined

in result.js, we do state.counter

```js
case actionTypes.STORE_RESULT:
      return {
        ...state,
        results: state.results.concat({id: new Date(), value: state.counter})
      }
```

this is not known, in this reducer, in the initial state, we don't have a counter property:

```js
const initialState = {
  results: []
};
```

but does not work. this reducer function (result.js) has no access to the global state

if we are inside a reducer, where we need to get a value from the global state, we should get it as an action payload.

result.js

```js
case actionTypes.STORE_RESULT:
  return {
    ...state,
    results: state.results.concat({id: new Date(), value: action.result})
  }
```

in Counter.js, where

```js
onStoreResult: () => dispatch({type: actionTypes.STORE_RESULT}),
```

i expect to get the result

and pass it, using the key that we defined in result.js (result)

```js
onStoreResult: (result) => dispatch({type: actionTypes.STORE_RESULT, result: result}),
```

we execut the function in the btn, so that we can pass data into onStoreResult

```js
<button onClick={() => this.props.onStoreResult(this.props.ctr)}>Store Result</button>
```

we splitted our reducers into different slices














