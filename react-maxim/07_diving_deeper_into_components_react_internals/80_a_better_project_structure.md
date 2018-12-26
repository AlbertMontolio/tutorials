#80 a better project structure

til now, we had 2 compnents, app component, an person, which is a functional component

the person component is ok

we can split up the app.js component

container components like App.js, components that also manage the state, shouldn't be involved with the rendering too much.

render method should be lean, not contain too much jsx

we could create a person list component, or a persons compnent

in src, Persons/Persons.js

move Person folder into Persons folder

we can create a components folder, which holds all the components

we can also have assets folder, with images we would include

also a containers folder, which holds all the containers


