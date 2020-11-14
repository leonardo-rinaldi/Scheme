;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname bin-n-rep) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
; Conversione di un numero n in base 10 ad una base b

(define bin-n-rep ;val: stringa (n in base b)
  (lambda (n b)   ; n: intero b: intero
    (let
        (
         (q (quotient n b))
         (r (remainder n b))
         )
      (let
          (
           (lsd (number->string r))
           )
        (if (= q 0)
            lsd
            (string-append
             (bin-n-rep q b) lsd)
            )
        )
      )
    )
  )

(bin-n-rep 15 4)
