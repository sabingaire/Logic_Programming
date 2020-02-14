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
%if L2 is empty and L1 only has one element then that would be the value

min-above-min([M], [], M) :-
number(M).

%Second case when the second list is empty then return the minium valu from the first list
min-above-min(L1, L2, N) :-
    length(L2, 0),
    minimum-value(L1, N).

%If head is number and is greater than the minimum value

min-above-min([Head|Tail], L2, Head) :-
    number(Head),
    minimum-value(L2, MinL),
    MinL < Head,
    larger-number(Tail, MinL, Head, Head).

%Else, the answer is the predicate with tail list
min-above-min([_|Tail], L2, Ans) :-
    min-above-min(Tail, L2, Ans).

%helper predicate:
%minimum-value and larger-number

%minimum value is the predicate which takes a list and returns the minimum element
%First the base case where there is only one number in the list then return the list
%The base case returns the number M
minimum-value([M], M) :- number(M).

%The second case where the first element in the list is less than the second element
%We consider the case where the first elemenet is equal as well.
minimum-value([Head, K|T], N) :-
    number(Head),
    number(K),
    Head =< K,
    minimum-value([Head|T], N).

%The second element is smaller

minimum-value([Head, K|T], N) :-
    number(Head),
    number(K),
    K < Head,
    minimum-value([K|T], N).

%The case when the given second element is not numeric
minimum-value([Head, _|T], N) :-
    number(Head),
    minimum-value([Head|T], N).

%otherwise escape it
minimum-value([_|T], N) :-
    minimum-value(T, N).

%next Helper function is larger-number
%This takes list and one constant and another number within list and gives the number which is greater than the constant

larger-number([], _, Num, Num).

%If the head is greater than constant and less than the number than that is the required target
larger-number([Head|T], Cons, Num, Head) :-
    number(Head),
    Head > Cons,
    Head < Num,
    larger-number(T, Cons, Head, Head).

%otherwise
larger-number([_|T], Cons, Num, Ans) :-
larger-number(T, Cons, Num, Ans).


%For question 4 the predicate is common-unique-elements
%In the predicate, it will take two list s and check for the unique common items
%This predicate will take other three helpful predicate one which will take out the nested loop, other removing the duplicates and other intersecting
$First the

%if list is empty, then no need to break
nested-break([], []).

