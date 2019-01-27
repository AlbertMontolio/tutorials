#205 Handling the 404 Case (Unknown Routes)

when we access an unknown route

any unknown route, we don't use path

```js
<Switch>
    {this.auth ? <Route path="/new-post" component={NewPost} /> : null}
    <Route path="/posts" component={Posts} />
    <Route render={() => <h1>Not found</h1>} />
    {/* <Redirect from="/" to="/posts" /> */}
    {/* <Route path="/" component={Posts} /> */}
</Switch>
```

this does not work together with redirecting from the root route

cuz / catches all
