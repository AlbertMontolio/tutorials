#197 Navigating Programmatically

alternative for that

```js
<Link to={'/' + post.id} key={post.id} >
```

we comment out the link

```js
return (
  // <Link to={'/' + post.id} key={post.id} >
    <Post 
    key={post.id}
    title={post.title} 
    author={post.author}
    clicked={() => this.postSelectedHandler(post.id)}
    />
  // </Link>
)
```

we need a way to access this post. We have a clicked listener

we use the method, to navigate programatically

this is ideal for: after an http request is finish

```js
  postSelectedHandler = (id) => {
  }
```

to achieve this, we can take advantage of this history object that we get in the props.

there, we have functions for navigating around

the push method allows you to push a new page into the stack of pages.

```js
  postSelectedHandler = (id) => {
    this.props.history.push({pathname: "/" + id});
    // this.props.history.push("/" + id);
  }
```

everything still works :)



