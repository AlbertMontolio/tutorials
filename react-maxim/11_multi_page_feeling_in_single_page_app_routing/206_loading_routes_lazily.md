#206 Loading Routes Lazily

```js
class Blog extends Component {

    state = {
        auth: true
    }
```

developer tool chrome, network

we load the bundle.js

this contains all our source code

loading all the bundle can be bad, if it's too big

if we are in posts, and the user never visits new post, why do we want the code for that?

NewPost component should be loaded only if user navigates to /new-post

better is to not downloaded, just when needed

the tecnique of loading only what you need is called code splitting or lazy loading

this technique works for react-router 4
and for create-react-app

src/hoc/asyncComponent.js

this component should help me to load a component asynchronously

importComponent should be a function reference

```js
import React, {Component} from 'react';
const asyncComponent = (importComponent) => {
  return class extends Component {
    state = {
      component: null
    }

    componentDidMount () {

    }

    render () {

    }
  }
}
```

```js
componentDidMount () {
  importComponent()
    .then(cmp => {
      this.setState({component: cmp.default});
    });
}
```

```js
import React, {Component} from 'react';
const asyncComponent = (importComponent) => {
  return class extends Component {
    state = {
      component: null
    }

    componentDidMount () {
      importComponent()
        .then(cmp => {
          this.setState({component: cmp.default});
        });
    }

    render () {
      const C = this.state.component;

      return C ? <C {...this.props}/> : null
    }
  }
}

export default asyncComponent;
```

Blog.js

i want to load NewPost dynamically

```js
import NewPost from './NewPost/NewPost';
```

with import, we inform webpack about this dependency, and it will include it in the bundle

webpack needs to prepare some extra bundle to potentially load this extra code

```js
import asyncComponent from '../../hoc/asyncComponent';
// import NewPost from './NewPost/NewPost';
const AsyncNewPost = asyncComponent();
```

this function requires an argument

this argument should be a function, that's why we execute it in componentDidMount

this should be an anonymous function. what do we return?

```js
const AsyncNewPost = asyncComponent(() => {
    return import();
});
```

import() is a dynamic
whatever comes between the () is executed, when the anonymous function is executed

and the function, will be executed, whenever we render AsyncNewPost

```js
const AsyncNewPost = asyncComponent(() => {
    return import('./NewPost/NewPost');
});
```

```js
<Switch>
  {this.state.auth ? <Route path="/new-post" component={AsyncNewPost} /> : null}
```

asyncComponent, returns a component!

now, if we click new Post, we see a new file in network, 1.chunk.js

this is an extra bundle webpack created

webpack detected the dynamic import()

it created an extra bundle with the NewPost component

webpack didn't add it into the main bundle





