#245 Understanding the redux flow

react does not react to changes in this global variable, that would not be efficient, but with some packages, it is efficient

how redux works?

it's all about central store. redux is an independent library

this store stores entire application state. gigant js object

a react component wants to manipulate app state.

this component does not update the central store.

first building block in redux are actions. so a component dispatches an action

an action is an information package in the end. Pre-defined information package (possible with payload)

something like, add ingredient, remove ingredient.

if the action is add ingredient, we need to pass which ingredient

that action does not hold logic, does touch the central store.

the action, reaches a reducer.

reducer can check the type of the action, for example, if it's add ingredient and then we define the code for this type of action in the reducer.

the reducer receive action and update state (pure, sync functions, no side-effects). can be multiple, combined reducers

reducers are just, input in, input out

reducer spits up the updated stated which is stored in the central store

it has to be done in an immutable way. new js object, we don't want to change the old one!

now the store is up to date

to know when there are changes, we use trigger models, subscriptions, whenever the state changes. a component can subscribe to store changes

Subscription passes updated State as Props







