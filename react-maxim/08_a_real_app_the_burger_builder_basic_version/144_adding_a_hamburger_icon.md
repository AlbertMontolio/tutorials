#140 Reusing the Backdrop

SidedDrawer.js

```js
import Backdrop from '../../UI/Backdrop/Backdrop';
import Aux from '../../../hoc/Aux';
```

add ClickListener on the backdrop

we have it already

Backdrop.js

```js
const backdrop = (props) => (
  props.show ? <div className={classes.Backdrop} onClick={props.clicked}></div> : null
);
```

goal is to handle this method in the sidedrawer

turn layout component into a class component where we can handle the method

so we can handle both backdrops, in the toolbar and in the sidedraer

Layout.js

```js
const layout = (props) => (
  <Aux>
    <Toolbar />
    <SideDrawer />
```

new Layout.js

```js
import React, {Component} from 'react';
import Aux from '../../hoc/Aux';
import classes from './Layout.css';
import Toolbar from '../Navigation/Toolbar/Toolbar';
import SideDrawer from '../Navigation/SideDrawer/SideDrawer';

class Layout extends Component {
  render () {
    return (
      <Aux>
        <Toolbar />
        <SideDrawer />
        <main className={classes.Content}>
          {this.props.children}
        </main>
      </Aux>
    )
  }
}

export default Layout;
```

````js
class Layout extends Component {
  state = {
    showSideDrawer: true
  }

  sideDrawerClosedHandler = () => {
    this.setState({showSideDrawer: false});
  }

  render () {
    return (
      <Aux>
        <Toolbar />
        <SideDrawer closed={this.sideDrawerClosedHandler} />
```

SideDrawer.js

```js
const sideDrawer = (props) => {
  // ...

  return (
    <Aux>
      <Backdrop show={props.open} clicked={props.closed} />
```

Layout.js

```js
  render () {
    return (
      <Aux>
        <Toolbar />
        <SideDrawer open={this.state.showSideDrawer} closed={this.sideDrawerClosedHandler} />
```

SideDrawer.js

```js
const sideDrawer = (props) => {
  let attachedClasses = [classes.SideDrawer, classes.Close];

  if (props.open) {
    attachedClasses = [classes.SideDrawer, classes.Open];
  }

  return (
    <Aux>
      <Backdrop show={props.open} clicked={props.closed} />
      <div className={attachedClasses.join(' ')}>
```






