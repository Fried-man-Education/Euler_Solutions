#||
  Problem #: 303
  Author: Andrew Friedman
  Created: 01/25/2020
||#

(defun f (n) ; finds least positive multiple of n that, written in base 10, uses only digits ≤ 2
  (if (or (< n 3) (isRepresentable n)) ; check if currently representable or less than 3
    (return-from f n)) ; return n if true
  (if (allNines n) ; check if made of 9s
    (progn ; multiple instruction bypass
     (setq *shortcut* "") ; init blank
     (loop for x from 1 to (length (write-to-string n)) ; iterate for length
       do (setq *shortcut* (concatenate 'string *shortcut* "1"))) ; += "1"
     (loop for x from 1 to (* (length (write-to-string n)) 4) ; iterate for length * 4
       do (setq *shortcut* (concatenate 'string *shortcut* "2"))) ; += "2"
     (return-from f (parse-integer *shortcut*)))) ; return string as int
  (loop for x from (expt 10 (- (length (write-to-string n)) 1)) by 0 ; start as lowest representable multiple of n
    do (setq x (findNext x)) ; find next representable number
    do (if (= (mod x n) 0) ; check if evenly divisible
          (return-from f x)))) ; return f(n)

(defun isRepresentable (n) ; check if representable with digits only of 2, 1, 0
  (setq n (write-to-string n)) ; convert input to string
  (loop for x from 0 to (- (length n) 1) ; iterate through chars
    do (if (> (parse-integer (subseq n x (+ x 1))) 2) ; check if char is > 2
         (return-from isRepresentable nil))) ; return false
  (return-from isRepresentable t)) ; return true

(defun findNext (n) ; find closest representable number after n
  (setq n (write-to-string n)) ; convert input to string
  (loop for x from (- (length n) 1) downto 0 ; get chars from right to left
    do (if (< (parse-integer (subseq n x (+ x 1))) 2) ; check if char < 2
         (progn ; multiple instruction bypass
          (setf (subseq n x (+ x 1)) (write-to-string (+ (parse-integer (subseq n x (+ x 1))) 1))) ; char += 1
          (setq n (* (parse-integer (subseq n 0 (+ x 1))) (expt 10 (- (length n) (+ x 1))))) ; add zeros to chars after current char
          (return-from findNext n)))) ; return next n
  (if (> (parse-integer (subseq n 0 1)) 1) ; all 2s case
    (return-from findNext (expt 10 (length n))))) ; return 10^(length n)

(defun allNines (n) ; checks if all digits are 9s
  (setq n (write-to-string n)) ; convert n to string
  (loop for x from 0 to (- (length n) 1) ; iterate through chars
    do (if (not (string= (subseq n x (+ x 1)) "9")) ; check if char isnt 9
         (return-from allNines nil))) ; return false if non 9 char found
  (return-from allNines t)) ; return true if all 9s

(setq *total* 0) ; init total to 0
(loop for n from 1 to 10000 ; iterate through range
  do (setq *total* (+ *total* (/ (f n) n)))) ; add f(n)/n to total
(print *total*) ; print answer :)
