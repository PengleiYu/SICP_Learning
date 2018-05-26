;Church计数，数字的过程性表示

(define zero (lambda (f) (lambda (x) x)));0

(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))));+1操作

(define one (lambda (f) (lambda (x) (f x))));1
(define two (lambda (f) (lambda (x) (f (f x)))));2
