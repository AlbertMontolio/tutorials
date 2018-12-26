#57 flexible lists

```js
const person = (props) => {
  return (
    <div className="Person">
      <p onClick={props.click}>I'm a {props.name} and i am {props.age} years old!</p>
      <p>{props.children}</p>
      <input onChange={props.changed} value={props.name} />
    </div>
  )
}
```

we have the onChange

the changed property needs to point to an event listener or method with the dynamic changes

```js
<div>
  {this.state.persons.map((person, index) => {
    return <Person
      click={() => this.deletePersonHandler(index)}
      name={person.name} 
      age={person.age}
      key={person.id}
      changed={(event) => this.nameChangedHandler(event, person.id)}
    />
  })}
</div>
```

my solution:

```js
  nameChangedHandler = (event, personIndex) => {
    const persons = [...this.state.persons];
    persons[personIndex].name = event.target.value;

    this.setState({
      persons: persons
    });
```

max approach

```js
nameChangedHandler = (event, id) => {
  const personIndex = this.state.persons.findIndex(p => {
    return p.id === id;
  });

  const person = {
    ...this.state.persons[personIndex]
  }
```

 we do the same as with the arrays, the spread operator. we don't want to modify the element pointed, we created a new object

```js
  nameChangedHandler = (event, id) => {
    const personIndex = this.state.persons.findIndex(p => {
      return p.id === id;
    });

    const person = {
      ...this.state.persons[personIndex]
    };

    person.name = event.target.value;

    const persons = [...this.state.persons];
    persons[personIndex] = person;

    this.setState({persons: persons});
  }
```

















