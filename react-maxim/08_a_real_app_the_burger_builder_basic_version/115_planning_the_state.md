# 115 Planning the State

what should be a stateful or stateless component

State:
- ingredients
  {meat: 1, cheese 2}
- purchased: true or false
- totalPrice: 12.33

Where do we manage the state?

in the App.js? no

in the BurgerBuilder

these state components just affect the Burger Builder

BurgerBuilder should be a container, a stateful component

all the other components can be stateless components

App component by default is stateful, we can change it of course

