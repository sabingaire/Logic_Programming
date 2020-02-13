%Sabin Gaire
%@02859054
%This is the assignment for CSCI 350 class
%This assignment is about Logic Programming.

%The sum-up-numbers- simple will sum up the numbers
%If L=[], N=0

sum-up-numbers-simple([], 0).
%If head is number, then compute sum

sum-up-numbers-simple([HEAD|TAIL], N):-
number(HEAD),
sum-up-numbers-simple(TAIL, TailSum),
N is HEAD + TailSum.


