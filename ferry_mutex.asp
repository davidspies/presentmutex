isMultiClique(0).
isSingletonPartIn(at(c2,a),0).
isSingletonPartIn(on(c2,ferry),0).
isSingletonPartIn(at(c2,b),0).
isMultiClique(1).
isSingletonPartIn(at(c1,a),1).
isSingletonPartIn(on(c1,ferry),1).
isSingletonPartIn(at(c1,b),1).
isMultiClique(2).
isSingletonPartIn(on(c3,ferry),2).
isSingletonPartIn(empty_ferry,2).
isSingletonPartIn(on(c1,ferry),2).
isSingletonPartIn(on(c2,ferry),2).
isMultiClique(3).
isSingletonPartIn(at(c3,a),3).
isSingletonPartIn(at(c3,b),3).
isSingletonPartIn(on(c3,ferry),3).
mutex(at_ferry(a),at_ferry(b)).
