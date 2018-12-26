# 64 Adding and using Radium

inline style has limitations

we can't assign hover to our btn

we could do this in css file, but then we lose the power of editing style with js

would be cool to use pseudoselectors and media query in js

this is of course not possible, but we can add a third party package

```js
npm install --save radium
```

populare package for react, inline style with pseudoselector and mediaqueries

to use it:
we need to import it in the file we want to use it

App.js

```js
import Radium from Radium
```

```js
export default Radium(App);
```

high order component.
component wrapping component, injecting new fefatures

we can use it in class extended components and functional components

we add features in our style

```js
const style = {
  backgroundColor: "green",
  color: "white",
  font: "inherit",
  border: "1px solid blue",
  padding: "8px",
  ":hover": {
    backgroundColor: 'lightgreen',
    color: "black"
  }
};
```

```js
style.backgroundColor = 'red';
style[":hover"] = {
  backgroundColor: 'salmon',
  color: "black"
}
```















