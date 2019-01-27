#159 Sending a DELETE Request

FullPost.js

```js
<button className="Delete" onClick={this.deletePostHandler}>Delete</button>
```

```js
    deletePostHandler = () => {
        axios.delete('https://jsonplaceholder.typicode.com/posts/' + this.props.id)
            .then(response => {
                console.log(response);
            });
    }
```


