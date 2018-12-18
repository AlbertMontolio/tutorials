# 17 classes, properties & methods

properties are like "variables attached to classes/objects"

ES6

```js
constructor() {
  this.myProperty = 'value'
}
```

ES7

```js
myProperty = 'value';
```

methods are like "functions attached to classes/objects"

ES6

```js
myMethod() {...}
```

ES7

```js
myMethod = () => {...}
```

now translate the class Human and Person

```js
class Human {
  gender = 'male';

  printGender = () => {
    console.log(this.gender);
  }
}

class Person extends Human {
  name = 'Max';
  gender = 'female';

  printMyName = () => {
    console.log(this.name);
  }
}

const person = new Person();
person.printMyName();
person.printGender();
```



