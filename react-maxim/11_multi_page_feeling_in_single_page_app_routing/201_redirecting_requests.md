#201 Redirecting Requests

redirect the users to posts, if he enters /

we could duplicate the route and path "/"

```js
<Switch>
    <Route path="/new-post" component={NewPost} />
    <Route path="/posts" component={Posts} />
    {/* <Route path="/" component={Posts} /> */}
</Switch>
```

or, we can use a special component, the Redirect

Blog.js

```js
import {Route, NavLink, Switch, Redirect} from 'react-router-dom';
```

```js
<Switch>
    <Route path="/new-post" component={NewPost} />
    <Route path="/posts" component={Posts} />
    <Redirect from="/" to="/posts" />
    {/* <Route path="/" component={Posts} /> */}
</Switch>
```

it should be inside the Switch statement

conditional redirects outside the switch, in the next lecture



