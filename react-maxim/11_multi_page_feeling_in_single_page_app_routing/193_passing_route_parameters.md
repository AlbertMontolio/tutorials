#193 Passing Route Parameters

let's click on a single post and load that

Posts.js

when we click, we do nothing, we don't have the state anymore

```js
  postSelectedHandler = (id) => {
    this.setState({selectedPostId: id});
  }
```

i want to load the full post. but where should be shown?

we need a dynamic route, we use the id for every post

Blog.js

```js
<Route path="/:id" exact component={Posts} />
```

Posts.js

```js
import {Link} from 'react-router-dom';
```

```js
return (
  <Link>
    <Post 
    key={post.id} 
    title={post.title} 
    author={post.author}
    clicked={() => this.postSelectedHandler(post.id)}
    />
  </Link>)
```

```js
<Link to={'/' + post.id}>
```

Blog.js

```js
import FullPost from './FullPost/FullPost';
```

```js
<Route path="/:id" exact component={FullPost} />
```

route is working, but in FullPost.js

in componentDidUpdate, we have this.props.id, which is not valid anymore

```js
    componentDidUpdate() {
        if (this.props.id) {
```

we need the parameter with the id








