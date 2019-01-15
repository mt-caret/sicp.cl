(defvar blockdata '())
(load "blockdata.lsp")

; 1

(defun match-element (data query)
  (or (eql data query) (eql '? query)))

(match-element 'foo '?)

(match-element 'foo 'foo)

; 2

(defun match-triple (data pattern)
  (every #'match-element data pattern))

(match-triple '(b2 color red) '(b2 color ?))

(match-triple '(b2 color red) '(b2 color blue))

; 3

(defun fetch (pattern)
  (remove-if-not (lambda (data) (match-triple data pattern)) blockdata))

(fetch '(? supports b1))

; 4

(fetch '(b2 color ?))

(fetch '(b1 color red))

(fetch '(b1 ? b2))

(fetch '(b1 ? ?))

(fetch '(? supports ?))

(fetch '(? ? b1))

(fetch '(? ? ?))

; 5

(defun color-pattern (bl)
  (list bl 'color '?))

; 6

(defun supporters (bl)
  (mapcar #'third (fetch (list bl 'supported-by '?))))

; 7

(defun description (bl)
  (apply #'append (mapcar #'cdr (fetch (list bl '? '?)))))

(description 'b1)

; 8

(defun supp-cube (bl)
  (if (some #'(lambda (x) (eq x 'cube))
        (apply #'append
               (mapcar #'(lambda (x) (mapcar #'third (fetch (list x 'shape '?))))
                       (supporters bl)))) t '()))

(supp-cube 'b1)

(supp-cube 'b4)
