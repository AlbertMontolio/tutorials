154 Rendering Fetched Data to the Screen

```js
class Blog extends Component {
    state = {
        posts: []
    }

    componentDidMount() {
        axios.get('https://jsonplaceholder.typicode.com/posts')
            .then(response => {
                this.setState({posts: response.data});
                console.log(response);
            });
    }
```

Post.js

```js
const post = (props) => (
    <article className="Post">
        <h1>{props.title}</h1>
```

Blog.js

```js
    render () {
        const posts = this.state.posts.map(post => {
            return <Post key={post.id} title={post.title} />
        });

        return (
            <div>
                <section className="Posts">
                    {posts}
                </section>
```

we have too many posts



