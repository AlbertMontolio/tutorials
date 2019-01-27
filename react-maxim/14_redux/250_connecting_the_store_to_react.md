#250 Connecting the Store to react

redux alone is not connected to react, so we need a special package

```js
npm install --save react-redux
```

this allows us to hook up our redux store with our react application

now i can import sth from that package

index.js

```js
import {Provider} from 'react-redux';
```

provider allows us to inject the store into the react components

```js
import {createStore} from 'redux';
import reducer from './store/reducer';
import {Provider} from 'react-redux';

const store = createStore(reducer);

ReactDOM.render(<Provider><App /></Provider>, document.getElementById('root'));
registerServiceWorker();
```

```js
ReactDOM.render(<Provider store={store}><App /></Provider>, document.getElementById('root'));
registerServiceWorker();
```

how do we get the data of our store, into our counter container?

we want to connect the container counter with the store, or to be precise, we want to set a subscription

we will not do it manually like in the example before, with subscribe(), we will use a feature provided by the react-redux package.

Counter.js

```js
import {connect} from 'react-redux';
```

it's a function, a hoc actually

connect it's a function that returns a function

so connect it's not a hoc, it's a function that returns a hoc

```js
export default connect()(Counter);
```

i can use ctr in my component

```js
const mapStateToProps = state => {
    return {
        ctr: state.counter // state manage by redux, in the reducer.js
    };
}
```

```js
export default connect(mapStateToProps)(Counter);
```

```js
<CounterOutput value={this.props.ctr} />
```

