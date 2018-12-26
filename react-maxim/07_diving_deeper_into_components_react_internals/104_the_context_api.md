#106 The context API (React 16.3)

passing global state within your app

in the Cockpit.js, we add a new btn

````js
<Aux>
  <h1>hi i am a react app</h1>
  <p className={assignedClasses.join(" ")}>This is workingg</p>
  <button
    className={btnClass}
    onClick={props.clicked}
  >
    Toggle persons
  </button>
  <button>Log in</button>
</Aux>
```

this button should change some global state to true, and change stuff in components

in App.js

```js
return (
  <Aux>
    <Cockpit 
      showPersons={this.state.showPersons} 
      persons={this.state.persons}
      clicked={this.togglePersonsHandler}
      login={this.loginHandler}
    />
    {persons}
  </Aux>
);
```

```js
  loginHandler = () => {
    
  }
```

i want to change the state of authentication

```js
  state = {
    persons: [
      { id: 1, name: 'Albert', age: 28 },
      { id: 2, name: 'Manu', age: 29 },
      { id: 3, name: 'Vero', age: 34 }
    ],
    otherState: 'other values',
    showPersons: false,
    toggleClicked: 0,
    authenticated: false
  }
```

```js
  loginHandler = () => {
    this.setState({authenticated: true});
  }
```

let's pass this info to Persons

```js
persons = (
  <div>
    <Persons 
      persons={this.state.persons}
      clicked={this.deletePersonHandler}
      changed={this.nameChangedHandler}
      isAuthenticated={this.state.authenticated}
    />
  </div>
)
```

Person.js

```js
return this.props.persons.map((person, index) => {
  return <Person
    click={() => this.props.clicked(index)}
    position={index}
    name={person.name} 
    age={person.age}
    key={person.id}
    ref={this.lastPersonRef}
    changed={(event) => this.props.changed(event, person.id)}
    authenticated={this.props.isAuthenticated}
  />
})
```

Person.js

```js
render () {
  return (
    <Aux>
      {this.props.authenticated ? <p>I'm authenticated</p> : null}
```

working!

we are passing global information around

passing down info, it's ok

but we can use the context API to make things easier

in the App.js we create context, outside the class

in App.js

```js
import withClass from '../hoc/withClass';

const AuthContext = React.createContext(false);

class App extends PureComponent {
```

how do we use that?

```js
<AuthContext.Provider>
  {persons}
</AuthContext.Provider>
```

what about the value? is false, but we want to make it dynamically

this value can change so

```js
<AuthContext.Provider
  value={this.state.authenticated}
>
  {persons}
</AuthContext.Provider>
```

in the Persons component

we get rid of authenticated

in App.js, in Persons compnent, get rid of isAuthenticated

Person.js

here we want to use our context

in App.js we need to export it

```js
export const AuthContext = React.createContext(false);
```

Person.js

```js
import {AuthContext} from '../../../containers/App';
```

```js
render () {
  return (
    <Aux>
      <AuthContext.consumer>
        {this.props.authenticated ? <p>I'm authenticated</p> : null}
      </AuthContext.consumer>
```

we need to pass a function

```js
  render () {
    return (
      <Aux>
        <AuthContext.consumer>
          {auth => auth ? <p>I'm authenticated</p> : null}
        </AuthContext.consumer>
```

we can pass info without the chain of props









































































