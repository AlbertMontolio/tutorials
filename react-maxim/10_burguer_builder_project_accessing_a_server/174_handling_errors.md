#174 Handling Errors

global error handler which shows a modal with the error message

i want to show the modal no matter in which component it occurs

we need a higher component than BurgerBuilder

hoc/withErrorHandler/withErrorHandler.js

```js
import React from 'react';
import Modal from '../../components/UI/Modal/Modal';
import Aux from '../Aux/Aux';

const withErrorHandler = (WrappedComponent) => {
  return (props) => {
    return (
      <Aux>
        <Modal show>
          Something didn't work!
        </Modal>
        <WrappedComponent {...props} />
      </Aux>
    );
  }
}

export default withErrorHandler;
```

BurgerHandler.js

```js
import withErrorHandler from '../../hoc/withErrorHandler/withErrorHandler';
```

```js
export default withErrorHandler(BurgerBuilder);
```

withErrorHandler.js

we need to set show to sth, coming from the WrappedComponent

we do a class factory

```js
import React, {Component} from 'react';
import Modal from '../../components/UI/Modal/Modal';
import Aux from '../Aux/Aux';

const withErrorHandler = (WrappedComponent) => {
  return class extends Component {

    componentDidMount () {
      
    }

    render () {
      return (
        <Aux>
          <Modal show>
            Something didn't work!
          </Modal>
          <WrappedComponent {...this.props} />
        </Aux>
      );
    }
  }
}

export default withErrorHandler;
```

```js
import React, {Component} from 'react';
import Modal from '../../components/UI/Modal/Modal';
import Aux from '../Aux/Aux';

const withErrorHandler = (WrappedComponent, axios) => {
  return class extends Component {

    state = {
      error: null
    }

    componentDidMount () {
      axios.interceptors.request.use(req => {
        this.setState({error: null});
      });

      axios.interceptors.response.use(null, error => {
        this.setState({error: error});
      });
    }

    render () {
      return (
        <Aux>
          <Modal show={this.state.error}>
            {this.state.error.message}
          </Modal>
          <WrappedComponent {...this.props} />
        </Aux>
      );
    }
  }
}

export default withErrorHandler;
```

Modal.js

exposes the clicked property, when we click the backdrop

withErrorHandler.js

```js
    errorConfirmedHandler () {
      this.setState({error: null});
    }

    render () {
      return (
        <Aux>
          <Modal show={this.state.error} clicked={this.errorConfirmedHandler}>
```

```js
<Modal show={this.state.error} clicked={this.errorConfirmedHandler}>
            {this.state.error ? this.state.error.message : null}
          </Modal>
```

we are not passing axios!

BurgerBuilder.js

```js
export default withErrorHandler(BurgerBuilder, axios);
```

withErrorHandler.js

we need to return!

```js
    componentDidMount () {
      axios.interceptors.request.use(req => {
        this.setState({error: null});
        return req;
      });

      axios.interceptors.response.use(res = res, error => {
        this.setState({error: error});
      });
    }
```

backdrop is not closing

modalClosed is the correct prop

```js
<Modal show={this.state.error} modalClosed={this.errorConfirmedHandler}>
            {this.state.error ? this.state.error.message : null}
          </Modal>
```









