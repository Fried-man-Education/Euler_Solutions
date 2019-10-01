;The prime factors of 13195 are 5, 7, 13 and 29.
;What is the largest prime factor of the number 600851475143 ?

(defvar question 600851475143)
(defvar root (sqrt question))
(defun is_prime(n) 
    (cond
        ((= n 2) 1)
        ((= n 3) 1)
        ((= (round (+ n 1) 6) (/ (+ n 1) 6)) 1)
        ((= (round (- n 1) 6) (/ (- n 1) 6)) 1)
    )
)

(defun check_is_prime(n) (if (= (is_prime n) 1) 1 0))

(defun get_prime_factors()
    (let ((n question))
    (loop for x from 2 to root
        if =(= (mod question x) 0)
        do (if ((check_is_prime x) 1) (print x)))))
(write (get_prime_factors))