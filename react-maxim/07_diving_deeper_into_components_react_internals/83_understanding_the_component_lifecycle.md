#85 Understanding the component Lifecycle

Component Lifecycle

when react creates a component, it runs through multiple lifecycle phases

just in statefull components we can use this methods

>only available in Stateful Components

- constructor()
- componentWillReceiveProps()
- componentWillUpdate()
- componentDidCatch()
- componentWillUnmount()
- componentWillMount()
- shouldComponentUpdate()
- componentDidUpdate()
- componentDidMount()
- render()

when are this methods are executed?

# Component Lifecycle - Creation
- constructor()
- componentWillMount()
- componentDidMount()
- render()

1 - constructor(props) it's a default es6 class feature

if we create this method ourselves, we need to call super(props)
do: set up state
don't: cause side-effects

don't reach out to a web server in a constructor! you will re render your application

2 - componentWillMount()
we don't use it.

3 - render()
executing this method, does not mean that we access the real DOM
render gives an idea, how it would look like, depending on the current DOM. Prepare & structure your jsx code

4 - Render child components

5 - componentDidMount()
here you want to reach out to the web, to fetch data
don't update the state! triggers a re-render

































