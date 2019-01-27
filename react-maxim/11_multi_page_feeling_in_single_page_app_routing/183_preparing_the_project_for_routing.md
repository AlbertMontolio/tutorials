#183 Preparing the project for routing

Posts.js

```js
import React, {Component} from 'react';

class Posts extends Component {
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

    return (
      <section>
        {posts}
      </section>
    );
  }
}

export default Posts;
```

```js
class Posts extends Component {

  state = {
    posts: [],
  }

  componentDidMount() {
    axios.get('/posts')
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
        //this.setState({error: true});
      });
  }

  postSelectedHandler = (id) => {
    this.setState({selectedPostId: id});
  }
```

Posts.js

```js
import axios from '../../../axios';
```

Blog.js

```js
import Posts from './Posts/Posts';
```

Posts.js

```js
import Post from '../../../components/Post/Post';
```

Posts.js

```js
import classes from './Posts.css';
```
















