#123 Calculating the ingredient sum dynamically

let's show sth if we don't have ingredients

we want to check if the arrays inside the array are empty

we can flatten the array

reduce => transform an array into sth else

two args, previous value and the current value

Burger.js

```js
.map(igKey => {
    return [...Array(props.ingredients[igKey])].map((_, i) => {
      return <BurgerIngredient key={igKey + i} type={igKey} />
    })
  })
  .reduce((arr, el) => {}, []);
```

we flattened the array. with that we have an array whether empty or containing the jsx elements

```js
import React from 'react';
import classes from './Burger.css';
import BurgerIngredient from './BurgerIngredient/BurgerIngredient';

const burger = (props) => {

  let transformedIngredients = Object.keys(props.ingredients)
  .map(igKey => {
    return [...Array(props.ingredients[igKey])].map((_, i) => {
      return <BurgerIngredient key={igKey + i} type={igKey} />
    })
  })
  .reduce((arr, el) => {
    return arr.concat(el);
  }, []);

  if (transformedIngredients.length === 0) {
    transformedIngredients = <p>Please start adding ingredients!</p>
  } 

  return (
    <div className={classes.Burger}>
      <BurgerIngredient type="bread-top" />
      {transformedIngredients}
      <BurgerIngredient type="bread-bottom" />
    </div>
  );
}

export default burger;
```



