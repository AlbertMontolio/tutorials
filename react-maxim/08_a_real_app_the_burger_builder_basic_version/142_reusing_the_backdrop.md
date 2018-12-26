#Working on Responsive Adjustments

Logo.css

```js
.Logo {
  background-color: white;
  padding: 8px;
  height: 100%;
```

control the height of the logo where we use it

Toolbar.js

```js
const toolbar = () => (
  <header className={classes.Toolbar}>
    <div>MENU</div>
    <Logo height="80%" />
```

Logo.js

```js
const logo = () => (
  <div className={classes.Logo} style={{height: props.height}}>
```

SideDrawer.js

```js
const sideDrawer = (props) => {
  // ...

  return (
    <div className={classes.SideDrawer}>
      <Logo height="11%" />
```

alternative

we wrap logo into a div

SideDrawer.js

```js
  return (
    <div className={classes.SideDrawer}>
      <div>
        <Logo />
      </div>
```

Toolbar.js

```js
const toolbar = () => (
  <header className={classes.Toolbar}>
    <div>MENU</div>
    <div>
      <Logo />
    </div>
```

the divs should control the height

Toolbar.js

```js
const toolbar = () => (
  <header className={classes.Toolbar}>
    <div>MENU</div>
    <div className={classes.Logo}>
```

I can use Logo class in this component, nothing to do with Logo component

Toolbar.css

```js
.Logo {
  height: 80%;
}
```

SideDrawer.js

```js
.Logo {
  height: 11%;
}
```

SideDrawer.js

```js
const sideDrawer = (props) => {
  // ...

  return (
    <div className={classes.SideDrawer}>
      <div className={classes.Logo}>
```


