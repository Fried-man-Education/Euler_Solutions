#||
  Problem #: 035
  Author: Andrew Friedman
  Created: 01/17/2020
||#

(defun isCircularPrime (n) ; checks if circular prime (takes string)
  (loop for x from 1 to (length n) ; iterates through possible combinations
    do (if (not (isPrime (parse-integer n))) ; check if not prime
         (return-from isCircularPrime nil)) ; return false
    do (setq n (rotateNumber n))) ; rotate number's digits
  (return-from isCircularPrime t)) ; return true

(defun rotateNumber (n) ; takes string
  (concatenate 'string (subseq n 1 (length n)) (subseq n 0 1))) ; cdr + car

(defun isPrime (n) ; checks if prime (takes integer)
  (loop for x from 2 to (sqrt n) ; iterate through possible factors
    do (if (= (mod n x) 0) ; check if evenly divisible
         (return-from isPrime nil))) ; return false
  (return-from isPrime t)) ; return true

(setq *total* 0) ; init total to 0
(loop for a from 2 to 999999 ; iterate through possible circle primes
  do(if (isCircularPrime (write-to-string a)) ; check if circular prime
      (setq *total* (+ *total* 1)))) ; total++
(print *total*) ; print answer :)
