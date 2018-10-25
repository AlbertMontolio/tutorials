what if we want to change the name on our own?

what if we have an input in Person.js?

```js
const person = (props) => {
  return (
    <div>
      <p onClick={props.click}>I'm a {props.name} and i am {props.age} years old!</p>
      <p>{props.children}</p>
      <input type="text" />
    </div>
  )
}
```

we can listen to an espcial event, onChange

```js
<input type="text" onChange={}/>
```

let's add a new method in App.js

```js
nameChangedHandler = (event) => {
  this.setState({
    persons: [
      { name: 'Max', age: 28 },
      { name: 'Manu', age: 29 },
      { name: 'Vero', age: 99 }
    ]
  })
}
```

so manu will change his name

we will get an event, target, and will have a value

```js
nameChangedHandler = (event) => {
  this.setState({
    persons: [
      { name: 'Max', age: 28 },
      { name: event.target.value, age: 29 },
      { name: 'Vero', age: 99 }
    ]
  })
}
```

we need to pass this method to a component

if i want to have access from it

App.js

in the second person, manu

```js
<Person
  name={this.state.persons[1].name}
  age={this.state.persons[1].age}
  click={this.switchNameHandler.bind(this, "Berta")}
  changed={this.nameChangedHandler}
>
```

inside the Person.js, i have access to this property and pass the reference

```js
return (
  <div>
    <p onClick={props.click}>I'm a {props.name} and i am {props.age} years old!</p>
    <p>{props.children}</p>
    <input type="text" onChange={props.changed} />
  </div>
)
```

just the second input works, as expected


it would be nice, to see the current value of the name, in the input, from the beginning

so, we want two way binding

to do this, i can do


```html
<input type="text" onChange={props.changed} value={props.name} />
```

we have a warning

```js
index.js:1452 Warning: Failed prop type: You provided a `value` prop to a form field without an `onChange` handler. This will render a read-only field. If the field should be mutable use `defaultValue`. Otherwise, set either `onChange` or `readOnly`.
```

we need a onChange, if we set the value, otherwise we lock the input!




















