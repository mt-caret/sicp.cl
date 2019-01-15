; 1

(defun add1 (l)
  (mapcar (lambda (x) (+ x 1)) l))

(add1 '(1 2 3 4 5 6))

; 2

(defun greater-than-five-p (l)
  (mapcar (lambda (x) (> x 5)) l))

(greater-than-five-p '(1 2 3 4 5 6))

; 3

(defun flip (l)
  (mapcar (lambda (x) (if (eq x 'on) 'off 'on)) l))

(flip '(on off on on))

; 4

(defun pick (l)
  (remove-if (lambda (x) (or (< x 1) (> x 5))) l))

(pick '(1 2 3 4 5 6))

; 5

(defun count-the (l)
  (length (remove-if-not (lambda (x) (eq x 'the)) l)))

(count-the '(a quick brown fox jumps over the lazy dog))

; 6

(defun my-intersection (al bl)
  (remove-if-not (lambda (x) (member x bl)) al))

(my-intersection '(a b c) '(b c d))

; 7

(defun roughly-equal (x k)
  (remove-if-not (lambda (x) (and (< x (+ k 10)) (> x (- k 10)))) x))

(roughly-equal '(1 10 100 1000) 15)

; 8

(defun foo (x) (mapcar #'(lambda (e) e) x))

(foo "foo")

; 9

(defun draw () (format t "*"))

(defun drawline (n)
  (if (> n 0) (progn (draw) (drawline (- n 1))) '()))

(drawline 10)

; 10

(defun drawbox (w h)
  (if (> h 0) (progn (drawline w) (format t "~%") (drawbox w (- h 1))) '()))

(drawbox 7 3)
