#54 lists states

Person component

Person.js
we have a click listener in p

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

we have a click prop, so we need to pass the click prop

```js
return <Person
  click={this.deletePersonHandler}
  name={person.name} 
  age={person.age}/>
```

i want to delete the person that i click, so i need to know which person it is

the map method has a second argument

```js
<div>
  {this.state.persons.map((person, index) => {
    return <Person
      click={() => this.deletePersonHandler(index)}
      name={person.name} 
      age={person.age}/>
  })}
</div>
```

with arrow function we can pass param. alternative would be with bind

```js
deletePersonHandler = (personIndex) => {
  const persons = this.state.persons;
  persons.splice(personIndex, 1);
  this.setState({persons: persons});
}
```

 this approach has a flaw



