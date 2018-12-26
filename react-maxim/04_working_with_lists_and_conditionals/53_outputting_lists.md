#53 outputting lists

in react everything is js
so we handle loops with js loops

we have a js array, but it's not jsx code

```js
if (this.state.showPersons) {
  persons = (
    <div>
      {this.state.persons.map()}
      <Person 
        name={this.state.persons[0].name} 
        age={this.state.persons[0].age}
      >
```

map works on every element.
we use an arrow function, es6

we need to return, what we want to map this item, into

our goal is to return jsx

```js
if (this.state.showPersons) {
  persons = (
    <div>
      {this.state.persons.map(person => {
        return <Person 
          name={person.name} 
          age={person.age}/>
      })}
```

we should assign a key property



