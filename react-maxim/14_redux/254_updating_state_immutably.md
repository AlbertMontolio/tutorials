#254 Updating state immutably

restructure the reducer

```js
const initialState = {
  counter: 0,
  results: []
};
```

Counter.js

```js
<CounterControl label="Subtract 15" clicked={this.props.onSubstractCounter}  />
  <hr />
  <button>Store Result</button>
  <ul>
      <li></li>
  </ul>
```

when i click store result, i add the current counter value to my result list.

i want to dispatch an action whenever i click the btn, and push it into the results array.

also, when i click one of these li, i want to remove it

```js
<button onClick={this.props.onStoreResult}>Store Result</button>
  <ul>
      <li onClick={this.props.onDeleteResult}></li>
  </ul>
```

we are dispatching STORE_RESULT

in reducer.js, in if STORE_RESULT i want to return an updated version of my state

and it should be immutabland it should be immutable

before, we just had the counter, but now we are deleting results, every time we are dispatching an action:

```js
  switch (action.type) {
    case 'INCREMENT':
      return {
        counter: state.counter + 1
      }
```

this is not what we do:

```js
  switch (action.type) {
    case 'INCREMENT':
      const newState = state;
      newState.counter = state.counter + 1;
      return newState;
```

we are mutating the old state. instead, we copy the old state. one way is

we clone the old object

```js
const newState = Object.assign({}, state);
```

now we truly have a new object, with all the properties of the old object

now we have a copy, but not a deep clone

there is a shorter way

```js
case 'DECREMENT':
  return {
    ...state,
    counter: state.counter - 1
  }
```

in all of them

for STORE_RESULT we don't use push! it manipulates the original value, we use concat instead

concat returns a new array!

arrays are reference types

```js
    case 'STORE_RESULT':
      return {
        ...state,
        results: state.results.concat(state.counter)
      }
```

we can improve 

```js
    case 'STORE_RESULT':
      return {
        ...state,
        results: state.results.concat({id: new Date(), value: state.counter})
      }
```

now we can bind it into our mapStateToProps

Counter.js

```js
const mapStateToProps = state => {
    return {
        ctr: state.counter,
        storedResults: state.results
    };
}
```

```js
<button onClick={this.props.onStoreResult}>Store Result</button>
  <ul>
      {this.props.storedResults.map(strResult => (
          <li key={strResult.id} onClick={this.props.onDeleteResult}>{strResult.value}</li>
      ))}
  </ul>
```











