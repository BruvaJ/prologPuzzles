:- use_module(library(clpfd)).

:- consult(spec).

%kakuro
kakuro:- 
	startMatrix(M),	findall([R,C,L,S], across(R,C,L,S), AC),
	setConstraints(AC, M), findall([C,R,L,S], down(R,C,L,S), DC),
	transpose(M,TM), setConstraints(DC, TM), findall([R,C],
	black(R,C), I), setBlack(M, I), labelRow(M), printResultAux(M).

%startMatrix(Variable)
startMatrix(M):-
	length(M, 12), makeMatrix(M).

%makeMatrix(List)	
makeMatrix([]).
makeMatrix([H1|T]):-
	length(N,12), H1 = N, makeMatrix(T).

%setConstraints(Constraints, Matrix)
%TR-TargetRow
setConstraints([],_).
setConstraints([[R,C,L,S]|T],M):- nth1(R,M,TR), subSection(TR, C, L, CN),
CN ins 1..9, all_different(CN),sum(CN, #= , S), setConstraints(T,M).
	
%subSection(List, Index, Length, ContiguousNumbers)
subSection(_,_,0,[]).
subSection(TR,C,L,[E|CN]):-
	nth1(C,TR,E),NC is C+1, NL is L-1, subSection(TR,NC,NL,CN).
	
%setBlack(Matrix,Indices)
setBlack(_,[]).
setBlack(M,[[R,C]|T]):-
	nth1(R, M, TR), nth1(C, TR, E), E in 0, setBlack(M,T).

%labelRow(Matrix)
labelRow([]).
labelRow([H|T]):-
	labeling([],H), labelRow(T).
	
%printResultAux(Matrix)
printResultAux([]).
printResultAux([H|T]):-
	printResult(H), nl, printResultAux(T).

%printResult(List)
printResult([]).
printResult([H|T]):-
	(writeStar(H);print(H)), !, printResult(T).

%writeStar(Integer)
writeStar(H):- H = 0, print(*).