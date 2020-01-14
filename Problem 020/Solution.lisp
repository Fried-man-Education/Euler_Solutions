#||
  Problem #: 020
  Author: Andrew Friedman
  Created: 01/14/2020
||#

(defun factorial (n) ; recursive function to find factorial value of n!
  (if (= n 0) ; if n is 0
      1 ; return 0! which is 1
      (* n (factorial (- n 1))))) ; return n * (n - 1)! using func call

(setq *number* (factorial 100)) ; find 100! and set to variable
(setq *number* (map 'list (lambda (c)(or (digit-char-p c) '-)) (prin1-to-string *number*))) ; converts number to list of digits

(defun sum-list (numbers) ; recursive function to add list of numbers
  (if (null numbers) ; check if list is empty
    0 ; return 0 if true
    (+ (car numbers) (sum-list (cdr numbers))))) ; return first of array and call sum for rest of aray

(print (sum-list *number*)) ; print answer :)
