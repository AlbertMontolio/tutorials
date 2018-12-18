# 20 reference and primitive types refresher

```js
const number = 1;
const num2 = number;
console.log(num2);
```
this is a primitive type

it is copied


numbers, strings, booleans, are primitive

when we reassigned, it copies the value

objects and arrays, are refrence types

```js
const person = {
  name: 'Max'
}

const secondPerson = person;

console.log(secondPerson);
```

you see the value of the first person, but it will not have copied the object, instead
person, the object, is stored in memory, we store a pointer

secondPerson copies the pointer

```js
const person = {
  name: 'Max'
}

const secondPerson = person;

person.name = 'Manu';

console.log(secondPerson);
```

i see manu in console!

eventhough i am printing the second person
the reason? secondPerson pints to the same object as person, and person was changed

same for arrays

this is important in react

if you copy objects and arrays like this

we will learn techniques to really copy, not the pointer

we can do:

>the spread. pulls out the object and creates a new one

```js
const person = {
  name: 'Max'
}

const secondPerson = {
  ...person
};

person.name = 'Manu';

console.log(secondPerson);
```

newly created object with the curly braces

now we see max in the screen

objects and arrays are reference types!

js and pythong have this behavior

c++ and perl no. ruby?

https://launchschool.com/blog/references-and-mutability-in-ruby

greeting.object_id




























