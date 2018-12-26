# 69 Adding Pseudo Selectors

we remove the inline style in our btn

```js
<button 
  onClick={this.togglePersonsHandler}
>
  Toggle persons
</button>
```

App.css

```js
.App button {
  border: 1px solid blue;
  padding: 16px;
  background-color: green;
  font: inherit;
}

.App button:hover {
  background-color: green;
  color: red;
}

.App button.Red {
  background-color: red;
}

.App button.Red:hover {
  background-color: salmon;
  color: black;
}
```

now we need to add the red class dynamically

we do this in the render function

```js
  render() {
    let persons = null;
    let btnClass = '';

    if (this.state.showPersons) {
```

inside if statement

```js
btnClass = classes.Red;
```

```js
<button
  className={btnClass}
  onClick={this.togglePersonsHandler}
>
  Toggle persons
</button>
```

we have an overall classes object

















