#207 Lazy Loading with React Suspense

just for react 16.6

new way of lazy loading your rote

new project

react lazy allows to load components asynchronously

the code behind it is loaded when components are really needed, when they are rendered!

this is not only important for routing. also useful for if statements

App.js

```js
import { BrowserRouter, Route, NavLink } from 'react-router-dom';
```

```js
<BrowserRouter>
  <React.Fragment>
```

React.Fragment is like Aux, does not create a DOM element, but necessary for wrapping components.

```js
<Route path="/" component={Welcome} exact />
<Route path="/user" component={User} />
<Route path="/posts" component={Posts} />
```

we have 2 pages

now we are loading the code all the time. not efficient.

```js
import Posts from './containers/Posts';
```

we need to use dynamic import

```js
// import Posts from './containers/Posts';
const Posts = React.lazy();
```

we import this component, only when this function runs, and react knows when to do that

```js
const Posts = React.lazy(() => import('./containers/Posts'));
```

```js
<Route path="/posts" render={() => <Suspense><Post /></Suspense>} />
```

```js
<Route path="/posts" render={() => 
    <Suspense fallback={<div>Loading...</div>}>
      <Post />
    </Suspense>} />
```

we could use this without routing, but with if statements

```js
// import Posts from './containers/Posts';
const Posts = React.lazy(() => import('./containers/Posts'));

class App extends Component {

  state = {showPosts: false};

  modeHandler = () => {
    this.setState(prevState => {
      return {showPosts: !prevState.showPosts}
    })
  }

  render() {
    return (
      <React.Fragment>
        <button onClick={this.modeHandler}>Toggle mode</button>
        { this.state.showPosts ? (<Suspense fallback={<div>Loading...</div>}>
            <Posts />
          </Suspense>
        ) : <User /> }
      </React.Fragment>
```






