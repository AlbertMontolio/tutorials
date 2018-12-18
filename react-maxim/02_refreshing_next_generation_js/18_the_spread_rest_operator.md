# 18 the spread & rest operator

three dots! ... this is the operator

depending on where we use it, is spread or rest

SPREAD

spread: used to split up array elements or objects properties

```js
const newArray = [...oldArray,1,2]
const newObject = {...oldObject, newProp: 5}
```
REST

used to merge a list of function arguments into an array

```js
function sortArgs(...args) {
  return args.sort()
}
```

sortArgs receives a lot of args, they will be all merged together in an array

```js
const numbers = [1, 2, 3];
const newNumbers = [...numbers, 4]
const newNumbers = [numbers, 4]
console.log(newNumbers)

```

objects

```js
const person = {
  name: 'Max'
}

const newPerson = {
  ...person,
  age: 28
}

console.log(newPerson)
```

until here was spread

the REST operator, used in a function

```js
const filter = (...args) => {
  return args.filter(el => el === 1);
}

console.log(filter(1,2,3));
```

we see an array [1]

























