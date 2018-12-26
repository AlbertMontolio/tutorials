#117 Creating a layout component

- layout
  - navigation
  - burguer builder

let's start with the burger builder

src/components
src/containers

containers always with the class keyword

components, functional components, stateless

in components/Layout/Layout.js

src/assets

Layout.js

i want to have two areas

```js
import React from 'react';

const layout = (props) => (
  <div>Toolbar, SideDrawer, Backdrop</div>
  <main>
    {props.children}
  </main>
);
```

this is a wrapper, to the core component we want to display in the screen

we have an error, cuz we have 2 jsx divs, we need to wrap them. 2 solutions

1 - we could return an array, and then each item a key

2 - Aux high order component -> wrap sth

hoc!

src/hoc/Aux.js

```js
const aux = (props) => props.children;
export default aux;
```

Layout.js

```js
import React from 'react';
import Aux from '../../hoc/Aux'

const layout = (props) => (
  <Aux>
    <div>Toolbar, SideDrawer, Backdrop</div>
    <main>
      {props.children}
    </main>
  </Aux>
);

export default layout;
```

in App.js

```js
import React, { Component } from 'react';
import Layout from './components/Layout/Layout'

class App extends Component {
  render() {
    return (
      <div>
        <Layout>
          <p>Test</p>
        </Layout>
      </div>
    );
  }
}

export default App;
```

we don't have pages, let's forget about navi

focus on burger
































