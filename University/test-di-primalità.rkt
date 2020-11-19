;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname test-di-primalità) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Controllo se un numero n è primo
; Test di primalità di un numero

(define primo? ;val: booleano
  (lambda (n)  ;n: intero > 1
    (not (ha-divisori-fra? 2 (- n 1) n))
    ))

;controllo se n ha divisori in un intervallo tra x e y

(define ha-divisori-fra? ;val: booleano
  (lambda (x y n)        ;x, y, n: interi non negativi
    (cond ((> x y) ;intervallo vuoto
           false)
          ((= (remainder n x) 0) 
           true)
          (else
           (ha-divisori-fra? (+ x 1) y n)) 
          ))
  )

;creo una lista contenente i numeri primi da x a y (escluso)

(define primi   ;val: lista
  (lambda (x y) ;x, y: interi > 1
    (cond ((> x y)
           null)
          ((primo? x)
           (cons x (primi (+ x 1) y)))
           (else
            (primi (+ x 1) y))
           )
    ))

(primi 2 100)

