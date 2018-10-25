# writing our first react code

in codepen

html

```html
<div class="person">
  <h1>Max</h1>
  <p>Your age: 28</p>
</div>

<div class="person">
  <h1>Albert</h1>
  <p>Your age: 29</p>
</div>
```


css

```css
.person {
  display: inline-block;
  border: 1px soldi #ccc;
  box-shadow: 0 2px 2px #ccc;
  width: 200px;
  padding: 20px;
}
```

limitation: we are reusing the same html code

every div is a component in react

let's add react

JS

gear icon, download import some external js library

quick-add react

we add react, and react-dom

react is the logic for the components

react-dom is about rendering the comopnents to the react-dom

react uses a lot of next generation features

react uses a special syntax

javascript preprocessor: babel


let's create a react component

JS (babel)

a react component is just a function

```js
function Person() {
  return (
    <div class="person">
      <h1>Max</h1>
      <p>Your age: 28</p>
    </div>
  );
}
```

looks like html, but isn't
this is jsx

this gets compile into js code

this is just a function, we want to convert it to a component

in html

```html
<div id="p1"></div>
```

js

```js
ReactDom.render();
```


this method allows us to render a js funciton as a component, to the real dom

we turn the function into html element
second arg: where to render it

```js
ReactDom.render(<Person />,
document.querySelector('#p1'));
```


change class to class name


```js
function Person() {
  return (
    <div className="person">
      <h1>Max</h1>
      <p>Your age: 28</p>
    </div>
  );
}
```

our compnent got rendered!


if we want a second component:

```html
<div id="p1"></div>
<div id="p2"></div>
```

we can configure components dynamic

write an argument to Person function. concept props

```js
function Person(props) {
  return (
    <div className="person">
      <h1>Max</h1>
      <p>Your age: 28</p>
    </div>
  );
}

ReactDom.render(<Person name="Max" age="28" />,
document.querySelector('#p1'));
```

props contains all the attributes that has my component

```js
function Person(props) {
  return (
    <div className="person">
      <h1>{ props.name }</h1>
      <p>Your age: { props.age }</p>
    </div>
  );
}
```

```js
ReactDom.render(<Person name="Max" age="28" />,
document.querySelector('#p1'));

ReactDom.render(<Person name="Albert" age="31" />,
document.querySelector('#p2'));
```

we could have one div in html

html

```html
<div id="app"></div>
```

```js
var app = {
  <Person name="Max" age="28" />
  <Person name="Manu" age="29" />
}

ReactDom.render(app,
document.querySelector('#app'));
```





































