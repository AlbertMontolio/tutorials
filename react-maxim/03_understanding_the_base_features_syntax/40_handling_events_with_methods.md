with state we just accessed data

lets add onClick on the button

in js is onclick

in jsx is onClick

```js
<button onClick={}>Switch name</button>
```

typically we handle functions

```js
switchNameHandler
```


you typically use handler, its an method that you don't call, but you are assigning as a handler

after state

```js
switchNameHandler = () => {
  console.log("was clicked!");
}
```
this is a property that holds a function

we want to add my state, but lets console log first

in button

```js
<button onClick={this.switchNameHandler}>Switch name</button>
```

don't add parenthesis!

this would execute it immediately, once react renderes the dom. we only want to pass a reference

if you don't use es6, and you use function() and you use this inside the function, will cause errors, cuz this does not refer any more to the Class

button is working if i click

that's nice, let's also change the state


















