
sometimes you want to change info inside the component

in App.js

add a button, if we click it, swiches one of the names

we need to define this names in a non-hard-coded way

we have the class App

a class has a property

in normal js code

```js
var something = someValue
```

in a class

```js
something = "some value"
```

there is one special property in a component (class extends Component)
(you can not do it in the Person.js, since person.js does not extends Component, it's just a normal function const person = (props))

this just works for components created by extends

```js
class App extends Component {

  state

  render() {
```

state is managed from inside a component (not like props, defined by the outside)

we should create components with functions as often as possible (avoid with extends Component), therefore, not use state, because

having state in all of our components, and manipulating it from anywhere of your app, can be dangerous, unpredictable, hard to manage

we assign a js object

the state could have some persons, will be an array, you can put whatever you want

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

let's add the button

```js
render() {
  return (
    <div className="App">
      <h1>hi i am a react app</h1>
      <p>This is workingg</p>
      <button>Switch Name</button>
      <Person name={this.state.persons[0].name} age={this.state.persons[0].age}></Person>
      <Person name={this.state.persons[1].name} age={this.state.persons[1].age}>Hobbies: Racing</Person>
      <Person name={this.state.persons[2].name} age={this.state.persons[2].age}></Person>
    </div>
  );
  // return React.createElement('div', null, React.createElement('h1', null, 'i am a react blabla'));
}
```

state is a property. is a special property.

state can be changed, if it changes, it will lead react to re render our dom, update our dom

if we change the name of Max, the component will be re rendered

we can see this by listening to events, clicking on the button


























