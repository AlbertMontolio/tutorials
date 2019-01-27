#204 Working with Guards

navigation guards

if the user is authenticated or not, some routes where you want to allow the user only if he is authenticated

we can render newPost conditonally

Blog.js

```js
class Blog extends Component {

    state = {
        auth: false
    }
```

```js
<Switch>
  {this.auth ? <Route path="/new-post" component={NewPost} /> : null}
```

this is a guard.

we could do the same in NewPost.js in componentDidMount

```js
    componentDidMount() {
        // this.props.history.replace("/posts");
    }
```



