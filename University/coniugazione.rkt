;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname coniugazione) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
; Scrivere una procedura che dato un verbo all'infinito
; presente, lo coniughi al participio passato.


(define verbo-coniug-2?  ; result: boolean
  (lambda (s)            ; s: String
    (equal?
     (substring s (- (string-length s) 3) (string-length s))
     "ere")
    )
  )

(define part-pas-2   ; result: String
  (lambda (s)        ; s: String
    (string-append
     (substring s 0 (- (string-length s) 3 ))
      "uto")
    )
  )

(define part-pas1e3  ; result: String
  (lambda (s)         ; s: String
    (string-append
     (substring s 0 (- (string-length s) 3))
     "ato")
    )
  )

(define coniugazione    ; result: String
  (lambda (s)           ; s: String
    (if (verbo-coniug-2? s)
        (part-pas-2 s)
        (part-pas1e3 s)
        )
    )
  )

(coniugazione "saltare")