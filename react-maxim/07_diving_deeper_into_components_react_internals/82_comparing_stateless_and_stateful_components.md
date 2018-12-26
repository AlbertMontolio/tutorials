#84 Comparing stateless and stateful components

stateful component, created with class extends Component

we should create functional components as often as possible

why? they have a narrow focus. they are just about presenting something

we just want to have a few places in our application where the state changes

Stateless vs Stateful components

## Stateful (containers)
class XY extends Component
- access to State
- Lifecycle Hooks
access state and props via "this"
this.state.XY & this.props.XY
use only if you need to manage State or access to Lifecycle Hooks

##Stateless
const XY = (props) => {...}
- no access to State
- no access to Lifecycle Hooks
Access Props via "props"
props.XY

Use in all other Cases

the stateful components they have also props

in App.js, we can access

```js
appTitle={this.props.title}
```

like state, we didn't create this variable, but it's there


