(defun isCircularPrime (n)
  (loop for x from 1 to (length (write-to-string n))
    (print n)))

(isCircularPrime 8)
