#220 Implementing navigation links

NavigationItems.js

```js
  <ul className={classes.NavigationItems}>
    <NavigationItem link="/" active>Burger Builder</NavigationItem>
    <NavigationItem link="/orders">Orders</NavigationItem>
  </ul>
```

NavigationItem.js

we are using normal anchor tag!

```js
const navigationItem = (props) => (
  <li className={classes.NavigationItem}>
    <a 
      href={props.link}
      className={props.active ? classes.active : null}
    >
      {props.children}
    </a>
  </li>
);
```

```js
import {NavLink} from 'react-router-dom';
```

```js
const navigationItem = (props) => (
  <li className={classes.NavigationItem}>
    <NavLink to={props.link}>
      {props.children}
    </NavLink>
  </li>
);
```

NavigationItems.js

```js
<NavigationItem link="/" active>Burger Builder</NavigationItem>
```

get rid of active!

links are working, we see our active class, but style is not applied

class names are unique

when we define a.active, it will come out with a_hash_active

we can fix this

NavigationItems.js

```js
<li className={classes.NavigationItem}>
  <NavLink 
    to={props.link}
    activeClassName={classes.active}
  >
    {props.children}
  </NavLink>
</li>
```

if we click orders, both links are active

NavigationItem.js

```js
<NavLink 
  to={props.link}
  exact
  activeClassName={classes.active}
>
```







