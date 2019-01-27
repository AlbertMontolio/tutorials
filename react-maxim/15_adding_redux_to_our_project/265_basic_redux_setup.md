#265 basic redux setup

index.js

```js
import { Provider } from 'react-redux';
```

the provider should wrap everything!

```js
const app = (
  <Provider>
    <BrowserRouter>
      <App />
    </BrowserRouter>
  </Provider>
)
```

there is sth special using react redux with react router

it has to do, making sure, that the connect functionality and route functionality, works fine. 

we connect our store from redux with our react app

```js
import { Provider } from 'react-redux';
import { createStore } from 'redux';
import reducer from './store/reducer';

const store = createStore(reducer);

const app = (
  <Provider store={store}>
    <BrowserRouter>
      <App />
    </BrowserRouter>
  </Provider>
)
```





