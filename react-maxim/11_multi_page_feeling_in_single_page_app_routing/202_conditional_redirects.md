#202 Conditional Redirects

we redirect after we click the submit btn

NewPost.js

```js
import {Redirect} from 'react-router-dom';
```

if we do that

```js
    render () {
        return (
            <div className="NewPost">
                <Redirect to="posts" />
```

we redirect when we click new post, we can't see the form

therefore we need to render redirect conditionally

```js
class NewPost extends Component {
    state = {
        title: '',
        content: '',
        author: 'Max',
        submitted: false
    }
```

we set this to true, when we've made the http request

```js
axios.post('/posts', post)
    .then(response => {
        console.log(response);
        this.setState({submitted: true});
    });
```

```js
    render () {
        let redirect = null;

        if (this.state.submitted) {
            redirect = <Redirect to="posts" />
        }

        return (
            <div className="NewPost">
                {redirect}
```





