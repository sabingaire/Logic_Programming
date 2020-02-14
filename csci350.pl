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
minimum-value([Head], MIN_VAL) :- number(Head),Min_Val is Head.

%also return false if last element is non numeric.
minimum-value([Head]):-
\+number(Head).

% If multiple elements, compare first two if both are number
minimum-value([Head,NECK|TAIL], MIN_VAL):-
    number(Head),
    number(NECK),
    HEAD > NECK,
    minimum-value([NECK|TAIL], MIN_VAL).

minimum-value[HEAD,NECK|TAIL], MIN_VAL):-
    number(Head),
    number(NECK),
    Head =< NECK,
    minimum-value([Head|TAIL], MIN_VAL).
%The second element is smaller

minimum-value([Head, K|T], N) :-
    number(Head),
    number(K),
    K < Head,
    minimum-value([K|T], N).

%if HEAD is not in numeric form
minimum-value([Head,NECK|TAIL], MIN_VAL):-
    \+ number(Head),
    number(NECK),
    minimum-value([NECK|TAIL], MIN_VAL).

% if NECK is non-numeric
minimum-value([Head,NECK|TAIL], MIN_VAL):-
    number(Head),
    \+(number(NECK)),
    minimum-value([Head|TAIL], MIN_VAL).

minimum-value([Head, NECK|TAIL], MIN_VAL):-
\+ number(Head),
\+(number(NECK)),
minimum-value(TAIL, MIN_VAL).

%next Helper function is larger-number
%This takes list and one number and return all greater that number

larger-number([], _,[]) :- !,

%If the head is greater than number and it is number
larger-number([Head|TAIL], X, L) :-
    number(Head),
    Head > X,
    larger-number(TAIL, X, L1),
    append([Head], L1, L).

%otherwise
larger-number([_|T], Cons, Num, Ans) :-
larger-number(T, Cons, Num, Ans).


%For question 4 the predicate is common-unique-elements
%In the predicate, it will take two list s and check for the unique common items
%This predicate will take other three helpful predicate one which will take out the nested loop, other removing the duplicates and other intersecting
%First the list has to broken into simple list

nest-breaker([], []).

% if HEAD is not a list.
nest-breaker([HEAD|TAIL], L2):-
    \+ is_list(HEAD),
    nest-breaker(TAIL, FlatTail),
    append([HEAD], FlatTail, L2).

% if HEAD is list.
nest-breaker([HEAD|TAIL], L2):-
    is_list(HEAD),
    nest-breaker(TAIL, FlatTail),
    nest-breaker(HEAD, FlatHead),
    append(FlatHead, FlatTail, L2).


% my-intersection(L1, L2) returns a list which is intersection of
% two simple lists L1 and L2.
%This will enable us to help in finding common intersection

% empty list base case.
my-intersection([],_,[]).

% if common member in both lists.
my-intersection([HEAD|TAIL1],M,[HEAD|TAIL2]) :-
    member(HEAD,M),
    my-intersection(TAIL1,M,TAIL2).

% if not common member.
my-intersection([HEAD|TAIL],M,Z) :-
    \+ member(HEAD,M),
    intersection(TAIL,M,Z).


% common-unique-elements(L1, L2, L) returns true if N is a simple list
% of the items that appear in both L1 and L2

% empty list base case.
common-unique-elements([], _, []).

% for non-empty case, flatten and return intersection of two lists.
common-unique-elements(L1, L2 , L):-
    nest-breaker(L1, N1),
    nest-breaker(L2, N2),
    remove_duplicates(N1,M1),
    remove_duplicates(N2,M2),
    my-intersection(M1, M2, L).

%The remove duplicates remove the duplicates from a given list

remove_duplicates([],[]).

remove_duplicates([H | T], List) :-
     member(H, T),
     remove_duplicates( T, List).

remove_duplicates([H | T], [H|T1]) :-
      \+member(H, T),
      remove_duplicates( T, T1).





















