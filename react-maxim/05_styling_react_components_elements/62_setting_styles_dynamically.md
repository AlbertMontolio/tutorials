# 62 Setting styles dynamically

```js
<button 
  style={style}
  onClick={this.togglePersonsHandler}
>
  Toggle persons
</button>
```

```js
const style = {
  backgroundColor: "white",
  font: "inherit",
  border: "1px solid blue",
  padding: "8px"
};
```

everything is js, inside the {}

```js
    if (this.state.showPersons) {

      style.backgroundColor = 'red';
    }
```



