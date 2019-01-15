; 1

(cons 5 (list 6 7))

(cons 5 '(list 6 7))

(list 3 'from 9 'gives (- 9 3))

(+ (length '(1 a 2 b)) (third '(1 a 2 b)))

(rest '(cons is short for construct))

; 2

; (third (the quick brown fox))
(third '(the quick brown fox))

; (list 2 and 2 is 4)
 (list 2 'and 2 'is 4)

; (+ 1 '(length (list t t t t)))
(+ 1 (length (list t t t t)))

; (cons 'patrick (seymour marvin))
(cons 'patrick '(seymour marvin))

; (cons 'patrick (list seymour marvin))
(cons 'patrick (list 'seymour 'marvin))

; 3

(cons 'grapes '(of wrath))

(list t 'is 'not nil)

(first '(list moose goose))

(first (list 'moose 'goose))

(cons 'home ('sweet 'home))

; 4

(defun kilometers-per-liter (last-value current-value consumed-gasoline)
  (/ consumed-gasoline (- current-value last-value)))

(kilometers-per-liter 5 10 3)

; 5

(defun addlength (l)
  (cons (length l) l))

(addlength '(a b c d))

; 6

(defun scrabble (word)
  (list word 'is 'a 'word))

(scrabble 'tea)

(scrabble 'word)

; 7

(defun stooge (larry moe curly)
  (list larry (list 'moe curly) curly 'larry))

(stooge 'moe 'curly 'larry)

; 8

(defun mystery (x)
  (list (second x) (first x)))

(mystery '(dancing bear))

(mystery 'dancing 'bear)

(mystery '(zowie))

(mystery (list 'first 'second))
