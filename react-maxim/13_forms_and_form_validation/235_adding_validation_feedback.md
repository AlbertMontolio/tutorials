#235 Adding Validation Feedback

Input.js

```js
const input = (props) => {
  let inputElement = null;

  const inputClasses = [classes.InputElement];

  if (props.invalid) {
    inputClasses.push(classes.Invalid);
  }

  switch (props.elementType) {
    case ('input'):
      inputElement = <input 
        className={inputClasses.join(' ')} 
```

ContactData.js

```js
<Input
  key={formElement.id}
  elementType={formElement.config.elementType}
  elementConfig={formElement.config.elementConfig}
  value={formElement.config.value}
  invalid={!formElement.config.valid}
```

Input.js

```js
const input = (props) => {
  let inputElement = null;

  const inputClasses = [classes.InputElement];

  if (props.invalid && props.shouldValidate) {
    inputClasses.push(classes.Invalid);
  }
```

ContactData.js

```js
let form = (
  <form onSubmit={this.orderHandler}>
    {formElementsArray.map(formElement => (
      <Input
        key={formElement.id}
        elementType={formElement.config.elementType}
        elementConfig={formElement.config.elementConfig}
        value={formElement.config.value}
        invalid={!formElement.config.valid}
        shouldValidate={formElement.config.validation}
        changed={(event) => this.inputChangedHandler(event, formElement.id)}
      />
    ))}
```





