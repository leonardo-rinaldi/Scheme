;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname valore-binario) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
(define bit    ; val: intero
  (lambda (b)  ; b: stringa
    (if (string=? b "0")
        0
        1
        )
    )
  )

(define valore-binario  ; val: intero (conversione da binario a decimale)
  (lambda (s)           ; s: stringa (numero binario)
    (let
        (
         (k (- (string-length s) 1))
         )
      (let
          (
           (head (substring s 0 k))
           (lsb (substring s k))
        )
      (if (= k 0)
          (bit lsb)
          (+ (* (valore-binario head) 2) (bit lsb))
          )
      )
    )
  )
 )

(valore-binario "1001010")
