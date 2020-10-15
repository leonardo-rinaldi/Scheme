;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname comp-uno-dx) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Scrivere una procedura che calcoli il complemento a 1 di una stringa
;a partire dal carattere più a destra (cifra meno significativa).

(define one-comp-bit   ; Result: String
  (lambda (s)          ; s: String
    (if (string=? s "0")
        "1"
        "0"
        )
    )
  )

(define comp-uno-dx
  (lambda (s)
    (if (> (string-length s) 0 )
        (string-append
         (comp-uno-dx (substring s 0 (- (string-length s) 1)))
         (one-comp-bit (substring s (- (string-length s ) 1) (string-length s)))
         )
        " "
        )
    )
  )

(comp-uno-dx "01101")