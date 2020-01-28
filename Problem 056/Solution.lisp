#||
  Problem #: 056
  Author: Andrew Friedman
  Created: 01/27/2020
||#

(defun sumOfDigits (n) ; finds sum of chars in number
  (setq n (write-to-string n))
  (setq *sum* 0) ; init to 0
  (loop for a from 0 to (- (length n) 1) ; iterate through chars
    do (setq *sum* (+ *sum* (parse-integer (subseq n a (+ a 1)))))) ; add char x to sum
  (return-from sumOfDigits *sum*)) ; return sum

(setq *max* 0) ; init max sum of digits to 0
(loop for a from 0 to 100 ; iterate through possible As
  do (loop for b from 0 to 100 ; iterate through possible Bs
       do (if (> (sumOfDigits (expt a b)) *max*) ; check if sum is greater than max
            (setq *max* (sumOfDigits (expt a b)))))) ; set new max
(print *max*) ; print answer :)
