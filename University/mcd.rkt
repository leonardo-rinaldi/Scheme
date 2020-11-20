;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mcd) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
; Algorimo di Euclide per il calcolo del massimo comune divisore
   
(define mcd      ;val: intero
  (lambda (x y)  ;x, y: interi positivi
    (cond ((= x y)
           x)
          ((< x y)
           (mcd x (- y x)))
          (else
           (mcd (- x y) y))
          )
    ))

(mcd 21 12)
(mcd 12 21)
(mcd 5 144)