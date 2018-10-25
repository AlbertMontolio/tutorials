lets put some cards

style components

two ways of styling

add Person.css into our Person

whatever css code i write here

is not scoped to Person component, is global css

```css
.Person {

}
```

in Person.js

```js
return (
  <div className="Person">
    <p onClick={props.click}>I'm a {props.name} and i am {props.age} years old!</p>
    <p>{props.children}</p>
    <input onChange={props.changed} value={props.name} />
  </div>
)
```

```css
.Person {
  width: 60%;
  margin: 16px auto;
  border: 1px solid #eee;
  box-shadow: 0 2px 3px #ccc;
  padding: 16px;
  text-align: center;
}
```

nothing happens!

why?

by default, no file is integrated into your code

we have to import files, to add them to the game

in App.js we have

```js
import './App.css'
```
weird to put css in js?

thanks to webpack not

it import the file into the html code

so, in Person.js

```js
import './Person.css'
```
if we inspect the browser, in the header, we see the css classess
but, if we inspect index.html in public folder, we dont see them

the reason, style text are injected by webpack

react prefixes the css properties to work in any browser



















