validFluent(F,0) :- init(F).
validAction(A,T) :- validFluent(F,T) : pre(A,F); action(A); step(T).
validFluent(F,T+1) :- validAction(A,T); add(A,F).
