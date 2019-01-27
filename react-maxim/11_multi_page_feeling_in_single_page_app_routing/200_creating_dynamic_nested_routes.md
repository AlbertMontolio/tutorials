#200 Creating Dynamic Nested Routes

react router behind the scenes, does not replace the componet all the time

FullPost.js

componentDidMount is not executed again.
the component itself didn't change

we should also implement componentDidUpdate

```js

    componentDidMount() {
        console.log(this.props);
        this.loadData();
    }

    componentDidUpdate() {
        this.loadData();
    }

    loadData() {
        if (this.props.match.params.id) {
            if (!this.state.loadedPost || (this.state.loadedPost && this.state.loadedPost.id !== this.props.id)) {
                axios.get('/posts/' + this.props.match.params.id)
                .then(response => {
                    console.log(response);
                    this.setState({loadedPost: response.data});
                });
            }
        }
    }
```

now we have an infinite loop

this is wrong

```js
if (!this.state.loadedPost || (this.state.loadedPost && this.state.loadedPost.id !== this.props.id)) {
                axios.get('/posts/' + this.props.match.params.id)
```

like this

```js
if (!this.state.loadedPost || (this.state.loadedPost && this.state.loadedPost.id !== this.props.match.params.id)) {
                axios.get('/posts/' + this.props.match.params.id)
```

also here

```js
deletePostHandler = () => {
        axios.delete('/posts/' + this.props.match.params.id)
```

```js
if (this.props.match.params.id) {
```

the id that we retrieve from the params, is actually a string

```js
if (!this.state.loadedPost || (this.state.loadedPost && this.state.loadedPost.id != this.props.match.params.id)) {
```

we simple not compare for the type


