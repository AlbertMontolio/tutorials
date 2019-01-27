#153 Creating a Http Request to GET Data

render array of posts in Blog container

containers/Blog/Blog.js

```js
class Blog extends Component {
    render () {
        return (
            <div>
                <section className="Posts">
                    <Post />
                    <Post />
                    <Post />
                </section>
```

Where do we do the http request?

ComponentDidMount

Blog.js

```js
import axios from 'axios';
```

```js
class Blog extends Component {

    componentDidMount() {
        axios.get('https://jsonplaceholder.typicode.com/posts');
    }
```

```js
const posts = axios.get('https://jsonplaceholder.typicode.com/posts');
```

this does not work! get requests happens asynchronously

axios uses promises

```js
class Blog extends Component {

    componentDidMount() {
        axios.get('https://jsonplaceholder.typicode.com/posts')
            .then(response => {
                console.log(response);
            });
    }
```






