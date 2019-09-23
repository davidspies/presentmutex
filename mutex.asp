nonmutexFluent(F,G,0) :- init(F); init(G).
nonmutexAction(A,B,T) :-
    nonmutexFluent(F,G,T) : pre(A,F),pre(B,G);
    not del(A,G) : pre(B,G), A != B;
    not del(B,F) : pre(A,F), A != B;
    not del(A,G) : add(B,G);
    not del(B,F) : add(A,F);
    action(A); action(B); step(T).
nonmutexFluent(F,G,T+1) :- add(A,F); add(B,G); nonmutexAction(A,B,T).

validAction(A,T) :- nonmutexAction(A,A,T).
validFluent(F,T) :- nonmutexFluent(F,F,T).

mutex(F,G,T) :- validFluent(F,T); validFluent(G,T); not nonmutexFluent(F,G,T).
mutexAct(A,B,T) :- validAction(A,T); validAction(B,T); not nonmutexAction(A,B,T).
