;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname power) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Calcolo della potenza di un numero ricorsivamente

(define power    ; val: int (e-sima potenza di n) 
  (lambda (n e)  ; n: int (base) e: int (esponente)
    (if (= e 1)
        (* n 1)
        (* n (power n (- e 1)))
        )
    )
  )

(power 2 4)