#208 Routing and Server Deployment

development server is configured correctly, but in production we need to take care of this

the server handles the requests first, the problem is, react app knows the routes

we get 404 error, cuz the server does not know about the errors

we need to tell the server, always load index.html

cuz react will take the job from here. the 404, etc.

example.com is fine
example.com/my-app

here you need to set the base path

App.js

default is /

```js
<BrowserRouter basename="/my-app">
```
