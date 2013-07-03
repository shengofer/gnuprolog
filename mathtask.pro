%Author: fergonesh
%e-mail: pashashenhofer@gmail.com

%fill database
fill(-1):-!.
fill(X):-asserta(d(X)), X1 is X-1, fill(X1).

%In the three-digit number, all numbers is odd, crossed out middle number.Number we have receiver is divisor of source number. Find all such three-digit number
task1(X):- d(A), A>0, d(B), d(C), X is 100*A+10*B+C, 1 is A mod 2 , 1 is B mod 2, 1 is C mod 2, 0 is (A*100+10*B+C) mod (A*10+C).

%Find the four-digit number that is an square, whose the first two digits are identical and the last two is identical too
task2(X):- d(A), A>2, d(B),B>1, X is (A*10+B)*(A*10+B), (X // 1000) =:= ((X mod 1000) // 100), ((X // 10) mod 10) =:= (X mod 10).

%How many do integers exist  from 1 to 1998, which are not divide on any of the numbers 6, 10, 15?
task3(X):- asserta(numb(0)).
task3(X):- d(A) , d(B), d(C), d(D), X is (A*1000+100*B+C*10+D), X>0, X<1999, (X mod 6) > 0, (X mod 10) > 0, (X mod 15) > 0, numb(V), V1 is V+1, retract(numb(V)), asserta(numb(V1)), fail.
task3(X):- numb(X), retract(numb(X)).

%Find the smallest positive integer M, which has the following property of: The sum of squares of eleven consecutive integers starting with M, an exact square?
pow2(X,Z):- Z is X*X.
task4(X):- t4(X,0).
t4(X,X):- pow2(X,C),pow2(X+1,C1),pow2(X+2,C2),pow2(X+3,C3),pow2(X+4,C4),pow2(X+5,C5),pow2(X+6,C6),pow2(X+7,C7),pow2(X+8,C8),pow2(X+9,C9),pow2(X+10,C10), T is (C+C1+C2+C3+C4+C5+C6+C7+C8+C9+C10), T1 is sqrt(T), T2 is (truncate(sqrt(T))+0.0), T1 = T2,!.
t4(X,Z):- Z1 is Z+1, t4(X,Z1).

%In the sequence 1998737 ... each digit, starting with the fifth,is equal to last digit of the sum of previous four digits. After how many digits again happen initial combinations 1998 (ie how many digits in the period the) ?
task5(X):- t5(1,9,9,8,X,0).
t5(1,9,9,8,X,X):- X\=0,!.
t5(A,B,C,D,X,I):- E is ((A+B+C+D) mod 10), A1 is B, B1 is C, C1 is D, D1 is E, I1 is I+1, t5(A1,B1,C1,D1,X,I1).
