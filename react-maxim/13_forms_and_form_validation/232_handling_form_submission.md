#232 Handling Form Submission

we have this button, but we don't want to use the clickHandler

```js
<Button btnType="Success" clicked={this.orderHandler}>ORDER</Button>
```

we use it in the form

```js
let form = (
  <form onSubmit={this.orderHandler}>
```

now we want to extract the data we want to submit

the data is updated all the time in the state thanks to two way binding

```js
orderHandler = (event) => {
    event.preventDefault();
    console.log(this.props.ingredients);
    this.setState({loading: true});

    const formData = {};

    for (let formElementIdentifier in this.state.orderForm) {
      formData[formElementIdentifier] = this.state.orderForm[formElementIdentifier].value;
    }

    const order = {
      ingredients: this.props.ingredients,
      price: this.props.price,
      orderData: formData
    }
```



