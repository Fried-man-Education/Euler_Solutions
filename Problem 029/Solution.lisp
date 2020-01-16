#||
  Problem #: 029
  Author: Andrew Friedman
  Created: 01/16/2020
||#

(setq *numbers* (list)) ; intit null list
(loop for a from 2 to 100 ; iterate through all possible As
  do(loop for b from 2 to 100 ; iterate through all possible Bs
      do(progn ; multiple instructions
         (setq isNew t) ; assum new is true
         (setq temp (expt a b)) ; store a^b
         (loop for x in *numbers* ; iterate through integers in list
           do (if (= temp x) ; check if new number is in list
               (setq isNew nil))) ; if so set new to false
         (if isNew ; if new
           (push temp *numbers*))))) ; add to list
(print (length *numbers*)) ; print answer :)
