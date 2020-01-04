#||
  Problem #: 003
  Author: Andrew Friedman
  Created: 01/03/2020
||#

(setq *factors* (list 0)) ; init list
(loop for x from 1 to (ceiling (sqrt 600851475143)) ; go from 1 to sqrt
  do (if (= (mod 600851475143 x) 0) ; if factor found
       (push x (cdr (last *factors*))))) ; add new factor to end

(setq *max* 0) ; set max prime factor to  0
(loop for x in *factors* ; foreach item in list
  do (setq *prime* t) ; assume number is prime until proven
  (loop for i from 2 to (- x 1) ; loop from 2 to i--
    do (if (= (mod x i) 0) ; if factor found
         (setq *prime* nil))) ; set to !prime
  (if (eq *prime* t) ; if prime
    (setq *max* x))) ; found new highest prime
(print *max*) ; print answer :)
