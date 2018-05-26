;(begin
;(newline)
;(display "Hello world")
;(newline))

;递归式
(define (fib1 n)
	(cond ((= n 0) 0)
		((= n 1) 1)
		(else (+ (fib1 (- n 1))
				(fib1 (- n 2))))))	
;迭代式
(define (fib2 n)
	(define (fib-iter a b count)
		(if (= count 0)
			b
			(fib-iter (+ a b) a (- count 1))))
	(fib-iter 1 0 n))

;换钱，递归式；对应的迭代式很难找到
(define (count-change amount)
	(define (first-denomination kinds-of-coins)
		(cond ((= kinds-of-coins 1) 1)
			((= kinds-of-coins 2) 5)
			((= kinds-of-coins 3) 10)
			((= kinds-of-coins 4) 25)
			((= kinds-of-coins 5) 50)))
	(define (cc n kinds-of-coins)
		(cond ((= n 0) 1)
			((or (< n 0) (= kinds-of-coins 0)) 0)
			(else (+ (cc n (- kinds-of-coins 1)) 
				(cc (- n (first-denomination kinds-of-coins)) kinds-of-coins)))))
	(cc amount 5))
;求幂
;递归式，空间与时间复杂度都是n
(define (expt1 b n)
	(if (= n 0)
		1
		(* b (expt1 b (- n 1)))))
;迭代式，空间复杂度为1，时间复杂度n
(define (expt2 b n)
	(define (expt-iter b counter product)
		(if(= counter 0)
			product
			(expt-iter b (- counter 1) (* b product))))
	(expt-iter b n 1))
;递归式，空间和时间复杂度都是logn
(define (fast-expt b n)
	(define (even? x)
		(= (remainder x 2) 0))
	(cond ((= n 0) 1)
		((even? n) (square (fast-expt b (/ n 2))))
		(else (* b (fast-expt b (- n 1))))))
;迭代式，空间复杂度1，时间复杂度logn
(define (fast-expt2 b n)
	(define (even? x)
		(= (remainder x 2) 0))
	(define (expt-iter b n a)
		(cond ((= n 0) a)
			((even? n) (expt-iter (* b b) (/ n 2) a))
			(else (expt-iter b (- n 1) (* a b)))))
	(expt-iter b n 1))
