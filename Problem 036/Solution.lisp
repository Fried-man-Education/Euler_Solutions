#||
  Problem #: 036
  Author: Andrew Friedman
  Created: 01/19/2020
||#

(defun checkPalindrome (n) ; checks if input is palindrome
  (setq *isPalindrome* t) ; assume true until proven otherwise
  (setq *nString* (write-to-string n)) ; convert input to string
  (setq *nLength* (length *nString*)) ; get length of string
  (loop for x from 0 to (- *nLength* 1) ; iterate through chars in string
    do (if (not (eq (char *nString* x) (char *nString* (- (- *nLength* 1) x))))
         (setq *isPalindrome* nil))) ; found two non twin digits
  *isPalindrome*) ; return verdict as bool

(defun decimalToBinary (n) ; converts base 10 number to base 2
  (setq *binary* 0) ; init binary to 0
  (loop while (/= n 0) ; while n isnt 0
    do (progn ; multiple instructions bypass
         (setq *divisor* 0) ; init divisor (x) to 0 for 2^0
         (loop while (>= n (expt 2 (+ *divisor* 1))) ; find max 2^x value
           do(setq *divisor* (+ *divisor* 1))) ; x++
         (setq *binary* (+ *binary* (expt 10 *divisor*))) ; binary += 10^x
         (setq n (- n (expt 2 *divisor*))))) ; n -= 2^x
  *binary*) ; return base 2 version

(setq *total* 0) ; init total to 0
(loop for i from 1 to 999999 ; base 10 iteration up to 10 million
  do(if (and (checkPalindrome i) (checkPalindrome (decimalToBinary i))) ; check if base 10 and base 2 of i are palindromes
      (setq *total* (+ *total* i)))) ; total += i
(print *total*) ; print answer :)
