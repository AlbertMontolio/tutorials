#Adding a SideDrawer toggling button

SideDrawer/DrawerToggle/DrawerToggle.js

```js
import React from 'react';

const drawerToggle = (props) => (
  <div>MENU</div>
);

export default drawerToggle;
```

Toolbar.js

```js
import DrawerToggle from '../SideDrawer/DrawerToggle/DrawerToggle';
```

```js
const toolbar = () => (
  <header className={classes.Toolbar}>
    <DrawerToggle />
```

DrawerToggle.js

```js
<div onClick={props.clicked}>MENU</div>
```

Toolbar.js

we don't have the method defined here, but we will use the Toolbar in the Layout.js component, where we will add this method

```js
const toolbar = (props) => (
  <header className={classes.Toolbar}>
    <DrawerToggle clicked={props.drawerToggleClicked} />
```

Layout.js

```js
  state = {
    showSideDrawer: false
  }

  sideDrawerClosedHandler = () => {
    this.setState({showSideDrawer: false});
  }

  sideDrawerClosedHandler = () => {
    this.setState({showSideDrawer: !this.state.showSideDrawer});
  }
```

this is wrong, you can't update the state like this

asynchronous nature of state

we need the function form

```js
  sideDrawerClosedHandler = () => {
    // this.setState({showSideDrawer: !this.state.showSideDrawer});
    this.setState((prevState) => {
      return {showSideDrawer: !prevState.showSideDrawer}
    });
  }
```

```js
  render () {
    return (
      <Aux>
        <Toolbar drawerToggleClicked={this.sideDrawerClosedHandler} />
```



