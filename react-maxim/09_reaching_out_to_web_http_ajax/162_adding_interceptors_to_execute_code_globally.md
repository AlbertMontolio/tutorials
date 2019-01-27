#162 Adding Intercepotrs to Execute Code Globally

they are executed whenever a request is made, or the response comes back

if you want to log responses etc.

index.js

the most global file

register a new interceptor

```js
axios.interceptors.request.use();
```

receives the request

```js
axios.interceptors.request.use(request => {
  console.log(request);
});
```

we are blocking the rquest! we need to return the rquest

```js
axios.interceptors.request.use(request => {
  console.log(request);
  // you can edit the request
  return request;
});
```

```js
axios.interceptors.request.use(request => {
  console.log(request);
  // you can edit the request
  return request;
}, error => {
  console.log(error);
  return Promise.reject(error);
});
```

if we put post url postsss, we don't see the error, cuz this error handles if internet is down for example.

```js
axios.interceptors.response.use(response => {
  console.log(response);
  // you can edit the response
  return response;
}, error => {
  console.log(error);
  return Promise.reject(error);
});
```




