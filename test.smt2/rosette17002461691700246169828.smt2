(set-option :auto-config true)
(set-option :produce-unsat-cores false)
(set-option :smt.mbqi.max_iterations 10000000)
(set-option :smt.relevancy 2)
(reset)
(set-option :auto-config true)
(set-option :produce-unsat-cores false)
(set-option :smt.mbqi.max_iterations 10000000)
(set-option :smt.relevancy 2)
(declare-fun c0 () Int)
(define-fun e1 () Bool (= 0 c0))
(define-fun e2 () Bool (not e1))
(define-fun e3 () Int (- 1))
(define-fun e4 () Int (+ e3 c0))
(define-fun e5 () Bool (= 0 e4))
(define-fun e6 () Bool (not e5))
(define-fun e7 () Bool (and e2 e6))
(define-fun e8 ((c0 Int)) (_ BitVec 32) (_ bv0 32))
(declare-fun c9 (Int) (_ BitVec 32))
(define-fun e10 ((c0 Int)) Int (- 2))
(define-fun e11 ((c0 Int)) Int (+ (e10 c0) c0))
(define-fun e12 ((c0 Int)) (_ BitVec 32) (c9 (e11 c0)))
(declare-fun c13 (Int) (_ BitVec 32))
(define-fun e14 ((c0 Int)) (_ BitVec 32) (c13 (e11 c0)))
(define-fun e15 ((c0 Int)) (_ BitVec 32) (bvadd (e12 c0) (e14 c0)))
(declare-fun c16 (Int) (_ BitVec 32))
(define-fun e17 ((c0 Int)) (_ BitVec 32) (c16 (e11 c0)))
(define-fun e18 ((c0 Int)) (_ BitVec 32) (bvand (e15 c0) (e17 c0)))
(define-fun e19 ((c0 Int)) Bool (= (e8 c0) (e18 c0)))
(define-fun e20 () Bool (forall ((c0 Int)) (e19 c0)))
(define-fun e21 () Bool (and e7 e20))
(assert e21)
(check-sat)
(get-model)
(reset)
(set-option :auto-config true)
(set-option :produce-unsat-cores false)
(set-option :smt.mbqi.max_iterations 10000000)
(set-option :smt.relevancy 2)
