#||
  Problem #: 037
  Author: Andrew Friedman
  Created: 01/19/2020
||#

(defun isPrime (n) ; checks if prime (takes integer)
  (loop for x from 2 to (sqrt n) ; iterate through possible factors
    do (if (= (mod n x) 0) ; check if evenly divisible
         (return-from isPrime nil))) ; return false
  (if (= n 1) ; if n = 1
    (return-from isPrime nil)) ; apparently its not prime
  (return-from isPrime t)) ; return true

(defun takeLeftDigit (n) ; takes left digit off integer
  (setq n (write-to-string n)) ; convert n from int to string
  (if (/= (length n) 1) ; if not empty
    (parse-integer (subseq n 1 (length n))) ; return number without left digit
    (return-from takeLeftDigit nil))) ; return "empty" value

(defun takeRightDigit (n) ; takes right digit off integer
  (setq n (write-to-string n)) ; convert n from int to string
  (if (/= (length n) 1) ; if not empty
    (parse-integer (subseq n 0 (- (length n) 1))) ; return number without right digit
    (return-from takeRightDigit nil))) ; return "empty" value

(defun isTruncatablePrime (n) ; checks if number is truncatable prime
  (setq *temp* (takeLeftDigit n)) ; take left digit off temp
  (loop while (not (eq *temp* nil)) ; while temp not empty
    do (if (not (isPrime *temp*)) ; check if temp is not prime
        (return-from isTruncatablePrime nil)) ; return false
    do (setq *temp* (takeLeftDigit *temp*))) ; take left digit off temp
  (setq *temp* (takeRightDigit n)) ; take right digit off temp
  (loop while (not (eq *temp* nil)) ; while temp not empty
    do (if (not (isPrime *temp*)) ; check if temp is not prime
        (return-from isTruncatablePrime nil)) ; return false
    do (setq *temp* (takeRightDigit *temp*))) ; take right digit off temp
  (return-from isTruncatablePrime t)) ; return true

(setq *total* 0) ; init total to 0
(setq *counted* 0)  ; init count to 0
(loop for i from 11 by 2 ; start from possible truncatable prime
  until (= *counted* 11) ; stop when 11th truncatable prime found
  do (if (isPrime i) ; check if i is prime
       (if (isTruncatablePrime i) ; check if i is truncatable prime
         (progn ; multiple instruction bypass
           (setq *total* (+ *total* i)) ; add i to total
           (setq *counted* (+ *counted* 1)))))) ; counted++
(print *total*) ; print answer :)
