(defun junretu (l)
  (defun morph (x xs)
    (list (cons x xs) (append xs (list x))))
  (and l
       (if (cdr l)
           (let ((res (junretu (cdr l))))
             (apply #'append (mapcar #'(lambda (xs) (morph (car l) xs)) res)))
           (list l))))

(junretu '(a b c))
