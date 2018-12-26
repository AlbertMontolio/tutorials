# 63 Setting class names dynamically

change class if we have less than 3 names
in a paragraph

App.css

```js

.red {
  color: red;
}

.bold {
  font-weight: bold;
}
```

they are available globally

let's style a p dynamically depending on conditions

```html
<p>This is workingg</p>
```

```js
let classes = ['red', 'bold'].join(" ");

  return (
    <div className="App">
```

```js
<p className={classes}>This is workingg</p>
```

now with conditions

```js
 const classes = [];
    if (this.state.persons.length <= 2) {
      classes.push("red");
    }
    if (this.state.persons.length <= 1) {
      classes.push("bold");
    }

    return (
      <div className="App">
        <h1>hi i am a react app</h1>

        <p className={classes.join(" ")}>This is workingg</p>
```










