#86 converting stateless to stateful components

if we want access to a lifecycle method, we need stateful components

Persons.js

```js
import React, {Component} from 'react';
import Person from './Person/Person.js'

class Persons extends Component {
  render () {
    return this.props.persons.map((person, index) => {
      return <Person
        click={() => this.props.clicked(index)}
        name={person.name} 
        age={person.age}
        key={person.id}
        changed={(event) => this.props.changed(event, person.id)}
      />
    })
  }
}

export default Persons;
```

now we have stateful

Person.js

```js
import React, {Component} from 'react';

import classes from './Person.css';

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

export default Person;
```

















