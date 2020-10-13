;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname verbo-coniug-2?) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Scrivere una procedura che, ricevuto in ingresso un verbo della lingua
;italiana all'infinito restituisca "vero" se appartiene alla seconda
;coniugazione, e "falso" altrimenti.

(define verbo-coniug-2?  ; result: boolean
  (lambda (s)            ; s: String
    (equal?
     (substring s (- (string-length s) 3) (string-length s))
     "ere")
    )
  )

(verbo-coniug-2? "cadere")
(verbo-coniug-2? "andare")