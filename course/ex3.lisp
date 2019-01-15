; 1

(defun add-up (list)
  (defun foo (accum list)
    (if list (foo (+ accum (car list)) (cdr list)) accum))
  (foo 0 list))

(add-up '(2 5 8))

; 2

(defun laugh (n)
  (if (<= n 0) '() (cons 'ha (laugh (- n 1)))))

(laugh 3)

(laugh 0)

; 3

(defun count-down (n)
  (if (<= n 0) '() (cons n (count-down (- n 1)))))

(count-down 5)

; 4

(defun square-list (l)
  (mapcar (lambda (x) (* x x)) l))

(square-list '(3 6 5 8))

; 5

(defun anyoddp (l)
  (and l
      (or (not (evenp (car l)))
          (anyoddp (cdr l)))))

(anyoddp '(1 2 3))

(anyoddp '(2 4 6))

; 6

(defun extract-numbers (l)
  (and l
       (typecase (car l)
         (integer (cons (car l) (extract-numbers (cdr l))))
         (t (extract-numbers (cdr l))))))

(extract-numbers '(3 apples and 1 banana))

; 7

(defun count-odd (l)
  (apply '+ (mapcar (lambda (x) (if (evenp x) 0 1)) l)))

(count-odd '(4 5 6 7 8))
