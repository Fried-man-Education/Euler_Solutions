#||
  Problem #: 005
  Author: Andrew Friedman
  Created: 01/05/2020
||#

(loop for x from 20 by 20 ; iterate by 20 forever
  do (setq *divisible* t) ; assume envenly divisible
  do (loop for y from 2 to 20 ; iterate through divisible factors
       until (not *divisible*) ; iterate until found non-evenly divisible
       do(if (/= (mod x y) 0) ; check if divisible with no remainder
           (setq *divisible* nil))) ; not eenly divisible
  do(if *divisible* ; if still found divisible
      (progn ; used to run multiple instructions
       (print x) ; print answer :)
       (loop-finish)))) ; break main loop
