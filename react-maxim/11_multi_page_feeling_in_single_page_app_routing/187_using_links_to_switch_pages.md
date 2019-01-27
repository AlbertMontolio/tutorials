#187 Using Links to Switch Pages

```js
import {Route, Link} from 'react-router-dom';
```

```js
<li><Link to="/">Home</Link></li>
```

with Link, react prevents the default behaviou of an a tag, which is making the request

```js
<li><Link to="/">Home</Link></li>
<li><Link to={{
    pathname="/new-post",
    hash: '#submit',
    search: '?quick-submit=true'
}}>New Post</Link></li>
```

now we are not loading the same page again

we don't lose our state



