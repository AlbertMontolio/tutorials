#203 Using the History Prop to Redirect (Replace)

we get the history prop, if the component is inside BrowserRouter

we can change the page after the post, without changing the state

```js
axios.post('/posts', post)
    .then(response => {
        console.log(response);
        this.props.history.push('/posts');
        // this.setState({submitted: true});
    });
```

with push, we can go back to where we were, cuz it pushes it into the stack. redirect does not

we could also use replace instead of push


