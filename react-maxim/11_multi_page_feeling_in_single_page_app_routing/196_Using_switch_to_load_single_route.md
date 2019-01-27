#196 Using Switch to Load a Single Route

Blog.js

```js
<Route path="/" exact component={Posts} />
<Route path="/new-post" component={NewPost} />
<Route path="/:id" exact component={FullPost} />
```

all routes are rendered if they match the path

we need

```js
<Route path="/posts/:id" exact component={FullPost} />
```

Posts.js

```js
<Link to={'/posts/' + post.id} key={post.id} >
```

sometimes we can not do that. if we have this:

```js
<Route path="/" exact component={Posts} />
<Route path="/new-post" component={NewPost} />
<Route path="/:id" exact component={FullPost} />
```

we can still tell react to render just one of them

we can use for that the Switch component

Blog.js

```js
import {Route, NavLink, Switch} from 'react-router-dom';
```

Switch tells react, hej just show one route from a set of routes

```js
<Switch>
    <Route path="/" exact component={Posts} />
    <Route path="/new-post" component={NewPost} />
    <Route path="/:id" exact component={FullPost} />
</Switch>
```

the first route that matches the path will be loaded





