;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname participio-presente) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Scrivere una procedura che coniughi un verbo regolare
;dall'infinito presente al participio passato.

(define part-pas-2   ; result: String
  (lambda (s)        ; s: String
    (string-append
     (substring s 0 (- (string-length s) 3 ))
      "uto")
    )
  )

(define part-pass1e3  ; result: String
  (lambda (s)         ; s: String
    (string-append
     (substring s 0 (- (string-length s) 3))
     "ato")
    )
  )

(part-pas-2 "sapere")
(part-pass1e3 "andare")     
                