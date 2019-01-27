#190 Absolute vs Relative Paths

```js
<li><Link to="/">Home</Link></li>
<li><Link to={{
    pathname: "/new-post",
    hash: '#submit',
    search: '?quick-submit=true'
}}>New Post</Link></li>
```

absolute path is always appended to your domain

no matter /new-post or new-post, it's absolute path, will be appended after the domain

by default absolute path

what if we want relative path

```js
<li><Link to={{
  pathname: this.props.match.url + "/new-post",
```

this is a relative path

u don't append to the domain, but to the current path

choose what you need

