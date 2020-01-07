#||
  Problem #: 007
  Author: Andrew Friedman
  Created: 01/07/2020
||#

(setq *total* 1) ; how many primes found
(setq *highest* 2) ; TBD answer
(loop for x from 3 ; go from 2 to infinity
  until (= *total* 10001) ; find 10001st prime
  do (setq *prime* t) ; assume prime
  do (loop for y from 2 to x ; go through all possible factors
      until (or (not *prime*) (= x y)) ; stop when not prime or max reached
      do (if (= (mod x y) 0) ; if evenly divisible
           (setq *prime* nil))) ; x isnt prime
  do (if *prime* ; if still prime
       (progn ; multiple instructions in if
        (setq *total* (+ *total* 1)) ; total++
        (setq *highest* x)))) ; set newest prime
(print *highest*) ; print answer :)
