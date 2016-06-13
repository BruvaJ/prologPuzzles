fireball(X):- X = [A1,A2,B1,B2,B3,B4,C1,C2,C3,C4,D1,D2,D3,D4,E1,E2],
	X ins 1..9,
	sum([A1, A2], #=, 5), sum([B1,B2,B3,B4], #=, 29),
	sum([C1,C2], #=, 14), sum([C3,C4],#=, 4),
	sum([D1,D2,D3,D4], #= , 16), sum([E1,E2], #=, 7), 
	sum([B1,C1], #=,16), sum([A1,B2,C2,D1],#=, 18),
	sum([A2,B3], #= , 13), sum([D2,E1], #=, 14),
	sum([B4,C3,D3,E2], #=, 11), sum([C4,D4], #= , 3),
	labeling([],X).