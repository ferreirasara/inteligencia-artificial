% Exercício 2

intercalada([], L, L).

intercalada([C | R], L2, [C | R2]) :-
	intercalada(L2, R, R2),
	!.

% Exercício 3


% Exercício 4
ordenada([], []).

bubble_sort(List,Sorted) :- 
    b_sort(List,[],Sorted).

b_sort([],Acc,Acc).

b_sort([H|T],Acc,Sorted) :- 
    bubble(H,T,NT,Max),
    b_sort(NT,[Max|Acc],Sorted).
   
bubble(X,[],[],X).

bubble(X,[Y|T],[Y|NT],Max) :- 
    X > Y,
    bubble(X,T,NT,Max).

bubble(X,[Y|T],[X|NT],Max) :- 
    X =< Y,
    bubble(Y,T,NT,Max).