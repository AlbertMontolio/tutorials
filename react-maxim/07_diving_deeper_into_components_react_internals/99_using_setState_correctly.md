#101 Using setState correctly

we call it a lot in our App.js

```js
  deletePersonHandler = (personIndex) => {
    const persons = [...this.state.persons]
    persons.splice(personIndex, 1);
    this.setState({persons: persons});
  }
```

let's add a counter on how often we clicked the toggle btn

in our state

```js
state = {
    persons: [
      { id: 1, name: 'Albert', age: 28 },
      { id: 2, name: 'Manu', age: 29 },
      { id: 3, name: 'Vero', age: 34 }
    ],
    otherState: 'other values',
    showPersons: false,
    toggleClicked: 0
  }
```

```js
  togglePersonsHandler = () => {
    const doesShow = this.setState.showPersons;
    this.setState({
      showPersons: !this.state.showPersons,
      toggleClicked: this.state.toggleClicked + 1
    });
  }
```

it works, but this is incorrect

setState is a method executed asynchronusly by react

you can rely on this.state, to really reflect the last state

if you call setState in another place of your app, this.state may not be correct, the last one

if you plan to call this.setState inside setState, there is a better syntax

setState takes an arrow function, takes two arguments, 

in the function body, you have to return an object which is your updated state

```js
togglePersonsHandler = () => {
    const doesShow = this.setState.showPersons;
    this.setState((prevState, props) => {
      return {
        showPersons: !prevState.showPersons,
        toggleClicked: prevState.toggleClicked + 1
      }
    });
  }
```

setState can not be changed while being executed

best way of mutating the state, is by using prevState









































