# 15 exports and imports (modules)

modular code

you split up your js code into multiple files

you can do it paying attention to the order you import them in the html files

we can also import js files in other files

person.js
```js
const person = {
  name: 'Max'
}

export default person
```

```js
// utility.js
export const clean = () => {...}
export const baseData = 10;
```

app.js
```js
import person from './person.js'
import prs from '.person.js'
// thanks to the default, it does not matter what name

import { baseData } from './utility.js'
import { clean } from './utility.js'
```

we need the curly braces to specifically target the things we export


not all the browsers accept this next generation js features

default export

you can add aliases

```js
import { baseData as Smth } from './utility.js'
```

you import all the constant, bundle them in a big object

```js
import * as bundled from './utility.js'
```




















