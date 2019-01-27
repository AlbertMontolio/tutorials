#199 Understanding Nested Routes

now we click a post, we get rid of the posts, and we display the post

what if we want a nested route
you want to load a certain content inside of another component also loaded by routing

what if we want to load a specific post in the posts.js and not in the blog.js

```js
return (
  <div>
    <section>
      {posts}
    </section>
    <Route path="/:id" exact component={FullPost} />
  </div>
);
```

```js
import {Route} from 'react-router-dom';
import FullPost from '../FullPost/FullPost';
```

we can use the Route component wherever we want in our application.

in Blog.js we have the route to Posts. inside Posts we have a nested route

we never reach /

```js
<Switch>
    <Route path="/new-post" component={NewPost} />
    <Route path="/" component={Posts} />
</Switch>
```

we still have an issue. what if we have

Blog.js

```js
<Switch>
    <Route path="/new-post" component={NewPost} />
    <Route path="/posts" component={Posts} />
</Switch>
```

Posts.js

```js
postSelectedHandler = (id) => {
    this.props.history.push({pathname: "/posts/" + id});
    // this.props.history.push("/" + id);
  }
```

Blog.js

```js
<li>
  <NavLink 
      to="/posts/" 
      exact
```

Posts.js

```js
<Route path="/:id" exact component={FullPost} />
```

this is wrong. posts/id is not happening

```js
<Route path="/posts/:id" exact component={FullPost} />
```

this is very cumbersome. better to get the current path

```js
<Route path={this.props.match.url + '/:id'} exact component={FullPost} />
```














