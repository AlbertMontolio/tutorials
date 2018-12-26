#98 Understanding Higher Order Components (HOCs)

2 approaches to get rid of the wrapping div

hoc/WithClass.js

```js
import React from 'react';

const withClass = (props) => (
  <div className={props.classes}>
    {props.children}
  </div>
);

export default withClass;
```

we can use this in the App.js

```js
import WithClass from '../components/WithClass/WithClass.js'
```

App.js

```js
return (
  <WithClass classes={classes.App}>
    <Cockpit 
      showPersons={this.state.showPersons} 
      persons={this.state.persons}
      clicked={this.togglePersonsHandler}
    />
    {persons}
  </WithClass>
);
```

this is a high order component, it does not anything but wrapping stuff and assigning a css class

we can do the same in Person.js
