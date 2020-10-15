;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname comp-uno) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Scrivere una procedura che calcoli il complemento a 1 di
;una stringa a partire dal carattere più a sinistra (cifra
;più significativa)

(define one-comp-bit   ; Result: String
  (lambda (s)          ; s: String
    (if (string=? s "0")
        "1"
        "0"
        )
    )
  )

(define comp-uno
  (lambda (s)
    (if (> (string-length s) 0)
        (string-append
         (one-comp-bit (substring s 0 1))
         (comp-uno (substring s 1 (string-length s)))
         )
        ""
        )
    )
  )

(comp-uno "01101000")