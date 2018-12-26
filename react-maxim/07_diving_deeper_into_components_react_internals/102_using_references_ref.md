#104 Using references ("ref")

we want to get one particular input of the person inputs

we use the componentDidMount

we want to focus on an input

we can add a special attribute: reference

this is known by react
takes as a value an arrow function

refs are only available in stateful components

```js
render () {
  return (
    <Aux>
      <p onClick={this.props.click}>I'm a {this.props.name} and i am {this.props.age} years old!</p>
      <p>{this.props.children}</p>
      <input 
        ref={(inp) => {this.inputElement}}
        onChange={this.props.changed} 
        value={this.props.name} 
      />
    </Aux>
  )
}
```

this.inputElement, the name that you want

this creates a new property for the Person class, we can call it when the render runs

componentDidMount is executed after render

we need to assign a value to this property

```js
ref={(inp) => {this.inputElement = inp}}
```

```js
  componentDidMount () {
    console.log("componentDidMount");
    this.inputElement.focus();
  }
```

the last input is focused

if we want to pass the position

in Persons.js

```js
position={index}
```

Person.js

```js
  componentDidMount () {
    console.log("componentDidMount");
    if (this.props.position === 0) {
      this.inputElement.focus();
    }
  }
```


don't go crazy with ref, don't do

```js
this.inputElement.style etc.
```

























