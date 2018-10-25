# 16 understanding classes

```js
class Person {
  name = 'Max'
  call = () => {...}
}
```

```js
const myPerson = new Person()
myPerson.call()
console.log(myPerson.name)
```

```js
class Person extends Master
```

example

```js
class Person {
  constructor() {
    this.name = 'Max';
  }
}

printMyName() {
  console.log(this.name);
}

const person = new Person();
person.printMyName();
```

constructor is a built-in method, it will be executed whenever you instantiate the class

```js
class Huamn {
  constructor() {
    this.gender = 'male';
  }

  printGender() {
    console.log(this.gender);
  }
}
```

```js
class Person extends Human {
  constructor() {
    this.name = 'Max';
  }
}

printMyName() {
  console.log(this.name);
}

const person = new Person();
person.printMyName();
person.printGender();
```


this gets an error, we need the super constructor

if you extend a a class, and you use a constructor, put super()

it executes the constructor of the parent class, which makes sense cuz we need it


```js
class Person extends Human {
  constructor() {
    super();
    this.name = 'Max';
    this.gender = 'female'; // not correct, but still...
  }
}

printMyName() {
  console.log(this.name);
}

const person = new Person();
person.printMyName();
person.printGender();
```

classes are blueprints for objects, we use construct!

















