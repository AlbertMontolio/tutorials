#248 Adding subscriptions

```js
// store
const store = createStore(rootReducer);
console.log(store.getState());

// subscription
store.subscribe(() => {
  console.log('[Subscription]', store.getState());
});

// dispatching action
store.dispatch({type: 'INC_COUNTER'});
store.dispatch({type: 'ADD_COUNTER', value: 10});
console.log(store.getState());

```

that was redux without react, let's learn how to use this in react
