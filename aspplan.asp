preserving(preserve(F)) :- fluent(F).
pre(preserve(F),F) :- fluent(F).
add(preserve(F),F) :- fluent(F).
action(A) :- preserving(A).
finalStep(k).
step(0..K-1) :- finalStep(K).

% 1.
holds(F,K) :- goal(F); finalStep(K).
:- holds(F,0); not init(F).

% 2.
happens(A,T-1) : add(A,F),validAction(A,T-1) :- holds(F,T); T > 0.

% 3.
holds(F,T) :- pre(A,F); happens(A,T); validFluent(F,T).

% 4.
deleted(F,T) :- happens(A,T); del(A,F).
:- holds(F,T+1); deleted(F,T).
usedPreserved(F,T) :- happens(A,T); pre(A,F); not del(A,F).
deletedUnused(F,T) :- happens(A,T); del(A,F); not pre(A,F).
:- {
        happens(A,T) : pre(A,F), del(A,F);
        usedPreserved(F,T);
        deletedUnused(F,T)
    } > 1;
    fluent(F);
    step(T).

% 5.
:- mutex(F,G,T); holds(F,T); holds(G,T).

#show.
#show happens(A,T) : happens(A,T), not preserving(A).
