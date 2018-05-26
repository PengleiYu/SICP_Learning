;练习let
;a=1+xy
;b=1-y
;f(x,y)=xa^2+yb+ab
(define (f x  y)
	((lambda (a b)
		(+ 	(* x (square a))
			(* y b)
			(* a b)))
	(+ 1 (* x y))
	(- 1 y)))
(define (f x y)
	(let ((a (+ 1 (* x y))) (- 1 y))
		(+ 	(* x (square a))
			(* y b)
			(* a b))))
