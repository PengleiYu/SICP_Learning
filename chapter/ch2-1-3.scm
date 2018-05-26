;数据的过程性表示，屌炸天

(define (cons x y)
	(define (dispatch m)
		(cond ((= m 0) x)
			((= m 1) y)
			(else (error "argment not 0 or 1 -- CONS" m))))
	dispatch)
(define (car z) (z 0))
(define (cdr z) (z 1))
