#253 Switch-Case in the Reducer

```js
const reducer = (state = initialState, action) => {

  switch (action.type) {
    case 'INCREMENT':
      return {
        counter: state.counter + 1
      }
    case 'DECREMENT':
      return {
        counter: state.counter - 1
      }
    case 'ADD':
      return {
        counter: state.counter + action.val
      }
    case 'SUBSTRACT':
      return {
        counter: state.counter - action.val
      }
  }
  return state;
}
```


