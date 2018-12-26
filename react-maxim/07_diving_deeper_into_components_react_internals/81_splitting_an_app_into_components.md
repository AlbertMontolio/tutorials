#83 Splitting an app into components

Persons.js can be a functinal component, cuz i don't need to manage state

in arrow function, you can ommit curly braces and return if you just have one body line

```js
import React from 'react';
import Person from './Person/Person.js'

const persons = (props) => {
  props.persons.map((person, index) => {
    return <ErrorBoundary key={person.id}><Person
      click={() => this.deletePersonHandler(index)}
      name={person.name} 
      age={person.age}
      changed={(event) => this.nameChangedHandler(event, person.id)}
    /></ErrorBoundary>
  })
}

export default persons;
```

methods don't work, we don't have them, we don't have a class anylonger

we will pass properties

```js
return <ErrorBoundary key={person.id}><Person
      click={() => props.clicked(index)}
      name={person.name} 
      age={person.age}
      changed={(event) => props.changed(event, person.id)}
    /></ErrorBoundary>
```

in Cockpit.js

```js
import Persons from '../components/Persons/Persons.js';
```

we need to pass the props: persons, clicked and changed

in the render:

```js
if (this.state.showPersons) {
  persons = (
    <div>
      <Persons 
        persons={this.state.persons}
        clicked={this.deletePersonHandler}
        changed={this.nameChangedHandler}
      />
    </div>
  )
  btnClass = classes.Red;
}
```

don't forget the return in Person.js

Cockpit.js

functional component, it does not need to manage its own state

we need to wrap our cockpit in a div

```js
import React from 'react';

const cockpit = (props) => {
  return (
    <div>
      <h1>hi i am a react app</h1>
      <p className={assignedClasses.join(" ")}>This is workingg</p>
      <button
        className={btnClass}
        onClick={this.togglePersonsHandler}
      >
        Toggle persons
      </button>
    </div>
  );
}

export default cockpit;
```

assignedClasses and btnClass not working

we need Cockpit.css for the classes

```js
.red {
  color: red;
}

.bold {
  font-weight: bold;
}

.Cockpit button {
  border: 1px solid blue;
  padding: 16px;
  background-color: green;
  font: inherit;
}

.Cockpit button:hover {
  background-color: lightgreen;
  color: black;
}

.Cockpit button.Red {
  background-color: red;
}

.Cockpit button.Red:hover {
  background-color: salmon;
  color: black;
}
```

Cockpit.js

```js
import classes from './Cockpit.css';
```

with that we can use classes again

```js
return (
  <div className={classes.Cockpit}>
    <h1>hi i am a react app</h1>
```

now we have an App.js file with a cockpit and a persons array component

and the handlers, that manipulate the state


































