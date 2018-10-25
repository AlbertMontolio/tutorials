# Part III: RSpec Core

runs your specs

we will see how to organize your specs, how to share code

- how to arrange your specs into meaningful groups
- how to "get the words right" with names for your groups
- where to push shared setup and teardown code

# Chapter 7: Structuring code examples

every spec is part of an example group

a group has multiple purposes:

- gives a logical structure for understanding how individual examples relate to one another
- describes the context --such as a particular class, method, or situation) of what you're testing.
- Provides a Ruby class to act as a scope for your shared logic, such as hooks, let definitions and helper methods.
- runs common setup and teardown code shared by several examples.

# The basics

- `describe` creates an example group
- `it` creates a single example

