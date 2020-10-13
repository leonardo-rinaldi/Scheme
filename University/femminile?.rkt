;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname femminile?) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Scrivere una procedura che ricevuto in ingresso un sostantivo della
;lingua italiana, restituisca "vero" se è di genere femminile e "falso"
;altrimenti

(define femminile? ; result: boolean
  (lambda (s)      ; s: String
    (equal?
     (substring s (- (string-length s) 1) (string-length s))
     "a")
    )
  )

(femminile? "montagna")
(femminile? "montagne")