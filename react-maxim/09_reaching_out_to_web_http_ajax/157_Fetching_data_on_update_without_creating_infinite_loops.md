#157 Fetching Data on Update (without creating infinite loop)

fetch data for the selected post

send http request once we got a valid id

which lifecycle hook should we use here?

FullPost.js

```js
import axios from 'axios';
```

```js
class FullPost extends Component {

    componentDidUpdate() {
        if (this.props.id) {
            axios.get('https://jsonplaceholder.typicode.com/posts/' + this.props.id)
            .then(response => {
                console.log(response);
            });
        }
    }
```

```js
class FullPost extends Component {
    state = {
        loadedPost: null
    }
```

```js
post = (
    <div className="FullPost">
        <h1>{this.state.loadedPost.title}</h1>
        <p>{this.state.loadedPost.body}</p>
        <div className="Edit">
            <button className="Delete">Delete</button>
        </div>
    </div>
);
```

```js
.then(response => {
    // console.log(response);
    this.setState({loadedPost: response.data});
});
```

```js
    render () {
        let post = <p style={{textAlign: "center"}}>Please select a Post!</p>;

        if (this.props.id) {
            post = <p style={{textAlign: "center"}}>Loading</p>
        }

        if (this.state.loadedPost) {
```

we are sending after request, after request * infinite

we are updating this.setState inside componentDidUpdate. This creates an infinite loop

this.setState, component is updated, so componentDidUpdate is triggered, and so on and so on...

we want to trigger componentDidUpdate if the post is a new post

```js
    componentDidUpdate() {
        if (this.props.id) {
            if (!this.state.loadedPost || (this.state.loadedPost && this.state.loadedPost.id !== this.props.id)) {
                axios.get('https://jsonplaceholder.typicode.com/posts/' + this.props.id)
                .then(response => {
                    console.log(response);
                    this.setState({loadedPost: response.data});
                });
            }
        }
    }
```







