#239 Working on an Error

ContacatData.js

```js
checkValidity(value, rules) {
    let isValid = true;

    if (rules.required) {
      isValid = value.trim() !== '' && isValid;
    }
```

what is this rules?

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
  validation: {},
  valid: true
}
```

or

```js
  checkValidity(value, rules) {
    let isValid = true;

    if (!rules) {
      return true;
    }
```



