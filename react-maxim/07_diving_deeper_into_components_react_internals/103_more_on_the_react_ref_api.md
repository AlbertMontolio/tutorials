#105 More on the React ref API (16.3)

minor new features

Person.js

```js
class Person extends Component {

  constructor(props) {
    super(props);
    this.inputElement = React.createRef();
  }
```


```js
<input 
  ref={this.inputElement}
  onChange={this.props.changed} 
  value={this.props.name} 
/>
```

```js
  componentDidMount () {
    console.log("componentDidMount");
    this.inputElement.current.focus();
  }
```

another feature

```js
  focus() {
    this.inputElement.current.focus();
  }
```

we want to call this method from the outside, from the Persons.js

Persons.js

```js
class Persons extends Component {

  constructor(props) {
    super(props);
    this.lastPersonRef = React.createRef();
  }
```

we add the ref key

```js
render () {
  return this.props.persons.map((person, index) => {
    return <Person
      click={() => this.props.clicked(index)}
      position={index}
      name={person.name} 
      age={person.age}
      key={person.id}
      ref={this.lastPersonRef}
      changed={(event) => this.props.changed(event, person.id)}
    />
  })
}
```

```js
  componenetDidMount() {
    this.lastPersonRef.current.focus();
  }
```

cuz this method is called after render.

we have an error, nothing happens

we wrapped our Person component with withClass.

```js

// export default withClass(Person, classes.Person);
export default Person;
```

makes sense, we were returning the class extends comopnent in WithClass, which just has the render method, not the focus method

to solve this, react has

in our hoc

instead returning the class, we store it in a constant

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

like this

```js
const withClass = (WrappedComponent, className) => {
  const withClass = class extends Component {
    render () {
      return (
        <div className={className}>
          <WrappedComponent {...this.props} />
        </div>
      )
    }
  }

  return React.forwardRef();
}
```

```js
  return React.forwardRef((props, ref) => {
    return <WithClass {...props} forwardedRef={ref} />
  });
```


whatever we pass to Person component as prop

```js
return <Person
  click={() => this.props.clicked(index)}
  position={index}
  name={person.name} 
  age={person.age}
  key={person.id}
  ref={this.lastPersonRef}
  changed={(event) => this.props.changed(event, person.id)}
/>
```

is the first first argument props

```js
return React.forwardRef((props, ref) => {
    return <WithClass {...props} forwardedRef={ref} />
  });
```

forwardRef catches all my props, and extracts the special ref prop, that i am passing

forwards that to my underline component

```js
const WithClass = class extends Component {
  render () {
    return (
      <div className={className}>
        <WrappedComponent ref={this.props.forwardedRef} {...this.props} />
      </div>
    )
  }
}
```

chain of ref, direct tunnel, between core component we are working with (Person.js) and its parent component, Persons.js

ignoring comopnents in between (WithClass Compnent)


the last input is selected

in Persons.js

we are doing

```js
ref={this.lastPersonRef}
```

it's a loop, so the last one






































































