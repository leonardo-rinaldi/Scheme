;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname btr-rep) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
(define btd-rep  ; val: stringa (rappresentazione ternaria di un singolo bit)
  (lambda (b)    ; b: intero
    (cond
      ((= b -1)
       "-")
      ((= b 0)
       ".")
      ((= b 1)
       "+")
      )
    )
  )

(define btr-rep  ;val: stringa 
  (lambda (n)    ; n: intero
    (let (
          (q (quotient n 3))
          (r (remainder n 3))
          )
      (cond
        ((< (abs n) 2)    
         (btd-rep n))
        ((= r 2)
         (string-append
         (btr-rep (- q 1)) "+"))
        ((= r -2)
         (string-append
          (btr-rep (+ q 1)) "-"))
        (else
         (string-append (btr-rep q) (btd-rep r)))
        )
      )
    )
  )

(btr-rep -41)
(btr-rep 16)

