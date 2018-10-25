# 30 understanding jsx

```js
return React.createElement()
```

takes 3 arguments

element we want to render to the dom

configuration for this, a js object, we can pas null

any amount of children, multiple arguments

what is nested in this div

```js
class App extends Component {
  render() {
    // return (
    //   <div className="App">
    //     <h1>hi i am a react app</h1>
    //   </div>
    // );
  }
}
```

```js
return React.createElement('div', null, 'h1', 'Hi, i am a react appppp');
```

we see this in the browser:

```js
h1Hi, i am a react appppp
```

inspect in the terminal

two text nodes

h1 is interpreted as text, not as element

if we want to insert a new element inside div, again React.creteElement

```js
return React.createElement('div', null, React.createElement('h1', null, 'i am a react blabla'));
```

we dont see the css style

we dont see the class added

we can do it in the argument configuration

```js
return React.createElement('div', {className: 'App'}, React.createElement('h1', null, 'i am a react blabla'));
```

the code that we wrote with this react line, is the same as the jsx code

the jsx is compile to this React.create

the import React import enables
































