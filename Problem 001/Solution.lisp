#||
  Problem #: 001
  Author: Andrew Friedman
  Created: 01/01/2020
||#

(defvar *total* 0) ; var *total* = 0
(loop for x from 1 to 999 ; for loop using x from 1 to 1000
  do (if (or (= (mod x 3) 0) (= (mod x 5) 0)) ; if x mod 3 || x mod 5
       (setq *total* (+ *total* x)))) ; total += x
(print *total*) ; print answer :)
