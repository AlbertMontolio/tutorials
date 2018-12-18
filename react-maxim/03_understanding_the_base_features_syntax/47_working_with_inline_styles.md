let's style the button differently

```js
<button onClick={() => this.switchNameHandler('Gustavo')}>Switch name</button>
```

```js
render() {

    const style = {
      backgroundColor: "white",
      font: "inherit",
      border: "1px solid blue",
      padding: "8px",
      cursor: pointer
    };

    return (
      <div className="App">
        <h1>hi i am a react app</h1>
        <p>This is workingg</p>
        <button
          style={style}
          onClick={() => this.switchNameHandler('Gustavo')}>Switch name</button>
        <Person
```

hover is difficult with inline styling.

better in App.css

