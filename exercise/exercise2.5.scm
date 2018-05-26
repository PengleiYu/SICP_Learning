;序对的指数乘积形式表示

;p除尽x
;(define (lost p x)
;	(if (= 0 (remainder p x))
;		(lost (/ p x) x)
;		p))

(define (cons a b)
	(* (expt 2 a)
		(expt 3 b)))
;(define (car p)
;	(/ (log (lost p 3))
;		(log 2)))
;(define (cdr p)
;	(/ (log (lost p 2))
;		(log 3)))

;更经典的实现
(define (car p)
	(if (= 0 (remainder p 2))
		(+ 1 (car (/ p 2)))
		0))
(define (cdr p)
	(if (= 0 (remainder p 3))
		(+ 1 (cdr (/ p 3)))
		0))
