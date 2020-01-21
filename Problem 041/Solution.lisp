#||
  Problem #: 041
  Author: Andrew Friedman
  Created: 01/20/2020
||#

(defun isPrime (n) ; checks if prime (takes integer)
  (loop for x from 2 to (sqrt n) ; iterate through possible factors
    do (if (= (mod n x) 0) ; check if evenly divisible
         (return-from isPrime nil))) ; return false
  (if (= n 1) ; if n = 1
    (return-from isPrime nil)) ; apparently its not prime
  (return-from isPrime t)) ; return true

(defun isPandigital (n) ; checks if input is pandigital (takes integer)
  (setq *nString* (write-to-string n)) ; convert input to string
  (setq *nLength* (length *nString*)) ; get length of input string
  (setq *digitsFound* "0") ; empty string
  (loop for a from 0 to (- *nLength* 1) ; iterate through chars in string
    do (loop for b from 0 to (- (length *digitsFound*) 1) ; iterate through chars in found digits
         do (if (eq (char *nString* a) (char *digitsFound* b)) ; check if same digits found
              (return-from isPandigital nil))) ; return false
    do (setq *digitsFound* (concatenate 'string *digitsFound* (subseq *nString* a (+ a 1))))) ; add digit to digit string
  (setq *normArray* (write-to-string (parse-integer (subseq "987654321" (- 10 (length *digitsFound*)) 9)))) ; set to normal ascending digits for length
  (if (= (sumOfString *digitsFound*) (sumOfString *normArray*)) ; check if digits found are ascending when organized
    (return-from isPandigital t) ; number is pandigital
    (return-from isPandigital nil))) ; number isnt pandigital

(defun sumOfString (n) ; finds sum of chars in string
  (setq *sum* 0) ; init to 0
  (loop for a from 0 to (- (length n) 1) ; iterate through chars
    do (setq *sum* (+ *sum* (parse-integer (subseq n a (+ a 1)))))) ; add char x to sum
  (return-from sumOfString *sum*)) ; return sum

(loop for i from 7654321 by -2 ; start with highest possible pandigital
  do (if (and (isPandigital i) (isPrime i)) ; check if panidigital prime
       (progn ; multiple instructions bypass
        (print i) ; print answer :)
        (return)))) ; terminate loop
