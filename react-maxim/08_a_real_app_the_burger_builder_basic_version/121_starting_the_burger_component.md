#121 Starting the Burger Component

Burger.js

```js
import React from 'react';

const burger = (props) => {
  return (
    <div></div>
  );
}

export default burger;
```

we'll wrap the ingredients, in the div we will add some styling

```js
.Burger {
  width: 100%;
  margin: auto;
  height: 250px;
  overflow: scroll;
  text-align: center;
  font-weight: bold;
  font-size: 1.2rem;
}

@media (min-width: 500px) and (min-height: 400px) {
  .Burger {
    width: 350px;
    height: 300px;
  }
}

@media (min-width: 500px) and (min-height: 401px) {
  .Burger {
    width: 450px;
    height: 400px;
  }
}

@media (min-width: 1000px) and (min-height: 700px) {
  .Burger {
    width: 700px;
    height: 600px;
  }
}
```

Burger.js

```js
import React from 'react';
import classes from './Burger.css';
import BurgerIngredient from './BurgerIngredient/BurgerIngredient';

const burger = (props) => {
  return (
    <div className={classes.Burger}>
      <BurgerIngredient type="bread-top" />
      <BurgerIngredient type="cheese" />
      <BurgerIngredient type="meat" />
      <BurgerIngredient type="bread-bottom" />
    </div>
  );
}

export default burger;
```

BurgerBuilder.js

```js
import React, {Component} from 'react';
import Aux from '../../hoc/Aux';
import Burger from '../../components/Burger/Burger';

class BurgerBuilder extends Component {
  render() {
    return (
      <Aux>
        <Burger />
        <div>Build controls</div>
      </Aux>
    );
  }
}

export default BurgerBuilder;
```










