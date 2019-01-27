#246 setting up reducer and store

we have a normal state

```js
import React, { Component } from 'react';

import CounterControl from '../../components/CounterControl/CounterControl';
import CounterOutput from '../../components/CounterOutput/CounterOutput';

class Counter extends Component {
    state = {
        counter: 0
    }

    counterChangedHandler = ( action, value ) => {
        switch ( action ) {
            case 'inc':
                this.setState( ( prevState ) => { return { counter: prevState.counter + 1 } } )
                break;
            case 'dec':
                this.setState( ( prevState ) => { return { counter: prevState.counter - 1 } } )
                break;
            case 'add':
                this.setState( ( prevState ) => { return { counter: prevState.counter + value } } )
                break;
            case 'sub':
                this.setState( ( prevState ) => { return { counter: prevState.counter - value } } )
                break;
        }
    }

    render () {
        return (
            <div>
                <CounterOutput value={this.state.counter} />
                <CounterControl label="Increment" clicked={() => this.counterChangedHandler( 'inc' )} />
                <CounterControl label="Decrement" clicked={() => this.counterChangedHandler( 'dec' )}  />
                <CounterControl label="Add 5" clicked={() => this.counterChangedHandler( 'add', 5 )}  />
                <CounterControl label="Subtract 5" clicked={() => this.counterChangedHandler( 'sub', 5 )}  />
            </div>
        );
    }
}

export default Counter;
```

let's add redux

```js
npm install --save redux
```

src/redux-basics.js

not inside our project, we'll execute it with node js

in this file, we will write

- store
- reducer
- dispatching action
- subscription

let's start with the store

```js
const redux = require('redux');
```

this is nodeJs syntax

```js
const redux = require('redux');
const createStore = redux.createStore;

// reducer
const rootReducer = (state, action) => {
  return state;
};

// store
const store = createStore(rootReducer);
```

we can pull out the state from the store

```js
console.log(store.getState());
```

we can run this file with node

```js
node redux-basics.js
```

result is undefined

we need to initialize the state

```js
const redux = require('redux');
const createStore = redux.createStore;

const initialState = {
  counter: 0
}

// reducer
const rootReducer = (state = initialState, action) => {
  return state;
};
```

how do we now subscribe to the state and dispatch actions?




