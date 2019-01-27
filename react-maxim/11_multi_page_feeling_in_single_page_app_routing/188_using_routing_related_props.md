#188 Using Routing-Related Props

Posts.js

```js
class Posts extends Component {

  state = {
    posts: [],
  }

  componentDidMount() {
    console.log(this.props);
```

we see
- history
- location
- match

match gives information about the current route

NewPost.js

```js
componentDidMount () {
  console.log(this.props);
}
```




