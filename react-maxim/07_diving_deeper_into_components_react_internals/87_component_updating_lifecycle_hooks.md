#89 component updating lifecycle hooks

Component Lifecycle - Update (triggered by Parent)

1 - componentWillReceiveProps(nextProps)

do: sync state to props
don't: cause side-effects

2 - shouldComponentUpdate(nextProps, nextState)

may cancel updating process!

do: decide whether to continue or not
don't cause side-effects (api calls)

3 - componentWillUpdate(nextProps, nextState)
do: sync state to props
don't: cause side-effects

4 - render()
prepare & strcutre your jsx code

5 - update child component Props

6 - componentDidUpdate()
do: cause side-effects
don't: update state (triggers re-render)


