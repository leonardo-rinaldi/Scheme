;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname plurale-sost) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Scrivere una procedura che dato un sostantivo singolare nella lingua italiana
;che termina con la lettera "o" o con la lettera "a" ne ricavi la forma plurale.


(define femminile? ; result: boolean
  (lambda (s)      ; s: String
    (equal?
     (substring s (- (string-length s) 1) (string-length s))
     "a")
    )
  )

(define plurale-sf     ; result: String
  (lambda (s)          ; s: String
    (string-append
     (substring s 0 (- (string-length s) 1))
     "e")
    )
  )

(define plurale-sm   ; return String
  (lambda (s)        ; s: String
    (string-append
     (substring s 0 (- (string-length s) 1))
     "i")
    )
  )

(define plurale-sost  ; result String
  (lambda (s)         ; s: String
    (if (femminile? s)
        (plurale-sf s)
        (plurale-sm s)
       )
    )
  )

(plurale-sost "carta")
(plurale-sost "gatto")

