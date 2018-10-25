Chapter 3: The RSpec Way

specs take time

# What your specs are doing for you

- Creating confidence
- eliminating fear
- enabling refactoring
- guiding design
- sustainability
- documenting behavior
- transforming your workflow
- it's fun

# Comparing costs and benefits

- writing specs take time
- running the entire suite should be quick
- getting feedback from a single example, immediately
- Dealing with failure. avoid specs that break, if the code works
- don't overdo it

>I get paid for code that works, not for tests, so my philosophy is to test as little as possible to reach a given level of confidence...

- Deciding what not to test
user interface changes rapidly

# Different types of Specs

3 types of specs

- acceptance: does the whole system work?
- unit: do our objects do the right thing, are they convenient to work with?
- integration: does our code work against code we can't change?

## Acceptance Specs

they describe a feature in an end-to-end, black-box style that exercises the entire system. Hard to write, slow, but they provide a lot of coincidence, bor large-scale refactoring

## Unit Specs

focus on individual units of code (object, method). They run very quick

On the other hand, they are typically too low-leve to be of much use during large-scale refactoring

## Integration Specs

are somewhere between these two extremes. Code that interacts with an external service --such as a database or third-party REST API--should have an integration spec.

any nontrivial software project depends on other libraries.

- your unit specs would have to isolate your code from any third-party dependency.
- your (comparetively slow) integration specs would be allowed to hit third-party code indirectly.

if your ruby class sth not from the network, quickly, its ok to call it

## Guidelines

focus on the happy path
















































