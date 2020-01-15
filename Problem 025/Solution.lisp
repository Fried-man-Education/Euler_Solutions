#||
  Problem #: 025
  Author: Andrew Friedman
  Created: 01/15/2020
||#

(setq *index* 1) ; starting index
(setq *previous* 0) ; set previous to 0 for #1 fib
(loop for current from 1 by 0 ; basically a while loop that defines a var
  until (= (length (write-to-string current)) 1000) ; break when digit length is 1000
  do (progn ; multiple instructions
      (setq *temp* current) ; save value for later
      (setq current (+ current *previous*)) ; find next fib number
      (setq *previous* *temp*) ; put current value in previous
      (setq *index* (+ *index* 1)))) ; index++
(print *index*) ; print answer :)
