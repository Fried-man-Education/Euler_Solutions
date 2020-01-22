#||
  Problem #: 046
  Author: Andrew Friedman
  Created: 01/22/2020
||#

(defun isRepresentable (n) ; checks if integer can be written using Goldbach's other conjecture
  (loop for prime from 1 to n ; iterate through possible primes
    do (loop while (not (isPrime prime)) ; find next available prime
         do (setq prime (+ prime 1))) ; prime += 1
    do (loop for square from 1 ; iterate through possible square candidates
         until (< n (+ prime (* 2 (* square square)))) ; check if gone over
         do (if (= n (+ prime (* 2 (* square square)))) ; check if this is correct representation
               (return-from isRepresentable t)))) ; return true
  (return-from isRepresentable nil)) ; all possible representations dont work

(defun isPrime (n) ; checks if prime (takes integer)
  (loop for x from 2 to (sqrt n) ; iterate through possible factors
   do (if (= (mod n x) 0) ; check if evenly divisible
       (return-from isPrime nil))) ; return false
  (if (= n 1) ; if n = 1
    (return-from isPrime nil) ; apparently its not prime
    (return-from isPrime t))) ; return true

(Loop for i from 3 by 2 ; start one 1st possible candidate and ignore evens
  do(if (and (not (isPrime i)) (not (isRepresentable i))) ; check if !prime and !representable
      (progn ; multiple instructions bypass
       (print i) ; print answer :)
       (return)))) ; terminate loop
