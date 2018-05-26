;用高阶函数做抽象
;1.3.1	过程作为参数

(define (cube x) (* x x x))
(define (increase x) (+ x 1))
(define (identity x) x)

(define (sum-integers a b) ;求和
	(if (> a b)
		0
		(+ a (sum-integers (+ a 1) b))))
(define (sum-cubes a b) ;立方求和
	(if(> a b)
		0
		(+ (cube a) (sum-cubes (+ a 1) b))))
(define (pi-sum a b) ;求pi/8的近似值
	(if (> a b)
		0
		(+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))
;抽象出求和函数
(define (sum term a next b)
	(if (> a b)
		0
		(+ (term a)
			(sum term (next a) next b))))
(define (sum2 term a next b)  ;求和函数的迭代形式
	(define (iter x result)
		(if (> x b)
			result
			(iter (next x) (+ result (term x)))))
	(iter a 0))


;利用求和函数，得到积分函数
(define (integral f a b dx)
	(define (add-dx x) (+ x dx))
	(* (sum2 f (+ a (/ dx 2.0)) add-dx b) dx))

;1.3.1 求积函数
(define (product term a next b )
	(if (> a b)
		1
		(* (term a)
			(product term (next a) next b))))
(define (product2 term a next b) ;求积函数的迭代版本
	(define (product-iter x result)
		(if (> x b)
			result
			(product-iter (next x) (* result (term x)))))
	(product-iter a 1))
(define (pi-product a b) ;使用求积函数计算pi/4
	(define (hah x) (+ 1 (* 2 x)))
	(define (term x)
		(/ (* (- (hah x) 1) (+ (hah x) 1)) (* (hah x) (hah x))))
	(product2 term a increase b))

;1.32累积函数
(define (accumulate combiner start term a next b) ;递归版本
	(if (> a b)
		start
		(combiner (term a) (accumulate combiner start term (next a) next b))))

(define (accumulate2 combiner start term a next b) ;迭代版本
	(define (accumulate-iter x result)
		(if (> x b)
			result
			(accumulate-iter (next x) (combiner result (term x)))))
	(accumulate-iter a start))

(define (sum3 a b);使用递归版本累积函数
	(accumulate + 0 identity a increase b))
(define (sum4 a b);使用迭代版本累积函数
	(accumulate2 + 0 identity a increase b))
(define (product3 a b)
	(accumulate * 1 identity a increase b))
(define (product4 a b)
	(accumulate2 * 1 identity a increase b))

;带过滤器的累加器；尚未验证
(define (accumulate3 combiner start term a next b predicater) 
	(define (next2 x)
		(cond ((> x b) x)
			((predicater x) x)
			(else (next x))))
	(define (accumulate-iter x result)
		(if (> x b)
			result
			(accumulate-iter (next2 x) (combiner result (term x)))))
	(accumulate-iter a start))
