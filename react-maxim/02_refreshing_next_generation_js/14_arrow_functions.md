# 14 arrow functions

```js
function myFnc() {

}

const myFnc = () => {

}
```

solves this keyword

```js
function printMyName() {
  console.log(name);
}


printMyName('Max');

const printMyName = (name) => {
  console.log(name)
}
```

if one argument:

```js
const printMyName = name => {
  console.log(name)
}
```

```js
const multiply = (number) => {
  return number * 2
}

console.log(multiply(2));
```

if you just one return in one line

you also need to get rid of the return

```js
const multiply = number => number * 2;
```
































