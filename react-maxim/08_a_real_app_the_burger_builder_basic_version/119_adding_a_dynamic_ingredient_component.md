#119 Adding a dynamic ingredient component

components/Burger

everything burger related should be here

Burger/Burger.js

the burger we render

Burger/BurgerIngredient/BurgerIngredient.js

css in BurgerIngredient.css
there we have all the forms

BurgerIngredient.js

```js
import React from 'react';

const burgerIngredient = (props) => {

};

export default burgerIngredient;
```

```js
import React from 'react';
import classes from './BurgerIngredient.css';

const burgerIngredient = (props) => {
  let ingredient = null;

  switch (props.type) {
    case ('bread-bottom'):
      ingredient = <div className={classes.BreadBottom}></div>;
      break;
    case ('bread-top'):
      ingredient = (
        <div className={classes.BreadTop}>
          <div className={classes.Seeds1}></div>
          <div className={classes.Seeds2}></div>
        </div>
      );
      break;
    case ('meat'):
      ingredient = <div className={classes.Meat}></div>;
      break;
    case ('cheese'):
      ingredient = <div className={classes.Cheese}></div>;
      break;
    case ('salad'):
      ingredient = <div className={classes.Salad}></div>;
      break;
    case ('bacon'):
      ingredient = <div className={classes.Bacon}></div>;
      break;
    default: 
      ingredient = null;
  }

  return ingredient;
};

export default burgerIngredient;
```

we want also to add props type validation


components/Burger

everything burger related should be here

Burger/Burger.js

the burger we render

Burger/BurgerIngredient/BurgerIngredient.js

css in BurgerIngredient.css
there we have all the forms

BurgerIngredient.js

```js
import React from 'react';

const burgerIngredient = (props) => {

};

export default burgerIngredient;
```

```js
import React from 'react';
import classes from './BurgerIngredient.css';

const burgerIngredient = (props) => {
  let ingredient = null;

  switch (props.type) {
    case ('bread-bottom'):
      ingredient = <div className={classes.BreadBottom}></div>;
      break;
    case ('bread-top'):
      ingredient = (
        <div className={classes.BreadTop}>
          <div className={classes.Seeds1}></div>
          <div className={classes.Seeds2}></div>
        </div>
      );
      break;
    case ('meat'):
      ingredient = <div className={classes.Meat}></div>;
      break;
    case ('cheese'):
      ingredient = <div className={classes.Cheese}></div>;
      break;
    case ('salad'):
      ingredient = <div className={classes.Salad}></div>;
      break;
    case ('bacon'):
      ingredient = <div className={classes.Bacon}></div>;
      break;
    default: 
      ingredient = null;
  }

  return ingredient;
};

export default burgerIngredient;
```

we want also to add props type validation


