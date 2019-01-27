#251 Dispatching actions from within the Component

we don't have acces to our store in our container, but we do through the connect

we call dispatch behind the scenes

```js
const mapDispatchToProps = dispatch => {
    return {
        onIncrementCounter: () => dispatch()
    }
}
```

this funciton will be available through the onIncrementCounter property

```js
const mapDispatchToProps = dispatch => {
    return {
        onIncrementCounter: () => dispatch({type: 'INCREMENT'})
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(Counter);
```

```js
<CounterControl label="Increment" clicked={this.props.onIncrementCounter} />
```

with that we are dispatching an action

reducer.js

```js
const initialState = {
  counter: 0
};

const reducer = (state = initialState, action) => {
  if (action.type === 'INCREMENT') {
    return {
      counter: state.counter + 1
    }
  }
  return state;
}

export default reducer;
```
we can remove the state and the method 
