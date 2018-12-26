#118 Starting Implementation of the Burger Builder Container

containers/BurgerBuilder/BurgerBuilder.js

with class, we need to manage state!

```js
import React, {Component} from 'react';

class BurgerBuilder extends Component {
  render() {
    return ();
  }
}
```

what do we return? it will grow...

render two different things

```js
import React, {Component} from 'react';
import Aux from '../../hoc/Aux';

class BurgerBuilder extends Component {
  render() {
    return (
      <Aux>
        <div>Burger</div>
        <div>Build controls</div>
      </Aux>
    );
  }
}
export default BurgerBuilder;
```

in App.js

```js
return (
  <div>
    <Layout>
      <BurgerBuilder></BurgerBuilder>
    </Layout>
  </div>
);
```

Layout.css

```js
.Content {
  margin-top: 16px;
  background-color: rgb(200,200,200);
}
```

Layout.js

```js
import classes from './Layout.css';

const layout = (props) => (
  <Aux>
    <div>Toolbar, SideDrawer, Backdrop</div>
    <main className={classes.Content}>
```



















