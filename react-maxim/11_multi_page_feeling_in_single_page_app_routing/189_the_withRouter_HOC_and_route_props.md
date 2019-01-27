#189 The "withRouter" HOC & Route Props

props we can output

what if we want to get props in a container, which had a route

Post.js

if we console.log the props, we don't see the routing props, we can't pass them down to the tree.

we see title, etc. but not match, history etc.

if we want to use the routing props in Post.js, we can pass them in

in Posts.js

```js
return <Post 
  key={post.id} 
  title={post.title} 
  author={post.author}
  {...this.props}
  clicked={() => this.postSelectedHandler(post.id)}
/>
```

this way, we pass all the props

or, we can use a hoc on the Post component

```js
import {withRouter} from 'react-router-dom';
```

```js
import React from 'react';
import {withRouter} from 'react-router-dom';

import './Post.css';

const post = (props) => {
    console.log(props);
    return (
        <article className="Post" onClick={props.clicked}>
            <h1>{props.title}</h1>
            <div className="Info">
                <div className="Author">{props.author}</div>
            </div>
        </article>
    );
};

export default withRouter(post);
```

now we see history, location and match property

withRouter makes the component route aware.







