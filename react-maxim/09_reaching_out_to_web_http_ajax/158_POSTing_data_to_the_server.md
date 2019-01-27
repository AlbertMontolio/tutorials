#158 POSTing Data to the server

NewPost.js

```js
<button onClick={this.postDataHandler}>Add Post</button>
```

```js
import axios from 'axios';
```

```js
    postDataHandler = () => {
        const post = {
            title: this.state.title,
            body: this.state.content,
            author: this.state.author
        }
        axios.post('https://jsonplaceholder.typicode.com/posts', post)
            .then(response => {
                console.log(response);
            });
    }
```




