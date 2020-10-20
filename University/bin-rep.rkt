;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname bin-rep) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Conversione di un numero n in base 10 alla base 2

(define bin-rep  ; val: stringa (n in base 2)
  (lambda (n)    ; n: intero
    (let
        (
         (q (quotient n 2))    ;usa quotient non /
         (r (remainder n 2))
         )
      (let
          (
           (lsb (if (= r 0) "0" "1"))
           )
        (if (= q 0)
            lsb
            (string-append
             (bin-rep q) lsb)
            )
        )
      )
    )
  )

(bin-rep 19)


  

        
