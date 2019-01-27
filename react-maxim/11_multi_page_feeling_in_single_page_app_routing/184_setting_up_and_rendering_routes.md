#184 Setting up and rendering routes

Blog.js

```js
import {Route} from 'react-router-dom';
```

```js
return (
    <div className="Blog">
        <header>
            <nav>
                <ul>
                    <li><a href="/">Home</a></li>
                    <li><a href="/new-post">New Post</a></li>
                </ul>
            </nav>
        </header>
        <Posts />
    </div>
    <Route />
);
```

```js
<Route path="/" render={() => <h1>Home</h1>} />
```

react checks if your current path starts with the path /

that means, /new-post, we also see home

to overwrite this behaviour, we use exact

Route it replaces itself with the content you define in render method

we don't want to load jsx, we want to load a component




