#222 Outputting the Orders

Orders.js

```js
render () {
  return (
    <div>
      {this.state.orders.map(order => (
        <Order 
          key={order.id} 
          ingredients={order.ingredients}
          price={order.price}
        />
      ))}
    </div>
  );
}
```

Order.js

```js
const order = (props) => (
  <div className={classes.Order}>
    <p>Ingredients: Salad (1)</p>
    <p>Price: <strong>USD {Number.parseFloat(props.price).toFixed(2)}</strong></p>
  </div>
);
```

we need an array of ingredients

```js
const order = (props) => {

  const ingredients = [];

  for (let ingredientName in props.ingredients) {
    ingredients.push(
      {
        name: ingredientName, 
        amount: props.ingredients[ingredientName]
      });
  }

  const ingredientOutput = ingredients.map(ig => {
    return <span 
      style={{
        textTransform: 'capitalize',
        display: 'inline-block',
        margin: '0 8px',
        border: '1px solid #ccc',
        padding: '5px'
      }}
      key={ig.name}>{ig.name} ({ig.amount})</span>
  });

  return (
    <div className={classes.Order}>
      <p>Ingredients: {ingredientOutput}</p>
      <p>Price: <strong>USD {Number.parseFloat(props.price).toFixed(2)}</strong></p>
    </div>
  );
};
```


