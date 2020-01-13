#||
  Problem #: 012
  Author: Andrew Friedman
  Created: 01/12/2020
||#

(setq *triangleNumber* 0) ; init triangle to 0
(setq *divisorCount* 0) ; init divisors to 0
(loop for x from 1 ; start from first triangle number
  until (> *divisorCount* 500) ; check if answer found
  do (progn ; multiple instructions
      (setq *triangleNumber* (+ *triangleNumber* x)) ; find next triangle number
      (setq *divisorCount* 0) ; set divisors to 0
      (loop for y from 1 to (sqrt *triangleNumber*) ; loop through potential divisors
            do (if (= (mod *triangleNumber* y) 0) ; check if evenly divisible
                   (if (= y (sqrt *triangleNumber*)) ; check if square root
                      (setq *divisorCount* (+ *divisorCount* 1)) ; square root
                      (setq *divisorCount* (+ *divisorCount* 2))))) ; not square root
      (if (> *divisorCount* 500) ; if over 500 divisors
        (print *triangleNumber*)))) ; print answer :)
