; 1

(setf line '(a b c))
(append line (list (first line)))

(setf line '(a b c))
(append (last line) line)

(setf line '(a b c))
(list (first line) (last line))

(setf line '(a b c))
(cons (last line) line)

(setf line '(a b c))
(append line '(d e f))

; 2

(defun rev (l)
  (defun foo (al bl)
    (if al (foo (cdr al) (cons (car al) bl)) bl))
  (foo l '()))

(rev '(1 2 3 4 5))

; 3

(defun rm (e l)
  (remove-if (lambda (x) (eq x e)) l))

(rm 'a '(b a n a n a))

; 4

(defun mem (e l)
  (and l (if (eq e (car l)) l (mem e (cdr l)))))

(mem 'a '(a b c))

(mem 'b '(a b c))

(mem 'c '(a b c))

(mem 'd '(a b c))

; 5

(defun beforep (x y l)
  (> (length (mem x l)) (length (mem y l))))

(beforep 'd 'b '(a b c d e))

(beforep 'b 'd '(a b c d e))

; 6

(defun rmdup (l)
  (defun foo (accum l)
    (if l
        (if (mem (car l) accum)
            (foo accum (cdr l))
            (foo (cons (car l) accum) (cdr l)))
        accum))
  (rev (foo '() l)))

(rmdup '(b a n a n a))

; 7

(defun wa (al bl)
  (rmdup (append al bl)))

(wa '(a b c) '(b d e))

(defun seki (al bl)
  (remove-if (lambda (x) (not (mem x bl))) al))

(seki '(a b c) '(b d e))

(defun sa (al bl)
  (remove-if (lambda (x) (mem x bl)) al))

(sa '(a b c d e) '(b d))

; 8

(defun lookup (key al)
  (car (remove-if (lambda (x) (not (eq key (first x)))) al)))

(setf x '((one eins) (two zwei) (three drei) (four vier)))
(lookup 'three x)

(setf x '((one eins) (two zwei) (three drei) (four vier)))
(lookup 'ten x)

; 9

(defun sum-tree (tree)
  (typecase tree
    (null 0)
    (list (+ (sum-tree (car tree)) (sum-tree (cdr tree))))
    (integer tree)
    (t 0)))

(sum-tree '((2 pens) ((or 4 5) books)))

; 10

(defun flatten (tree)
  (typecase tree
    (null '())
    (symbol (list tree))
    (list (append (flatten (car tree)) (flatten (cdr tree))))))

(flatten '(a (i ((u)) (e) o)))

; 11

(defun sleepy (tree)
  (typecase tree
    (null '())
    (symbol 'z)
    (list (cons (sleepy (car tree)) (sleepy (cdr tree))))))

(sleepy '(a (i ((u)) (e) o)))
