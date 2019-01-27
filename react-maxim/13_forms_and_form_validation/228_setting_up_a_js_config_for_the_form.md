#228 Setting Up a JS Config for the Form

```js
class ContactData extends Component {
  state = {
    orderFrom: {
        name: {
          elementType: 'input',
          elementConfig: {
            type: 'text',
            placeholder: 'Your name'
          },
          value: ''
        },
        street: {
          elementType: 'input',
          elementConfig: {
            type: 'text',
            placeholder: 'Street'
          },
          value: ''
        },
        zipCode: {
          elementType: 'input',
          elementConfig: {
            type: 'text',
            placeholder: 'ZIP Code'
          },
          value: ''
        },
        country: {
          elementType: 'input',
          elementConfig: {
            type: 'text',
            placeholder: 'Country'
          },
          value: ''
        },
        email: {
          elementType: 'input',
          elementConfig: {
            type: 'text',
            placeholder: 'Your E-Mail'
          },
          value: ''
        },
        deliveryMethod: {
          elementType: 'select',
          elementConfig: {
            options: [
              {value: 'fastest', displayValue: 'Fastest'},
              {value: 'cheapest', displayValue: 'Cheapest'}
            ]
          },
          value: ''
        }
    },
    loading: false
  }
```

now we want to create our inputs by looping our orderForm

ContactData.js

```js
 render () {

    let form = (
      <form>
        <Input elementType="" elementConfig="" value="..." />
```

Input.js

```js
const input = (props) => {
  let inputElement = null;

  switch (props.elementType) {
    case ('input'):
      inputElement = <input className={classes.InputElement} {...props.elementConfig} value={props.value} />;
      break;
    case ('textarea'):
      inputElement = <textarea className={classes.InputElement} {...props.elementConfig} value={props.value} />
      break;
    default:
      inputElement = <input className={classes.InputElement} {...props.elementConfig} value={props.value} />
  }
```

ContactData.js

```js
  render () {
    const formElementsArray = [];
    for (let key in this.state.orderForm) {
      formElementsArray.push({
        id: key,
        config: this.state.orderForm[key]
      });
    }

    let form = (
      <form>
        {formElementsArray.map(formElement => (
          <Input
            key={formElement.id}
            elementType={formElement.config.elementType}
            elementConfig={formElement.config.elementConfig}
            value={formElement.config.value}
          />
        ))}
        <Button btnType="Success" clicked={this.orderHandler}>ORDER</Button>
      </form>
    );
```






