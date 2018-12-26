#92 Performance gains with pureComponents

ìn App.js

```js
<button onClick={() => {this.setState({showPersons: true})}}>Show Persons</button>
```

no toggling

in App.js

```js
shouldComponentUpdate (nextProps, nextState) {
  return true;
}
```

in Person.js

```js
shouldComponentUpdate (nextProps, nextState) {
  return true;
}
```

if we click show persons, we display them.

but if we click again, we don't win anything, but react goes through the whole lifecycles.

react didn't re render the dom.

devtools, options, more tools, rendering, turn on paint flashing

areas that need to be repainting

this is inefficient, going through all the render methods, although nothing changed



```js
shouldComponentUpdate (nextProps, nextState) {
return nextProps.persons !== this.props.persons;
}
```

you can check all the props. if no property changes.

now we don't render the children etc.

we can do the same in App.js
check if sth changed
```js
nextState.persons 1== this.state.persons
```

if we don't want to do this manually,

we can use

```js
import React, { PureComponent } from 'react';
```

it has this checks internally

don't use purecomponent eveywhere

just at top positions

just some strategically places

we need to understand how react updates things















