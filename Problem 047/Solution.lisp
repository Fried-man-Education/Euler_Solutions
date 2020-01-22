#||
  Problem #: 047
  Author: Andrew Friedman
  Created: 01/22/2020
||#

(defun findFactors (n) ; finds factors (if any) of int
  (loop for x from 2 to (sqrt n) ; iterate through possible factors
    do (if (= (mod n x) 0) ; if evenly divisible
         (progn ; multiple instruction bypass
          (return-from findFactors ; return from function
            (concatenate 'list (findFactors x) (findFactors (/ n x))))))) ; recursive list of core factors
  (return-from findFactors (make-list 1 :initial-element n))) ; return n as list

(defun isPrime (n) ; checks if prime (takes integer)
  (loop for x from 2 to (sqrt n) ; iterate through possible factors
   do (if (= (mod n x) 0) ; check if evenly divisible
       (return-from isPrime nil))) ; return false
  (if (= n 1) ; if n = 1
    (return-from isPrime nil) ; apparently its not prime
    (return-from isPrime t))) ; return true

(defun countPrimeFactors (n) ; finds unique prime factors in list
  (setq *uniquePrimes* (make-list 0)) ; init list to nil
  (loop for x in n ; iterate through n
    do (if (isPrime x) ; if element is prime
         (progn ; multiple instruction bypass
          (setq *isNew* t) ; assume x is new
          (loop for a in *uniquePrimes* ; iterate through found primes list
            do (if (= a x) ; if copy found
                (setq *isNew* nil))) ; set to not new
          (if *isNew* ; if still new prime
            (setq *uniquePrimes* (push x *uniquePrimes*)))))) ; add to found prime lsit
  (list-length *uniquePrimes*)) ; return amount of unique primes found

(loop for x from 2 ; iterate through possible candidates
  do (if (= (countPrimeFactors (findFactors x)) 4) ; if x contains 4 unique prime factors
       (if (= (countPrimeFactors (findFactors (+ x 1))) 4) ; "" for (x + 1)
         (if (= (countPrimeFactors (findFactors (+ x 2))) 4) ; "" for (x + 2)
           (if (= (countPrimeFactors (findFactors (+ x 3))) 4) ; "" for (x + 3)
             (progn ; multiple instruction bypass
              (print x) ; print answer :)
              (return))))))) ; terminate loop
