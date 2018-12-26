#108 Updated lifecycle hooks (react 16.3)

react wants you to avoid some hooks

willmount
willupdate
willreceiveprops

they were used incorrectly

react offers two new ones

getDerivedStateFromProps(nextProps, prevState) {}

we need to use the static keyword before

getSnapshotBeforeUpdate()


