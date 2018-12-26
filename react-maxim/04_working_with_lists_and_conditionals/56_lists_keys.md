#56 lists keys

we need the key prop, when we render list of data

we assign key, and as value something unique

we need it in the data first

```js
state = {
  persons: [
    { id: 1, name: 'Albert', age: 28 },
    { id: 2, name: 'Manu', age: 29 },
    { id: 3, name: 'Vero', age: 34 }
  ],
  otherState: 'other values',
  showPersons: false
}
```

now i can add to Person

```js
key={person.id}
```


