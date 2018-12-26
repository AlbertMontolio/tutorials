#76 Using error boundaries

let's force an error

```js
const person = (props) => {

  const rnd = Math.random();

  if (rnd > 0.7) {
    throw new Error('Something went wrong');
  }
```

catch the error and handle it graceously

we add a new component

ErrorBoundary, in src

```js
import React, {Component} from 'react';

class ErrorBoundary extends Component {
  render() {
    return <h1>Something went wrongg</h1>
  }
}
```

if you use state, component should be a class

```js
import React, {Component} from 'react';

class ErrorBoundary extends Component {

  state = {
    hasError: false,
    errorMessage: ''
  }

  // react method, raises when errorboundary is raised
  componentDidCatch = (error, info) => {
    this.setState({hasError: true, errorMessage: error});
  }

  render() {

    if (this.state.hasError) {
      return <h1>{this.state.errorMessage}</h1>
    } else {
      return this.props.children;
    }

    
  }
}

export default ErrorBoundary;
```

let's use it in the App.js

```js
import ErrorBoundary from './ErrorBoundary/ErrorBoundary.js'
```

we wrap Person component with ErrorBoundary, which is a high level component

```js
if (this.state.showPersons) {
  persons = (
    <div>
      {this.state.persons.map((person, index) => {
        return <ErrorBoundary><Person
          click={() => this.deletePersonHandler(index)}
          name={person.name} 
          age={person.age}
          key={person.id}
          changed={(event) => this.nameChangedHandler(event, person.id)}
        /></ErrorBoundary>
      })}
    </div>
  )
  btnClass = classes.Red;
}
```

we have to move the key to ErrorBoundary, cuz this is now the outter element

we still see the error, but in production mode we will see the custom component

only wrap components for cases that code may fail, like api calls

















