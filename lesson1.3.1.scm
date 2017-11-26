(define (cube x)
  (* x x x))

(define (sum-cube a b)
  (if (> a b)
      0
      (+ (cube a)
	     (sum-cube (+ a 1) b))))

(sum-cube 1 3)

;procedure as arguments
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	     (sum term (next a) next b))))

(define (sum-cube-2 a b)
  (sum cube a 1+ b))

(sum-cube-2 1 10)


(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)) dx)

(integral cube 0 1 0.01)
;lambda
(define (integral-lambda f a b dx)
  (* (sum f 
  		  (+ a (/ dx 2.0)) 
  		  (lambda (x) (+ x dx)) 
  		  b)
	  dx))

(integral-lambda cube 0 1 0.01)
