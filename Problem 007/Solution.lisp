#||
  Problem #: 007
  Author: Andrew Friedman
  Created: 01/07/2020
  Edited: 06/02/2020
||#

(defun isPrime (n) ; checks if prime (takes integer)
  (loop for x from 3 to (sqrt n) by 2 ; iterate through possible factors
    do (if (= (mod n x) 0) ; check if evenly divisible
         (return-from isPrime nil))) ; return false
  (return-from isPrime t)) ; return true

(setq *total* 1) ; how many primes found TODO: check
(setq *highest* 3) ; TBD answer
(loop for x from 3 by 2 ; go from 3 to infinity += 2
  until (= *total* 10001) ; find 10001st prime
  do (if (isPrime x) ; check if x is prime
       (progn ; multiple instructions in if
         (setq *total* (+ *total* 1)) ; total++
         (setq *highest* x)))) ; set newest prime
(print *highest*) ; print answer :)
