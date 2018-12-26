#94 understanding react's dom updating strategy

how react updates the real dom, the dom in the browser

render() is called does not render to the dom

it's a suggestion on how html should look like at the end

that's why we use 

shouldComponentUpdate()

to prevent unnecessary renders

first of all, it compares virtual doms

old virtual dom, with re-rendered virtual dom

a virtual dom,is a js representation of the dom

react keeps two copies of the dom

the re-render virtual dom gets created by the render method

render() it makes a comparison. if react finds differences, it just updates these differences in the real DOM

if no differences are found, react does not touch the real dom. but the render was executed, the comparison was made

accessing the dom is very slow! that's why the virtual dom was created


