# 50 rendering content conditionally
```js
<button 
  style={style}
  onClick={() => this.togglePersonsHandler()}
>
  Toggle persons
</button>
```

we need a property in state,
showPersons: false

we can write js, so we wrap the persons div in curly braces, where we can write js

we can't do if () {}

we can just use simple statements, not block statements

```js
<button 
  style={style}
  onClick={this.togglePersonsHandler}
>
  Toggle persons
</button>
{ this.state.showPersons ? 
  <div>
```

: or null

not the best way, leads to confusion if nested if-statements

```js
  togglePersonsHandler = () => {
    console.log("this.state.showPersons");
    console.log(this.state.showPersons);
    let doesShow = this.setState.showPersons;
    this.setState({
      showPersons: !doesShow
    });
    console.log("updated showPersons");
    console.log(this.state.showPersons);
  }
```


