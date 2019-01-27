
#213 Setting Up Routing & Routes

```js
npm install --save react-router-dom
```

we need to wrap our application with BrowserRouter

index.js

```js
import {BrowserRouter} from 'react-router-dom';
```

```js
import React from 'react';
import ReactDOM from 'react-dom';
import {BrowserRouter} from 'react-router-dom';

import './index.css';
import App from './App';
import * as serviceWorker from './serviceWorker';

const app = (
  <BrowserRouter>
    <App />
  </BrowserRouter>
)
  
ReactDOM.render(app, document.getElementById('root'));
```

now routing is enabled

App.js

```js
import {Route} from 'react-router-dom';
```

now we don't need to hardcode:

```js
return (
  <div>
    <Layout>
      <BurgerBuilder />
      <Checkout />
    </Layout>
  </div>
);
```

we can do

```js
<Layout>
  <Switch>
    <Route path="/checkout" component={Checkout} />
    <Route path="/" component={BurgerBuilder} />
  </Switch>
</Layout>
```



