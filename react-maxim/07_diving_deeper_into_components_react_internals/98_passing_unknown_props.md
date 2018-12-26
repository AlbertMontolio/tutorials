#100 Passing unkown props

in our hoc withClass component

WrappComponent can be either App.js or Person.js

title and names are missing

```js
import React from 'react';

const withClass = (WrappedComponent, className) => {
  return (props) => (
    <div className={className}>
      <WrappedComponent />
    </div>
  )
}

export default withClass;
```

we can't hardcode name, cuz we don't need it in App.js, just in Person.js

>we can pass the existing prop


ES6 operator: spread

props is just an object, key value pairs

```js
<WrappedComponent {...props} />
```

pass on the props, as you get it

now we have a truly reusable hoc component

if we need a stateful component, we can do it:

```js
const withClass = (WrappedComponent, className) => {
  return class extends Component {
    render () {
      return (
        <div className={className}>
          <WrappedComponent {...this.props} />
        </div>
      )
    }
  }
}
```

the class is anonymous















