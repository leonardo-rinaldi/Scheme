;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mull-cr) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
; Versione con ricorsione di coda dell'algoritmo del contadino russo

(define mull2
  (lambda (m n)
    (mull-cr m n 0)
    ))

(define mull-cr
  (lambda (m n p)
    (cond ((= n 0)
           p)
          ((even? n)
           (mull-cr(* 2 m) (quotient n 2) p))
          (else
           (mull-cr (* 2 m) (quotient n 2) (+ m p)))
          )
    ))

(mull2 2 2)