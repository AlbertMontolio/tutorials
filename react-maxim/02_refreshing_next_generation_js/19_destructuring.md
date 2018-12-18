# 19 destructuring

easily extract array elements or object properties and store them in variables

is the spread?

spread takes out all elements, all properties,a nd distributes it

destructuring, single element

array destructuring

[a,b] = ['Hello', 'Max']
console.log(a) // hello
console.log(b) // max

object destructuring

```js
{name} = {name: 'Max', age: 28}
console.log(name) // Max
console.log(age) // undefined
```

example

```js
const numbers = [1, 2, 3];

[num1, num2] = numbers;
console.log(num1, num2);
[num1, ,num3] = numbers;
```


