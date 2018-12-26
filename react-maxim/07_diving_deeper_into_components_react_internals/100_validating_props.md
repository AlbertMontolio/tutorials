#102 Validating props

we have a better way to write props. mostly, if our props are used by other developers in the development process

u can restrict the types and the values for your props

in Person.js we receive click, name, age changed

age is always a number, name is always a string

for that, there is an extra library 

```js
npm install --save prop-types
```

Person.js

```js
import PropTypes from 'prop-types';
```

how do we use it?

below our class definition

we edit the class after it was defined

propTypes is a js object

```js
Person.propTypes = {
  click: PropTypes.func,
  name: PropTypes.string,
  age: PropTypes.number,
  changed: PropTypes.func
}
```

if we change the age for a string, we get a warning











