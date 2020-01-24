#||
  Problem #: 052
  Author: Andrew Friedman
  Created: 01/24/2020
||#

(defun orderString (n) ; orders string by char values
  (return-from orderString (sort n #'char-lessp))) ; returns as string

(loop for x from 1 ; iterate through possible numbers
  do (progn ; multiple instructions bypass
      (if (> (* x 6) (expt 10 (length (write-to-string x)))) ; check if x is no longer candidate
        (setq x (expt 10 (length (write-to-string x))))) ; set to next 10^y
      (setq *isAnswer* t) ; assume x is answer
      (loop for a from 2 to 6 ; iterate through multiples
       until (not *isAnswer*) ; stop when found as not answer
       do(if (not (string= (orderString (write-to-string x)) (orderString (write-to-string (* x a))))) ; check if multiple has !same digits
             (setq *isAnswer* nil))) ; if not same then set to false
      (if *isAnswer* ; if still true
       (progn ; multiple instruction bypass
        (print x) ; print answer :)
        (return))))) ; terminate loop
