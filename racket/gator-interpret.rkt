#lang racket

(require rosette
         rosette/lib/destruct
         "utils.rkt"
         (prefix-in gator: "gator-language.rkt"))

(provide interpret)

;;; prog: list of gator statements
;;; env: function from name -> time -> bitvector
;;; id: index of the statement to interpret
;;; time: current time
;;; cache: way to encode inductive hypotheses
(define (interpret prog env id time cache)
  (destruct (list-ref prog id)
            [(gator:var name bw) (env name time)]
            [(gator:op op op-args op-children)
             ;;; TODO: why do we need this flatten?
             (let ([children (flatten (map (lambda (child-id)
                                             (interpret prog env child-id time cache))
                                           op-children))])
               (match op
                 [(? (curry eq? zero-extend)) (apply zero-extend (append children op-args))]
                 [else (apply op (append op-args children))]))]))
