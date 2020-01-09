#||
  Problem #: 009
  Author: Andrew Friedman
  Created: 01/09/2020
||#

(loop for b from 0 to 1000 ; iterate through all possible numbers
  do (loop for a from 0 to 999 ; iterate through all possible numbers
       do (if (> b a) ; check for first rule of pythag triplets
           (progn ; multiple instructions bypass
             (setq *c* (sqrt (+ (* a a) (* b b)))) ; c = sqrt(a^2+b2)
             (if (and (= (+ a (+ b *c*)) 1000) (> *c* b)) ; check if sum is 1000 and 2nd rule true
               (print (* a (* b *c*)))))))) ; print answer :)
