#194 Extracting Route Parameters

if we inspect the props

history, location, match

inside match, we have a params object

we change componentDidUpdate() { to 

```js
componentDidMount() {
```

cuz now we are not updating, but mounting or removing the post.

we console log props there

match.params.id we find the id

```js
    componentDidMount() {
        if (this.props.match.params.id) {
            if (!this.state.loadedPost || (this.state.loadedPost && this.state.loadedPost.id !== this.props.id)) {
                axios.get('/posts/' + this.props.match.params.id)
```



