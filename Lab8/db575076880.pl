/*Name: David Burneau		*/
/*Student Number: 575076880	*/
/*Calling program		*/
/*max([3, 19, 2, ... 70], X).	*/

/*instantiation			*/
max([H],H).

/*if head is bigger than tails max, return head */
max([H|T],H):- max(T,Y), H >=Y.

/*otherwise return tails max			*/
max([H|T],N):- max(T,N), N > H.
