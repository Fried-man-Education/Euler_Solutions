
#||
  Problem #: 063
  Author: Andrew Friedman
  Created: 01/28/2020
||#

(setq *total* 0) ; init total to 0
(block calculate ; identifies section of code
  (loop for n from 1 ; i^n where n is going infinitely and is expt
    do (loop for i from 1 to 9 ; all singular digits since >9 !works
          do (progn ; multiple instruction bypass
              (if (= (length (write-to-string (expt i n))) n) ; check if digit count == expt n
                (setq *total* (+ *total* 1)) ; add to total
                (if (= i 9) ; check if highets bound has been reached
                  (progn ; multiple instruction bypass
                    (print *total*) ; print answer :)
                    (return-from calculate)))))))) ; break nested loops
