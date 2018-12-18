
let's say we want to call this switchNameHandler

not when clicking the button, but also, when clicking any paragraph inside a person component

Person.js
```js
<p onClick={}>I'm a {props.name} and i am {props.age} years old!</p>
```

but now what? i can not call the method since its in a nother file


in App.js

we can pass a reference to this handler, as a property, to our component

restructure

```js
<Person
  name={this.state.persons[1].name}
  age={this.state.persons[1].age}
  click={this.switchNameHandler}
>
  Hobbies: Racing

</Person>
```

passing the reference of a method to the click property

now in my component, i can just use props and the name of the property

Person.js
```js
<p onClick={props.click}>I'm a {props.name} and i am {props.age} years old!</p>
```

if we click the paragraph, stuff changes

we can pass methods as props, so that we can call methods that may change the state

in a compnent that has no access to the state

maybe we also want to pass a value to our function

now i want to

```js
switchNameHandler = (newName) => {
  console.log("was clicked!");
  // this.state.persons[0] = 'Jose';
  this.setState({
    persons: [
      { name: newName, age: 28 },
      { name: 'Manu', age: 29 },
      { name: 'Vero', age: 99 }
    ]
  })
}
```

how do I pass this data?

two ways of doing that

1 with bind

call bind(this) this controls what this

```js
THIS.setState({
```

inside the function will referer to, and binding it to

```js
<button onClick={this.switchNameHandler.bind(THIS)}>Switch name</button>
```

the THIS.
we can use this syntax, cuz we want to pass more arguments to our functions. here should pass the name

```js
<button onClick={this.switchNameHandler.bind(this, "Rigoberto")}>Switch name</button>
```

and

```js
<Person
  name={this.state.persons[1].name}
  age={this.state.persons[1].age}
  click={this.switchNameHandler.bind(this, "Berta")}
>
```

so that when we click also the paragraph, it also changes

all works

2 alternative syntax

on onClick, i can execute an arrow function

which takes no arguments, but it receives an event object. as a function body has the the switchNameHandler CALL

```js
<button onClick={() => this.switchNameHandler()}>Switch name</button>
```

using arrow function, we have a return implicitely

if its in on line, so this gets return, we return a function call

we said that we shouldn call functions.

but in this case, its not being executed. instead, we are passing an anonymous function

which will be executed whenver we click, and will return the result of the function

this is useful, cuz we can easily pass our data


```js
<button onClick={() => this.switchNameHandler('Gustavo')}>Switch name</button>
```

this is not very efficient, react can not re render a lot of stuff in the dom, better use the binding stratgy



he complains cuz the other inputs are not great

we will improve that






























