#More about responsive adjustments

NavigationItem.css

```js
.NavigationItem {
  margin: 10px 0px;
  box-sizing: border-box;
  display: block;
  width: 100%;
}

.NavigationItem a {
  color: #8F5C2C;
  text-decoration: none;
  width: 100%;
  box-sizing: border-box;
  display: block;
}

.NavigationItem a:hover, .NavigationItem a:active, .NavigationItem a.active {
  color: #40A4C8;
}

@media (min-width: 500px) {
  .NavigationItem {
    margin: 0px;
    display: flex;
    height: 100%;
    width: auto;
    align-items: center;
  }
  
  .NavigationItem a {
    color: white;
    height: 100%;
    padding: 16px 10px;
    border-bottom: 4px solid transparent;
  }
  
  .NavigationItem a:hover, .NavigationItem a:active, .NavigationItem a.active {
    background-color: #8F5c2c;
    border-bottom: 4px solid #40A4C8;
    color: white;
  }
}
```

NavigationItems.css

```js
.NavigationItems {
  margin: 0px;
  padding: 0px;
  list-style: none;
  display: flex;
  flex-flow: column;
  align-items: center;
  height: 100%;
}

@media (min-width: 500px) {
  .NavigationItems {
    flex-flow: row;
  }
}
```

SideDrawer.css

```js
.Logo {
  height: 11%;
  margin-bottom: 32px;
}
```

Toolbar.css

```js
@media (max-width: 499px) {
  .DesktopOnly {
    display: none;
  }
}
```

Toolbar.js

```js
    <nav className={classes.DesktopOnly}>
      <NavigationItems />
    </nav>
```



