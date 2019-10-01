; sum of even fibonacci terms less than 4 000 000

(defun fib n
    (if (<= (n 2)) 
        2 
        (let ((next (+ (fib (- n 1)) (fib (- n 2))))) next)))
        
(write (fib 3))