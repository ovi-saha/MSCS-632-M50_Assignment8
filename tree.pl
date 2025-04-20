% Gender facts
% These facts define the gender of each individual in the family tree.
male(john).
male(michael).
male(paul).
male(tom).

female(mary).
female(linda).
female(susan).
female(kate).

% Parent-child relationships
% These facts define who is the parent of whom.
parent(john, michael).    % John is a parent of Michael
parent(mary, michael).    % Mary is a parent of Michael

parent(john, linda).      % John is a parent of Linda
parent(mary, linda).      % Mary is a parent of Linda

parent(michael, tom).     % Michael is a parent of Tom
parent(susan, tom).       % Susan is a parent of Tom

parent(linda, kate).      % Linda is a parent of Kate
parent(paul, kate).       % Paul is a parent of Kate

% Derived Relationships

% Grandparent Rule:
% X is a grandparent of Y if X is a parent of Z and Z is a parent of Y.
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Sibling Rule:
% X and Y are siblings if they share at least one parent and are not the same person.
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% Cousin Rule:
% X and Y are cousins if their parents (P1 and P2) are siblings.
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2),
    X \= Y.

% Descendant Rule:
% Y is a descendant of X if X is a parent of Y (base case),
% or if X is a parent of Z and Z is a descendant of Y (recursive case).
descendant(X, Y) :-
    parent(X, Y).
descendant(X, Y) :-
    parent(X, Z),
    descendant(Z, Y).

% Child Rule:
% X is a child of Y if Y is a parent of X.
child(X, Y) :-
    parent(Y, X).
