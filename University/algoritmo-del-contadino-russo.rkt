;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname algoritmo-del-contadino-russo) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
; Algoritmo "del contadino russo" per la moltiplicazione

(define mull     ;val: intero
  (lambda (m n)  ;m, n: interi non negativi
    (cond ((= n 0)
           0)
          ((even? n)
           (mull (* 2 m) (quotient n 2)))
          (else
           (+ m (mull (* 2 m) (quotient n 2))))
          )
    ))

(mull 5 25)
