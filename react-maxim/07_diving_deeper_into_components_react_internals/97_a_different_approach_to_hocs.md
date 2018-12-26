#99 A different approach to HOCs

we can do 

hoc/withClass.js

this function does not take props, but some config

```js
import React from 'react';

const withClass = (WrappedComponent, className) => {
  return (props) => (
    <div className={className}>
      <WrappedComponent />
    </div>
  )
}

export default withClass;
```

what we return is a react function

the idea is
we have valid jsx code. we can use this a bit differently

App.js

we use Aux

we import withClass, lowercase, cuz it's not a component! 

it does not return jsx, it returns a function!

```js
import Aux from '../hoc/Aux.js';
import withClass from '../hoc/withClass';
```


i wrapp the app with the withClass function

```js
    return (
      <Aux>
        <Cockpit 
          showPersons={this.state.showPersons} 
          persons={this.state.persons}
          clicked={this.togglePersonsHandler}
        />
        {persons}
      </Aux>
    );
  }
}

export default withClass(App, classes.App);
```

Person.js

withClass

```js
import React, {Component} from 'react';
import withClass from '../../../hoc/withClass';
import Aux from '../../../hoc/Aux';

import classes from './Person.css';

class Person extends Component {
  render () {
    return (
      <Aux>
        <p onClick={this.props.click}>I'm a {this.props.name} and i am {this.props.age} years old!</p>
        <p>{this.props.children}</p>
        <input onChange={this.props.changed} value={this.props.name} />
      </Aux>
    )
  }
}

export default withClass(Person, classes.Person);
```

the props are missing!

name etc.

never change state or properties of the WrappedComponent






























