;2.1有理数的算术运算
;欧几里得算法
(define (gcd a b)
	(if (= b 0)
		a
		(gcd b (remainder a b))))

;构造函数
(define (make-rat n d) 
	(let ((g (gcd n d)))
		(cons (/ n g) (/ d g))))
;选择函数
(define (number x) (car x))
;选择函数
(define (denom x) (cdr x))

;有理数打印
(define (print-rat x)
	(newline)
	(display (number x))
	(display "/")
	(display (denom x)))
;有理数加法
(define (add-rat x y)
	(make-rat (+ (* (number x) (denom y)) 
			(* (number y) (denom x)))
		(* (denom x) (denom y))))

;有理数减法
(define (sub-rat x y)
	(make-rat (- (* (number x) (denom y)) 
			(* (number y) (denom x)))
		(* (denom x) (denom y))))

;有理数乘法
(define (mul-rat x y)
	(make-rat (* (number x) (number y))
		(* (denom x) (denom y))))

;有理数除法
(define (div-rat x y)
	(make-rat (* (number x) (denom y))
		(* (denom x) (number y))))
;有理数相等性
(define (equal-rat? x y)
	(= (* (number x) (denom y))
		(* (number y) (denom x))))
