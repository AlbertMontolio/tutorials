#255 Updating arrays immutably

let's delete a result!

reducer.js

```js
case 'DELETE_RESULT':
      const id = 2;
      state.results.splice(id, 1);
      return {
        ...state,

      }
```

this mutates the original state of the array

how do we do it in a unmmutable way?

we can create a copy of the array

```js
case 'DELETE_RESULT':
  const id = 2;
  const newArray = [...state.results]
  newArray.results.splice(id, 1);
  return {
    ...state,
    results: newArray
  }
```

another way is to use the filter method

```js
case 'DELETE_RESULT':
  // const id = 2;
  // const newArray = [...state.results]
  // newArray.results.splice(id, 1);
  const updatedArray = state.results.filter(result => result.id !== action.resultElId );
  return {
    ...state,
    results: updatedArray
  }
```

Counter.js

```js
onDeleteResult: () => dispatch({type: 'DELETE_RESULT', resultElId: })
```

i need to get the id in the function

```js
onDeleteResult: (id) => dispatch({type: 'DELETE_RESULT', resultElId: id })
```

```js
<ul>
    {this.props.storedResults.map(strResult => (
        <li key={strResult.id} onClick={() => this.props.onDeleteResult(strResult.id)}>{strResult.value}</li>
    ))}
</ul>
```





