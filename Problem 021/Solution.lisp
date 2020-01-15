#||
  Problem #: 021
  Author: Andrew Friedman
  Created: 01/14/2020
||#

(defun amicable (n) ; function to find n's amicable number
  (setq divisors (list)) ; initial list to nil
  (loop for x from 1 to (sqrt n) ; iterate through possible divisors
    do (if (= (mod n x) 0) ; if evenly divisible
         (progn ; multiple instructions
           (push x divisors) ; add even divisor to list
           (if (and (/= x (sqrt n)) (/= x 1)) ; if not root and not n
             (push (/ n x) divisors))))) ; add other divisor to list
  (apply '+ divisors)) ; returns sum of divisors

(setq *sum* 0) ; initially assume sum to 0
(loop for i from 1 to 9999 ; iterate for numbers under 10000
  do(if (and (= i (amicable (amicable i))) (/= i (amicable i))) ; if i is amicable
      (setq *sum* (+ *sum* i)))) ; sum += i

(print *sum*) ; print answer :)
