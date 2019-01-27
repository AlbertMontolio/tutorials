#252 Passing and Retrieving Data with Action

Counter.js

```js
onAddCounter: () => dispatch({type: 'ADD', val: 10}),
```

reducer.js

```js
if (action.type === 'ADD') {
    return {
      counter: state.counter + action.val
    }
  }
  if (action.type === 'SUBSTRACT') {
    return {
      counter: state.counter - action.val
    }
  }
```



