#||
  Problem #: 002
  Author: Andrew Friedman
  Created: 01/02/2020
||#

(setq *total* 0) ; total = 0
(setq *previous* 1) ; previous = 1
(setq *curr* 1) ; curr = 1 (starting fibonacci)
(loop while (< *curr* 4000000) ; while curr < 4 million
  do (if (= (mod *curr* 2) 0) ; if curr even
        (setq *total* (+ *total* *curr*))) ; add curr to total
  (setq *temp* *previous*) ; store previous value
  (setq *previous* *curr*) ; set previous to curr
  (setq *curr* (+ *curr* *temp*))) ; curr += temp
(print *total*) ; print answer :)
