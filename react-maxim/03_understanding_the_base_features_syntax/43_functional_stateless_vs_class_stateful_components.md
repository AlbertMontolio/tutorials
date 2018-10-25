when creating a component as a function, we cant use state in there

its just a function

we dont have any class extends Component

still, we prefere to use const person = ()

why is so important?

because this functions, that just receive props, are very clear at what they do

they only render sth to the dom, they are dynamic, but, they don't manipulate your app state. this is super important

app state should be changed in a few selected components, also refered as containers

like App.js

we say containers, because it contains some part of our application state

pattern: few components that change the state, and a lot of compnents that render

still, sometimes you want to listen to an event, in a component without extends Component

we could turn this component into a class, but not good practicing

what we could do is, listen to the event in the component (with function) and modify the state in the container










