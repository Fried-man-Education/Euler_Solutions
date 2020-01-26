#||
  Problem #: 055
  Author: Andrew Friedman
  Created: 01/26/2020
||#

(defun isPalindrome (n) ; checks if input is palindrome
  (setq *nString* (write-to-string n)) ; convert input to string
  (setq *nLength* (length *nString*)) ; get length of string
  (loop for x from 0 to (- *nLength* 1) ; iterate through chars in string
    do (if (not (eq (char *nString* x) (char *nString* (- (- *nLength* 1) x)))) ; check if 2 chars are equal
         (return-from isPalindrome nil))) ; found two non twin digits
  (return-from isPalindrome t)) ; return verdict as bool

(defun reverseNumber (n) ; reverse integer
  (setq n (write-to-string n)) ; convert input to string
  (setq reversed "") ; init reversed variable to null
  (loop for x from (- (length n) 1) downto 0 ; iterate from right to left chars
    do (setq reversed (concatenate 'string reversed (subseq n x (+ x 1))))) ; add char to reversed string
  (return-from reverseNumber (parse-integer reversed))) ; return reversed var as int

(defun isLychrel (n) ; checks if number can be palindrome before 50 iterations
  (loop for x from 1 to 50 ; iterate 50 times
    do (progn ; multiple instruction bypass
        (setq n (+ n (reverseNumber n))) ; n = n + reverse(n)
        (if (checkPalindrome n) ; check if n is palindrome
          (return-from isLychrel nil)))) ; not Lychrel
  (return-from isLychrel t)) ; is Lychrel

(setq *total* 0) ; init total to 0
(loop for i from 0 to 9999 ; iterate through numbers below 10000
  do (if (isLychrel i) ; check if i is Lychrel
       (setq *total* (+ *total* 1)))) ; add to Lychrel total
(print *total*) ; print answer :)
