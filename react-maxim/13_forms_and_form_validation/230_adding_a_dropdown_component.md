#230 Adding a Dropdown Component

Input.js

```js
case ('select'):
  inputElement = (
    <select 
      className={classes.InputElement} 
      value={props.value} 
    >
      {props.elementConfig.options.map(option => (
        <option key={option.value} options={option.value}>{option.displayValue}</option>
      ))}
    </select>
  )
  break;
```



