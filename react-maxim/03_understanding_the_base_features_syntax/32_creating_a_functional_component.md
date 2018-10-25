# 32 creating a functional component

add a new folder in src

folder: Person. capital p!

Person.js

we extend the component class from the react library

state: allows to change your component at runtime

to create a component, a component is just a function wich returns some jxs, html

you could do

```js
function person() {
  return <h2>
}
```

we could do

name of function, same of the name

```js
const person = () => {
  return <p>I'm a Person!</p>
}
```

we need two other things
1. we need to import react

jsx need to be change to React.createElement

```js
import React from 'react';
```

we don't need component though

2. we need to export the function

Person.js

```js
import React from 'react';

const person = () => {
  return <p>I'm a Person!</p>
}

export default person;
```

now, we can use this component in other files of our project

for example, in App.js

import it!

```js
import Person from './Person/Person';
```

import upper case Person

all elements starting with lower case, are reserverd for the html elements

```js
import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Person from './Person/Person'

class App extends Component {
  render() {
    return (
      <div className="App">
        <h1>hi i am a react app</h1>
        <p>This is workingg</p>
        <Person></Person>
      </div>
    );
    // return React.createElement('div', null, React.createElement('h1', null, 'i am a react blabla'));
  }
}

export default App;
```

or, since we don't have anything inside

```js
<Person />
```

here we see why person capital letter. lower char are for normal html elements

we see the paragraph in the html dom

but what is the benefit of creating the component?






































