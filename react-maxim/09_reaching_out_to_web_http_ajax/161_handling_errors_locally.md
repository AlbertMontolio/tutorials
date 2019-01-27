#161 Handling Errors Locally

requests do not always succeed

handling errors with axios

Blog.js

```js
componentDidMount() {
        axios.get('https://jsonplaceholder.typicode.com/postssss')
```

a promise not only has the then method, but the catch method

```js
.then(response => {
    const posts = response.data.slice(0, 4);
    const updatedPosts = posts.map(post => {
        return {
            ...post,
            author: 'Max'
        }
    });
    this.setState({posts: updatedPosts});
    console.log(response);
})
.catch(error => {
    console.log(error);
});
```

we can update the ui to let user know

```js
class Blog extends Component {
    state = {
        posts: [],
        selectedPostId: null,
        error: false
    }
```

```js
.catch(error => {
    console.log(error);
    this.setState({error: true});
});
```

```js
    render () {
        let posts = <p style={{textAlign: "center"}}>Something went wrong</p>

        if (!this.state.error) {
            posts = this.state.posts.map(post => {
                return <Post 
                    key={post.id} 
                    title={post.title} 
                    author={post.author}
                    clicked={() => this.postSelectedHandler(post.id)}
                />
            });
        }
```






