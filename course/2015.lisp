; 1

(defun exor (al bl)
  (set-difference (union al bl) (intersection al bl)))

(exor '(a b c d) '(b d f h))

; 2

(defun allabs (l)
  (typecase l
    (null '())
    (list (cons (allabs (car l)) (allabs (cdr l))))
    (number (abs l))
    (t l)))

(allabs '((-1) 200 ((abc))))

; 3

(defun myfindif (func x)
  (cond ((and x (funcall func (car x))) (car x))
        (t (and x (myfindif func (cdr x))))))

(myfindif #'oddp '(1 2 3))

(myfindif #'oddp '(2 4 6))

(myfindif #'(lambda (x) (> x 3)) '(1 2 3 4 5 6))

; 4

(load "ex5.lisp")
(defun triangle (n)
  (if (> n 0)
      (progn
        (drawline n)
        (format t "~%")
        (triangle (- n 1)))))

(triangle 5)

; 5

(defun rank (card)
  (first card))

(defun suit (card)
  (second card))

(defvar my-hand '())
(setf my-hand '((4 club) (3 heart) (jack club)))

(defun count-suit (suit-type hand)
  (apply #'+ (mapcar #'(lambda (x) (if (eql suit-type (suit x)) 1 0)) hand)))

(count-suit 'club my-hand)
(count-suit 'diamond my-hand)

(defun black-cards (hand)
  (remove-if-not
   #'(lambda (c) (or (eql 'club (suit c)) (eql 'spade (suit c))))
   hand))

(black-cards my-hand)

; 6

(load "block.lisp")

(defun shapeblock (shape)
  (mapcar #'first (fetch (list '? 'shape shape))))

(shapeblock 'brick)

(shapeblock 'ball)

(defun samecolor (bl)
  (let ((color (third (car (fetch (list bl 'color '?))))))
    (remove-if
     #'(lambda (x) (eql bl x))
     (mapcar #'first (fetch (list '? 'color color))))))

(samecolor 'b1)
(samecolor 'b4)

; 7

(load "3moku.lsp")

; SHIRANGANA

; 8

; 第一引数を反転した上で再帰的に先頭から順番にconsで第二引数に結合していっていると予想できる

(defun my-append (al bl)
  (defun foo (accum l)
    (if l (foo (cons (car l) accum) (cdr l)) accum))
  (foo bl (reverse al)))

(defvar x 'a)
(defvar y '(a))
(defvar z '(b c))

(my-append y z)

; (my-append x z)

(my-append z x)

(eq y (my-append y z))

(eq z (rest (append y z)))
