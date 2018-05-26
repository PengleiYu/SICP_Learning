;平面线段表示问题
(define (make-point x y) (cons x y));点的构造函数
(define (x-point p) (car p));点的析构函数
(define (y-point p) (cdr p));点的析构函数

(define (make-segment p q) (cons p q));线段的构造函数
(define (start-segment l) (car l));线段的析构函数
(define (end-segment l) (cdr l));线段的析构函数

(define (print-point p);点的打印方法
	(newline)
	(display "(")
	(display (x-point p))
	(display ",")
	(display (y-point p))
	(display ")"))

(define (midpoint-segment l)
	(let (  (p (start-segment l))
		(q (end-segment l)))
		(make-point (/ (+ (x-point p) (x-point q)) 2) (/ (+ (y-point p) (y-point q)) 2))))
