% Exercício 1
pertence(X, [X|_]).
pertence(X, [_ | R]) :-
     pertence(X, R).

insere(X, [], [X]).
insere(X, L, [X | L]).

elem_repetidos([], _).
elem_repetidos([C | R], [C|L]) :-
    pertence(C, R),
    insere(C, L, [C | L]),
    elem_repetidos(R, L),
    !.
elem_repetidos([C | R], L):-
    not(pertence(C, R)),
    elem_repetidos(R, L),
    !.

% Exercício 2
intercalada([], L, L).
intercalada([C | R], L2, [C | R2]) :-
	intercalada(L2, R, R2),
	!.

% Exercício 3
insercao_ord(X, [], [X]).
insercao_ord(X, [X1|L1], [X, X1|L1]):-
    X=<X1,
    !.
insercao_ord(X, [X1|L1], [X1|L]):-
    insercao_ord(X, L1, L).

% Exercício 4
ordena([], []).
ordena([X|L], S):- 
    ordena(L, S1),
    insercao_ord(X, S1, S).

% Exemplos:

% elem_repetidos([1,1,2,2],A)
%   A = [1, 2]

% intercalada([1,3,5],[2,4],B)
%   B = [1, 2, 3, 4, 5]

% insercao_ord(3, [1,2,4,5],C)
%   C = [1, 2, 3, 4, 5]

% ordena([4,2,3,1],D)
%   D = [1, 2, 3, 4]