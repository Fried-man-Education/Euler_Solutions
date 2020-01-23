#||
  Problem #: 048
  Author: Andrew Friedman
  Created: 01/23/2020
||#

(setq *total* 0) ; init total to 0
(loop for x from 1 to 1000 ; iterate up to 1000
  do(setq *total* (+ *total* (expt x x)))) ; total += x^x
(setq *total* (write-to-string *total*)) ; convert total to stirng
(print (subseq *total* (- (length *total*) 10))) ; print answer
