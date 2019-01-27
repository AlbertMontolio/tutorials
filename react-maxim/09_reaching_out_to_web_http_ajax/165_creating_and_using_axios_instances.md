#165 Creating and Using Axios instances

what if you have multiple urls

src/axios.js

```js
import axios from 'axios';

const instance = axios.create({
  baseUrl: "https://jsonplaceholder.typicode.com"
});
```

comment it out in the index.js

```js
import axios from 'axios';

const instance = axios.create({
  baseUrl: "https://jsonplaceholder.typicode.com"
});

instance.defaults.headers.common['Authorization'] = 'AUTH TOKEN FROM INSTANCE';

export default instance;
```

Blog.js

```js
// import axios from 'axios';
import axios from '../../axios';
```

we don't see the interceptor, cuz we made it for the axios global object, and in the blog component we are not using it anymore

in the new post we see it

