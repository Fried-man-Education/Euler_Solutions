#||
  Problem #: 016
  Author: Andrew Friedman
  Created: 01/13/2020
||#

(setq *number* (expt 2 1000))
(setq *number* (map 'list (lambda (c)(or (digit-char-p c) '-)) (prin1-to-string *number*))) ; converts number to list of digits

(defun sum-list (numbers) ; recursive function to add list of numbers
  (if (null numbers) ; check if list is empty
    0 ; return 0 if true
    (+ (car numbers) (sum-list (cdr numbers))))) ; return first of array and call sum for rest of aray

(print (sum-list *number*)) ; print answer :)
