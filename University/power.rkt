;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname power) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Procedura che eleva x alla y

(define power    ;val: x^y intero
  (lambda (x y)  ;x > 0, y >= 0 interi
    (if (= y 0)
        1
        (* x (power x (- y 1)))
        )))