%Sabin Gaire
%@02859054
%This is the assignment for CSCI 350 class
%This assignment is about Logic Programming.

%The sum-up-numbers- simple will sum up the numbers
%If L=[], N=0

sum-up-numbers-simple([], 0).
%If head is number, then compute sum
%Name of the Predicate: sum-up-numbers-simple
%Paramters: P is list and N is  number

sum-up-numbers-simple([Head|Tail], N):-
number(Head),
sum-up-numbers-simple(Tail, TailSum),
N is Head + TailSum.

% If Head is a non-number, skip element.
sum-up-numbers-simple([Head|Tail], N):-
    \+ number(Head),
    sum-up-numbers-simple(Tail, TailSum),
    N is TailSum.

%Question 2
%This is the sum of the numbers in general where sum of nested value will be caluculated
% If L = [], N = 0
%Name of the Predicate:sum-up-numbers-general
%Paramaters: It takes L and N as question 1

sum-up-numbers-general([], 0).

% If Head is a number, add to sum.
sum-up-numbers-general([Head|Tail], N):-
    number(Head),
    sum-up-numbers-general(Tail, TailSum),
    N is Head + TailSum.





