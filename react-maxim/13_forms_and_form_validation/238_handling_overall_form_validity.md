#238 Handling Overall Form Validity

ContactData.js

```js
},
    formIsValid: false,
    loading: false
```

```js
    updatedOrderForm[inputIdentifier] = updatedFormElement;
    console.log(updatedFormElement);

    let formIsValid = true;
    for (let inputIdentifier in updatedOrderForm) {
      formIsValid = updatedOrderForm[inputIdentifier].valid && formIsValid;
    }

    this.setState({orderForm: updatedOrderForm, formIsValid: formIsValid});
  }
```

```js
<Button btnType="Success" disabed={!this.state.formIsValid}>ORDER</Button>
```

this does not work cuz we are using our own btn, we don't know about disabled.

Button.js

```js
const button = (props) => (
  <button
    className={[classes.Button, classes[props.btnType]].join(" ")}
    onClick={props.clicked}
    disabled={props.disabled}
  >{props.children}</button>
```

validity is not updated correctly

dropdown is messing around

```js
deliveryMethod: {
  elementType: 'select',
  elementConfig: {
    options: [
      {value: 'fastest', displayValue: 'Fastest'},
      {value: 'cheapest', displayValue: 'Cheapest'}
    ]
  },
  value: '',
  valid: true
}
```

Button.css

```js
.Button:disabled {
  color: #ccc;
}
```






