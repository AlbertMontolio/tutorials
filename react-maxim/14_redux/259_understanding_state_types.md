

#259 Understanding State Types

Types of State

should every state be handled by redux?
depending on the size of the application

redux shouldn't manage all the states

type: local ui state
example: show / hide backdrop
use redux? mostly handled within components

type: Persistent state
example: all users, all posts, ...
use redux?: stored on server, relevant slice managed by redux

redux is not a replacement for a db, when user refreshes page, the state is gone

type: client state
example: is authenticated? filteres set by User, ...
use redux? managed via redux


