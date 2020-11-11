;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname llcs) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
(define llcs     ;val: intero (lunghezza della sottosequenza più lunga)
  (lambda (x y)  ; x, y: stringa
    (cond
      ((or (string=? x "") (string=? y ""))
       0)
      ((char=? (string-ref x 0) (string-ref y 0))
       (+ 1 (llcs (substring x 1) (substring y 1)))
       )
      (else
       (max (llcs (substring x 1) y) (llcs x (substring y 1))
            )
       )
      )
    )
  )
