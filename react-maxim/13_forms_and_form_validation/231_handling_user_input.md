#231 Handling User Input

Input.js

```js
case ('input'):
  inputElement = <input 
    className={classes.InputElement} 
    {...props.elementConfig} 
    onChange={props.changed}
    value={props.value} />;
  break;
```

in all inputs

ContactData.js

```js
<Input
  key={formElement.id}
  elementType={formElement.config.elementType}
  elementConfig={formElement.config.elementConfig}
  value={formElement.config.value}
  changed={this.inputChangedHandler}
/>
```

```js
changed={(event) => this.inputChangedHandler(event, formElement.id)}
```

we need to clone orderForm deeply. with spread operator you just clone the first key-value pair

```js
  inputChangedHandler = (event, inputIdentifier) => {
    console.log(event.target.value);
    const updatedOrderForm = {
      ...this.state.orderForm
    }
    const updatedFormElement = {
      ...updatedOrderForm[inputIdentifier]
    };

    updatedFormElement.value = event.target.value;
    updatedOrderForm[inputIdentifier] = updatedFormElement;
    this.setState({orderForm: updatedOrderForm});
  }
```



