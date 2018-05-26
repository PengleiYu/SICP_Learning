;序对的另一种过程性表示

(define (cons x y)
	(lambda (m) (m x y)))
(define (car z)
	(z (lambda (p q) p)))
(define (cdr z)
	(z (lambda (p q) q)))
