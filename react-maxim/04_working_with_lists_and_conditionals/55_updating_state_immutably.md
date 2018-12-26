#55 updating state immutably

in js, objects & arrays are reference types

when i do const persons, i get a pointer, to the original object

it works, but it's bad practice

good practice is to create a copy of the array

we can do that with the slice method

we can also use the spread operator

```js
deletePersonHandler = (personIndex) => {
  // const persons = this.state.persons.slice();
  const persons = [...this.state.persons]
  persons.splice(personIndex, 1);
  this.setState({persons: persons});
}
```




