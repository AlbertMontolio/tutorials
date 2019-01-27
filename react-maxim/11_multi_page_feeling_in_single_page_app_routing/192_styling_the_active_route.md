#192 Styling the Active Route

we have to tell react-router to do so

we will use a different type of link, the NavLink component

```js
import {Route, NavLink} from 'react-router-dom';
```

```js
<li><NavLink to="/">Home</NavLink></li>
```

now we have an active class automatically

```js
.Blog a:hover, .Blog a:active, .Blog a.active {
    color: orange;
}
```

if we are in New post, both links are orange

solution:

```js
<li><NavLink to="/" exact>Home</NavLink></li>
```

we can change the name of the active class

```js
<li>
    <NavLink 
        to="/" 
        exact
        activeClassName="my-active"
    >
        Home
    </NavLink>
</li>
```

```js
activeStyle={{
    color: 'red'
}}
```

for that, just works with NavLink








