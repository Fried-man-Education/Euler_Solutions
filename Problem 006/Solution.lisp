#||
  Problem #: 006
  Author: Andrew Friedman
  Created: 01/06/2020
||#

(setq *sumSquare* 0) ; init sum of the squares at 0
(setq *squareSum* 0) ; init square of the sum at 0
(loop for x from 1 to 100 ; iterate through first 100 natural numbers
  do (setq *sumSquare* (+ *sumSquare* (expt x 2)))) ; add x^2 to sum
(loop for x from 1 to 100 ; iterate through first 100 natural numbers
  do (setq *squareSum* (+ *squareSum* x))) ; add x to sum
(setq *squareSum* (expt *squareSum* 2)) ; set sum to sum^2
(print (- *squareSum* *sumSquare*)) ; print answer :)
