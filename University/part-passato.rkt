;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname part-passato) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Creare una procedura che conniughi una forma verbale
;dall'infinito, seconda coniugazione ("ere") ad esempio:
;"credere", "sedere", "vedere" al participio passato:
;"creduto", "seduto", "veduto".

(define part-passato   ;val: stringa (coniugazione al partiipio passato)
  (lambda (v)          ;v: stringa
    (string-append 
     (substring v  0 (- (string-length v) 3))
     "uto"
     )
    )
  )

(part-passato "credere")