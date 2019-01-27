#247 Dispatching Actions

```js
// dispatching action
store.dispatch({type: 'INC_COUNTER'});
store.dispatch({type: 'ADD_COUNTER', value: 10});
console.log(store.getState());
```

we still have a counter of 0

```js
// reducer
const rootReducer = (state = initialState, action) => {
  if (action.type === 'INC_COUNTER') {
    state.counter++
    return state
  }
```

we don't do that

we need to return a new js object, where we use the spread operator



