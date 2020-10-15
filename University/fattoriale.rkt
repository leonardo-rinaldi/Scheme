;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname fattoriale) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
(define fattoriale  ; result: int
  (lambda (s)       ; s: int
    (if (equal? s 1)
        (* s 1)
        (* s (fattoriale (- s 1)))
        )
    )
  )

(fattoriale 4)