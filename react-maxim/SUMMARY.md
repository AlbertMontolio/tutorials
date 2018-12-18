create react app:

```js
npm init react-app my-app
```

run development server:

```js
npm start
```

first react component

```js
import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

class App extends Component {
  render() {
    return (
      <div className="App">
        <h1>hi i am a react app</h1>
      </div>
    );
  }
}

export default App;
```

every component needs to render some html (actually, return jsx)

# Dynamic content

```js
import React from 'react';

const person = () => {
  return <p>I'm a Person and i am {Math.floor(Math.random()*30)} years old!</p>
}

export default person;
```

# props

```js
<Person name="Albert" age="32"></Person>
```

```js
const person = (props) => {
  return <p>I'm a {props.name} and i am {props.age} years old!</p>
}
```

it works, but, when using class-based components, we should use

```js
class Person extends Component {
  render () {
    return <p>My name is {this.props}</p>;
  }
}
```

# props.children

```js
<Person name="Carina" age="29">Hobbies: Racing</Person>
```

```js
const person = (props) => {
  return (
    <div>
      <p>I'm a {props.name} and i am {props.age} years old!</p>
      <p>{props.children}</p>
    </div>
  )
}
```

# State

this just works for components created by extends

```js
class App extends Component {

  state

  render() {
  }
```

state is managed from inside a component (not like props, defined by the outside)

```js
state = {
  persons: [
    { name: 'Max', age: 28 },
    { name: 'Manu', age: 29 },
    { name: 'Vero', age: 34 }
  ]
}
```

we can access a property like state, in our render method, curly braces, this

this referes to the class.

state is a keyword, is a special property


```js
<Person name={this.state.persons[0].name} age="32"></Person>
```

state is a property. is a special property.

state can be changed, if it changes, it will lead react to re render our dom, update our dom

Whilst props allow you to pass data down the component tree (and hence trigger an UI update), state is used to change the component, well, state from within. Changes to state also trigger an UI update.

// state can only be accessed in class-based components!

```js
class NewPost extends Component { // state can only be accessed in class-based components!
    state = {
        counter: 1
    };

    render () { // Needs to be implemented in class-based components! Needs to return some JSX!
        return (
            <div>{this.state.counter}</div>
        );
    }
}
```

Whenever state  changes (taught over the next lectures), the component will re-render and reflect the new state. The difference to props  is, that this happens within one and the same component - you don't receive new data (props ) from outside!

```js
switchNameHandler = () => {
  console.log("was clicked!");
}
```

in button

```js
<button onClick={this.switchNameHandler}>Switch name</button>
```

# Manipulating the state

```js
switchNameHandler = () => {
  // console.log("was clicked!");
  this.state.persons[0] = 'Jose';
}
```

it will merge what we define here, with the existing data

```js
state = {
  persons: [
    { name: 'Albert', age: 28 },
    { name: 'Manu', age: 29 },
    { name: 'Vero', age: 34 }
  ],
  otherState: 'other values'
}
```

```js
this.setState({
  persons: [
    { name: 'Jose', age: 28 },
    { name: 'Manu', age: 29 },
    { name: 'Vero', age: 99 }
  ]
})
```

# Functional stateless vs class stateful components

when creating a component as a function, we cant use state in there

its just a function

we dont have any class extends Component

still, we prefere to use const person = ()

why is so important?

because this functions, that just receive props, are very clear at what they do

# Passing method references between components

let's say we want to call this switchNameHandler from another file

```js
<Person
  name={this.state.persons[1].name}
  age={this.state.persons[1].age}
  click={this.switchNameHandler}
>
  Hobbies: Racing

</Person>
```

Person.js
```js
<p onClick={props.click}>I'm a {props.name} and i am {props.age} years old!</p>
```

maybe we also want to pass a value to our function

# Css

```js
import './App.css'
```
































