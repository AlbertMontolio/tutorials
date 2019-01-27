#176 Removing old interceptors

withErrorHandler.js

we have our interceptors in componentWillMount

this component is meant to wrap different components

when we do that, we will call componentWillMount again and again

that means, the interceptors will live, although we are mounting another component

when component is unmounted, we want to remove interceptors

```js
    componentWillMount () {
      this.reqInterceptor = axios.interceptors.request.use(req => {
        this.setState({error: null});
        return req;
      });

      this.resInterceptor = axios.interceptors.response.use(res => res, error => {
        this.setState({error: error});
      });
    }

    componentWillUnmount () {
      axios.interceptors.request.eject(this.reqInterceptor);
      axios.interceptors.response.eject(this.resInterceptor);
    }
```


