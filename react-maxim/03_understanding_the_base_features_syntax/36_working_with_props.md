for nomral html elements, we can pass attributes

like we do with className="App"

we would like to do to person

```js
return (
  <div className="App">
    <h1>hi i am a react app</h1>
    <p>This is workingg</p>
    <Person name="Albert" age="32"></Person>
    <Person name="Ina" age="29"></Person>
    <Person name="Mode" age="60"></Person>
  </div>
);
```

for Ina, we would to add some additional information

```js
<Person name="Ina" age="29">My Hobbies: Racing</Person>
```

now we need to change sth inside our component, so that we can use this new attributes

react can take this attributes in an object called props

```js
const person = (props) => {
  return <p>I'm a Person and i am {Math.floor(Math.random()*30)} years old!</p>
}
```

properties in the component, are the attributes html that we put on the html

now that we have props, we have access to attrs

```js
const person = (props) => {
  return <p>I'm a {props.name} and i am {props.age} years old!</p>
}
```

it works, but, when using class-based components, we should use

```js
class Person extends Component {
  render () {
    return <p>My name is {this.props}</p>;
  }
}
```

we use dynamic content, that is set from the outside

and we can reuse the component

what about the hobbies?

content in between the tags. how can we have access to?

```html
<Person name="Ina" age="29">Hobbies: Racing</Person>
```

i want to output what we pass inside

there is a special prop

Person.js

wrap my paragraph in normal parenthesis.
i want to create a wrapping element, and add an element after this p, which is also a p

we can use {} access props.children property

children refers to any element in between opening tag and closing tag. it could be not only text, can be html, other react components

```js
const person = (props) => {
  return (
    <div>
      <p>I'm a {props.name} and i am {props.age} years old!</p>
      <p>{props.children}</p>
    </div>
  )
}
```

now we see it on the screen

in the other persons, we see an empty paragraph. .children is undefined



































