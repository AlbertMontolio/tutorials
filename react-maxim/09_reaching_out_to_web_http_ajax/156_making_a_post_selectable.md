#156 Making a Post Selectable

Post.js

```js
const post = (props) => (
    <article className="Post" onClick={props.clicked}>
```

Blog.js

```js
    render () {
        const posts = this.state.posts.map(post => {
            return <Post 
                key={post.id} 
                title={post.title} 
                author={post.author}
                clicked={() => this.postSelectedHandler(post.id)}
            />
        });
```

```js
<FullPost id={this.state.selectedPostId} />
```

```js
class Blog extends Component {
    state = {
        posts: [],
        selectedPostId: null
    }
```

```js
    postSelectedHandler = (id) => {
        this.setState({selectedPostId: id});
    }
```

FullPost.js

display select a post or the selected post depending on if we have an id or not

```js
class FullPost extends Component {
    render () {
        let post = <p style={{textAlign: 'center'}}>Please select a Post!</p>;

        if (this.props.id) {
            post = (
                <div className="FullPost">
                    <h1>Title</h1>
                    <p>Content</p>
                    <div className="Edit">
                        <button className="Delete">Delete</button>
                    </div>
                </div>

            );
        }
        return post;
    }
}
```



