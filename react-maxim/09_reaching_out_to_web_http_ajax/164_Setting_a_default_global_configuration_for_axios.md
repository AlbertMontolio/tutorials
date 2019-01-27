#164 Setting a default global configuration for Axios

let's say that we make requests to always the same url

Blog.js

instead of this:

```js
componentDidMount() {
        axios.get('https://jsonplaceholder.typicode.com/posts')
```

we want this:

```js
    componentDidMount() {
        axios.get('/posts')
```

index.js

```js
axios.defaults.baseURL = "https://jsonplaceholder.typicode.com";
```

```js
axios.defaults.baseURL = "https://jsonplaceholder.typicode.com";
axios.defaults.headers.common['Authorization'] = 'AUTH TOKEN';
axios.defaults.headers.common['Content-Type'] = 'application/json';
```
