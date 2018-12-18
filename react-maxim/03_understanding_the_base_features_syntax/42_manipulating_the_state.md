manipulate the state upon a click

```js
switchNameHandler = () => {
  // console.log("was clicked!");
  this.state.persons[0] = 'Jose';
}
```

nothing happens if i click

we have a warning

```js
  Line 18:  Do not mutate state directly. Use setState()  react/no-direct-mutation-state
```

don't do what we did

use a special react method

this method comes from the react library

```js
this.setState()
```


makes sure that react knows about the change and updates the dom

```js
this.setState({})
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

we change a name and an age

react will look at our state

see which part of it we are changing, it will not discard otherState, it will update persons

react updates the dom! changing state, and props

react watches for state and props



















