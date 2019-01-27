#181 Setting up the router package

```js
npm install --save react-router react-router-dom
```

the first has the logic

we want to load just one post

or all the posts

in Block.js, we delete FullPost and NewPost

we need to enable routing

we need to wrap the part of the app with a component that we import from the react-router library

App.js

```js
import {BrowserRouter} from 'react-router-dom';
```

```js
render() {
  return (
    <BrowserRouter>
        <div className="App">
          <Blog />
        </div>
      </BrowserRouter>
    );
  }
```

inside Blog component, i want to use routing

here: 

```js
<section>
    {posts}
</section>
```

this should be a custom component

Blog/FullPost
Blog/NewPost

Blog/Posts/Posts.js





