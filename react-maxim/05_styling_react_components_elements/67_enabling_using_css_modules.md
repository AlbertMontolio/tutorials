#67 enabling & using css modules

we want to scope Person.css to Person.js

styles that we define there, just work in the component, not in other ones

we can use a feature css modules

get rid of radium in Person.js

same for App.js

package.json, we are using react-scripts

we can have access to the configuration with the "eject": 


in the terminal:

```js
npm run eject
```

git commit before!

now we see new folders

the scripts folder has all the commands that we see in the package file

in package.json we see more, all the dev dependencies under the hood

in the config/webpack.config.dev.js 

find this:

```js
// By default we support CSS Modules with the extension .module.css
{
  test: cssRegex,
  exclude: cssModuleRegex,
  use: getStyleLoaders({
    importLoaders: 1,
  }),
},
```

i have to have:

```js
{
  test: cssRegex,
  exclude: cssModuleRegex,
  use: getStyleLoaders({
    importLoaders: 1,
    modules: true,
    localIdentName: '[name]__[local]__[hash:base64:5]'
  }),
},
```

in webpack.config.prod.js

```js
{
  test: cssRegex,
  exclude: cssModuleRegex,
  use: getStyleLoaders({
      importLoaders: 1,
      modules: true,
      localIdentName: '[name]__[local]__[hash:base64:5]'
  }),
  // Don't consider CSS imports dead code even if the
  // containing package claims to have no side effects.
  // Remove this when webpack adds a warning or an error for this.
  // See https://github.com/webpack/webpack/issues/6571
  sideEffects: true,
},
```

App.js

```js
import classes from './App.css';
```

we change

```js
<div className="App">
```

for 

```js
<div className={classes.App}>
```





























