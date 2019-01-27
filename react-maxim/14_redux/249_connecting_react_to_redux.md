#249 Connecting React to Redux

index.js

```js
import {createStore} from 'redux';

const store = createStore();
```

src/store/reducer.js

```js
const initialState = {
  counter: 0
};

const reducer = (state = initialState, action) => {
  return state;
}

export default reducer;
```

index.js

```js
import reducer from './store/reducer';

const store = createStore(reducer);
```

with that we are creating our store successfully with our reducer

now we want to connect our store with the react App

```js
const store = createStore(reducer);

ReactDOM.render(<App />, document.getElementById('root'));
registerServiceWorker();
```






