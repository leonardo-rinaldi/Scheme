;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname comp-uno-let) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Scrivere una procedura che calcoli il complemento a 1 di una stringa
;binaria "dividendola a metà" in due sottostringhe.
;Versione con l'utilizzo del costrutto (let)

(define one-comp-bit   ; val: Stringa
  (lambda (s)          ; s: Stringa
    (if (string=? s "0")
        "1"
        "0"
        )
    )
  )

(define comp-uno    ; val: stringa
  (lambda (s)       ; s: stringa
    (if (> (string-length s) 0)
        (string-append
         (one-comp-bit (substring s 0 1))
         (comp-uno (substring s 1 (string-length s)))
         )
        ""
        )
    )
  )

(define unisci-stringhe  ; val: stringa
  (lambda (s)            ; s: stringa
    (let
       (
        (m (/ (string-length s) 2)))
      (string-append
       (comp-uno (substring s 0 m))
       (comp-uno (substring s m))
       )
    )
  )
)
      
(unisci-stringhe "100101")




        