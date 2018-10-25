lets put some dynamic content

```js
import React from 'react';

const person = () => {
  return <p>I'm a Person and i am X years old!</p>
}

export default person;
```

x should be a number

```js
import React from 'react';

const person = () => {
  return <p>I'm a Person and i am Math.floor(Math.random()*30) years old!</p>
}

export default person;
```

but we just see the string

we have to wrap it in single curly braces

```js
import React from 'react';

const person = () => {
  return <p>I'm a Person and i am {Math.floor(Math.random()*30)} years old!</p>
}

export default person;
```

now we see the values

we can execute one line expressions, we can also call a function

we want to pass some html attributes from the App.js to the Person component

















