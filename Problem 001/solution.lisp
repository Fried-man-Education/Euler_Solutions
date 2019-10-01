; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

; Find the sum of all the multiples of 3 or 5 below 1000. (233168)
 
(defvar sum 0)
(defun multiples() 
	(loop for x from 0 to 999 do (
		((lambda (x) (+ x 1)) x)
		(print x)
	)))


(multiples)