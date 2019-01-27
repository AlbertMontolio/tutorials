#233 Adding custom form validation

React has no package for validation

you have to do it on your own

there are third party packages of course

ContactData.js

```js
class ContactData extends Component {
  state = {
    orderForm: {
        name: {
          elementType: 'input',
          elementConfig: {
            type: 'text',
            placeholder: 'Your name'
          },
          value: '',
          validation: {
            required: true
          },
          valid: false
        },
```

add validation after value everywhere

```js
  checkValidity(value, rules) {
    let isValid = false;

    if (rules.required) {
      isValid = value.trim() !== ''
    }

    return isValid;
  }
```

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
    updatedFormElement.valid = this.checkValidity(updatedFormElement.value, updatedFormElement.validation);
    updatedOrderForm[inputIdentifier] = updatedFormElement;
    console.log(updatedFormElement);
    this.setState({orderForm: updatedOrderForm});
  }
```

we could add more rules

```js
    if (rules.minLength) {
      isValid = value.length >= rules.minLength;
    }
```

```js
zipCode: {
  elementType: 'input',
  elementConfig: {
    type: 'text',
    placeholder: 'ZIP Code'
  },
  value: '',
  validation: {
    required: true,
    minLength: 5,
    maxLength: 5
  },
  valid: false
```

```js
    if (rules.minLength) {
      isValid = value.length >= rules.minLength;
    }

    if (rules.maxLength) {
      isValid = value.length <= rules.maxLength;
    }
```

we are checking the rules one after the other, this is wrong








