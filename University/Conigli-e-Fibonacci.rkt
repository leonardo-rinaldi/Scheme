;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Conigli-e-Fibonacci) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
(define coppie-fertili ;val: intero
  (lambda (t)          ;t: intero
    (if (= t 0)
        1
        (+ (coppie-fertili (- t 1)) (coppie-cuccioli (- t 1)))
        )
    ))

(define coppie-cuccioli ;val: intero
  (lambda (t)           ;t: intero
    (if (= t 0)
        0
        (coppie-fertili (- t 1))
        )
    ))

(define coppie ;val: intero
  (lambda (t)  ;t: intero
    (+ (coppie-fertili t) (coppie-cuccioli t))
    ))

(coppie 12)
  
