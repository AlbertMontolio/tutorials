#120 adding prop type validation

```js
npm install --save prop-types
```

BurgerIngredient.js

```js
import PropTypes from 'prop-types';
```

we can use prop-types with components that use the class keyboard

we need to change it

everything inside return

```js
import React, {Component} from 'react';
import classes from './BurgerIngredient.css';
import PropTypes from 'prop-types';

class BurgerIngredient extends Component {

  render() {
    let ingredient = null;
```

```js
switch (this.props.type) {
```

```js
// validation
BurgerIngredient.propTypes = {
  type: PropTypes.string.isRequired
};
```








