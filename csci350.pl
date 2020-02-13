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

%When Head is a list.
sum-up-numbers-general([Head|Tail], N):-
is_list(Head),
sum-up-numbers-general(Tail, TailSum),
sum-up-numbers-general(Head, HeadSum),
N is HeadSum + TailSum.

%When head is not a list or a number
sum-up-numbers-general([HEAD|TAIL], N):-
\+ number(HEAD),
\+ is_list(HEAD),
sum-up-numbers-general(TAIL, TailSum),
N is TailSum.


%Question 3
%min-above-min
%Predicate name; min-above-min
%Parameter: L1 and L2 which are simple list and N which is number
%Returns true if N is the Minimum of L1 which is greater than minimum of L2

%Base case
if L2 is empty and L1 only has one element then that would be the value

min-above-min([M], [], M) :-
number(A).

%Second case when the second list is empty then return the minium valu from the first list
min-above-min(L1, L2, N) :-
    length(L2, 0),
    min-val(L1, N).




