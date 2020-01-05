#||
  Problem #: 004
  Author: Andrew Friedman
  Created: 01/04/2020
||#

(defun checkPalindrome (n) ; checks if input is palindrome
  (setq *isPalindrome* t) ; assume true until proven otherwise
  (setq *nString* (write-to-string n)) ; convert input to string
  (setq *nLength* (length *nString*)) ; get length of string
  (loop for x from 0 to (- *nLength* 1) ; iterate through chars in string
    do (if (not (eq (char *nString* x) (char *nString* (- (- *nLength* 1) x))))
         (setq *isPalindrome* nil))) ; found two non twin digits
  *isPalindrome*) ; return verdict as bool

(setq *max* 0) ; start assuming lowest possible palindrome
(loop for a from 100 to 999 ; iterate through all 3 digit numbers
  do (loop for b from 100 to 999 ; iterate through all 3 digit numbers
      do (if (and (> (* a b) *max*) (checkPalindrome(* a b))) ; if new candidate
            (setq *max* (* a b))))) ; found new palindrome product > max
(print *max*) ; print answer :)
