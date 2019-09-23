nonmutexFluent(F,G) :- init(F); init(G).
nonmutexAF(A,F) :- add(A,F).
nonmutexAF(A,F) :- action(A); fluent(F); not del(A,F); nonmutexFluent(F,G) : pre(A,G).
nonmutexFluent(F,G) :- nonmutexAF(A,F); add(A,G).
nonmutexFluent(F,G) :- nonmutexAF(A,G); add(A,F).

mutex(F,G) :- fluent(F); fluent(G); not nonmutexFluent(F,G).
