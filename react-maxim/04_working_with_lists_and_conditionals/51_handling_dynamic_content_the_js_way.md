# 51 handling dynamic content the js way

remove the curly braces and ternary expression

Persons are rendered all the time

everything is js

jsx, we return the js, but we write html

when react renders sth in the screen, the whole render() method is executed. not only the return

```js
let persons = null;

if (this.state.showPersons) {
  persons = (
    <div>
      <Person 
        name={this.state.persons[0].name} 
        age={this.state.persons[0].age}
      >
      </Person>
      <Person 
        name={this.state.persons[1].name} 
        age={this.state.persons[1].age}
        click={this.switchNameHandler.bind(this, "Berta")}
        changed={this.nameChangedHandler}
      >
        Hobbies: Racing
      </Person>
      <Person 
        name={this.state.persons[2].name} 
        age={this.state.persons[2].age}
      >
      </Person>
    </div>
  )
}
```

we can refer to persons in our jsx code inside return

```js
{ persons }
```
