; 1

(defun make-even (x)
  (if (evenp x) x (+ x 1)))

; 2

(defun longer (l1 l2)
  (> (length l1) (length l2)))

; 3

(defun ordered (a b)
  (if (< a b) (list a b) (list b a)))

(ordered 3 5)

(ordered 5 3)

; 4

(defun constrain (x min max)
  (cond ((< x min) min)
        ((> x max) max)
        (t x)))

(constrain 3 -30 30)

(constrain 55 -30 30)

; 5

(defun calc (n)
  (cond ((and (< 0 n) (eq (mod n 2) 1)) (* n n))
        ((and (> 0 n) (eq (mod n 2) 1)) (* n 2))
        (t (/ n 2))))

; 6

(defun same-sign (a b)
  (or
   (and (eq a 0) (eq b 0))
   (and (< 0 a) (< 0 b))
   (and (> 0 a) (> 0 b))))

; 7

(and 'a 'b 'c)

(or 'a 'b 'c)

(or nil 'nagashima t)

(and 'a 'b nil)

(and (equal 'abc 'abc) 'yea)

(or (equal 'abc 'abc) 'yes)
