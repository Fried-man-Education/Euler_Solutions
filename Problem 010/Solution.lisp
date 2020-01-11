#||
  Problem #: 010
  Author: Andrew Friedman
  Created: 01/11/2020
||#

(setq *total* 2) ; sum of primes found
(loop for x from 3 to 1999999 by 2 ; go from 3 to under 2 million
  do (setq *prime* t) ; assume prime
  do (loop for y from 3 to (floor (sqrt x)) by 2 ; go through all possible factors
      until (or (not *prime*) (= x y)) ; stop when not prime or max reached
      do (if (= (mod x y) 0) ; if evenly divisible
           (setq *prime* nil))) ; x isnt prime
  do (if *prime* ; if still prime
       (setq *total* (+ *total* x)))) ; total + prime
(print *total*) ; print answer :)
