#171 Creating the Axios instance

```js
npm install --save axios
```

```js
npm start
```

let's create an instance of axios

src/axios-orders.js

```js
import axios from 'axios';

const instance = axios.create({
  baseURL: "https://react-my-burger-9169c.firebaseio.com/"
});

export default instance;
```


