;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname btr-val) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Converione di un numero dalla notazione ternaia bilanciata alla base 10

(define btd-val ; val: intero
  (lambda (s)   ; s: stringa
    (cond
      ((equal? s "+")
       1)
      ((equal? s "-")
       -1)
      ((equal? s ".")
       0)
      )
    )
  )

(define btr-val ; val: stringa
  (lambda (s)   ; s: intero
    (if (> (string-length s) 1)
        (+ (* (btd-val (substring s 0 1)) (expt 3 (- (string-length s) 1)))
           (btr-val (substring s 1)))
          (btd-val s))
    )
  )

(btr-val "+--+")
(btr-val "-")
(btr-val "-++++")

(btr-val "-+--")
(btr-val "+")
(btr-val "-+-.")
