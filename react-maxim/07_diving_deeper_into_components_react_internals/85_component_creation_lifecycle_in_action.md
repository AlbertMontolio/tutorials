#87 Component Creation Lifecycle in Action

if we implement our own constructor, we need the super, cuz we are overwriting react's constructor

```js
class App extends Component {

  constructor(props) {
    super(props);
    console.log('[App.js] Inside Constructor');
  }
```

you can initialize state inside the constructor, but then you need this.state = 

but better outside
when you click the btn toggle prsons, 

render of App.js it's recalled

and then the persons lifecycles

we render the childComponents before Persons componentDidMount the last




