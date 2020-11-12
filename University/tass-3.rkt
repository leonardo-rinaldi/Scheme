;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname tass-3) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Tassellazione di un cordolo con piastrelle lughe:
;A = 1
;B = 2
;C = 3

(define tass-3  ;val: intero
  (lambda (n)   ;n: intero non negativo
    (cond
      ((= n 1)
       1)
      ((= n 2)
       2)
      ((= n 3)
       4)
      (else
       (+ (tass-3 (- n 3)) (tass-3 (- n 2)) (tass-3 (- n 1))))
      )
    )
  )