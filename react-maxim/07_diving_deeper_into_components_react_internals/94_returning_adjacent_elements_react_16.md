#96 Returning adjacent elements (16+)

our compnents, they have typically a div wrapping

if we return an array, then is ok

```js
class Person extends Component {
  render () {
    return (
      <div className={classes.Person}>
        <p onClick={this.props.click}>I'm a {this.props.name} and i am {this.props.age} years old!</p>
        <p>{this.props.children}</p>
        <input onChange={this.props.changed} value={this.props.name} />
      </div>
    )
  }
}
```

here the array:

```js
    return [
      <p onClick={this.props.click}>I'm a {this.props.name} and i am {this.props.age} years old!</p>,
      <p>{this.props.children}</p>,
      <input onChange={this.props.changed} value={this.props.name} />
    ]
```

but we need to key it
otherwise we get the old warning key

key="1"

not very useful this example

Cockpit.css

We could create our Button class, instead of App button

now we don't need the style in the div, so we want to get rid of the div

we can use hoc
higher order component for that

src/hoc
normal real components. they are not representatinal, they wrap other components, to add another functionality

```js
return (
  <div>
    <h1>hi i am a react app</h1>
    <p className={assignedClasses.join(" ")}>This is workingg</p>
    <button
      className={btnClass}
      onClick={props.clicked}
    >
      Toggle persons
    </button>
  </div>
);
```

we create Aux.js

returns what's beeing passed between the opening and closing tag

```js
import React from 'react';

const aux = (props) => props.children;

export default aux;
```

now we can use this in the cockpit component

Cockpit.js

```js
import Aux from '../../hoc/Aux.js'
```

now

```js
return (
    <Aux>
      <h1>hi i am a react app</h1>
      <p className={assignedClasses.join(" ")}>This is workingg</p>
      <button
        className={btnClass}
        onClick={props.clicked}
      >
        Toggle persons
      </button>
    </Aux>
  );
```

but we have this extra element


















