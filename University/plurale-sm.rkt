;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname plurale-sm) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Scrivere una procedura che restituisce la forma plurale di un sostantivo
;maschile nella lingua italiana che termini in "-0"

(define plurale-sm   ;return String
  (lambda (s)        ; s: String
    (string-append
     (substring s 0 (- (string-length s) 1))
     "i")
    )
  )

(plurale-sm "gatto")
(plurale-sm "animale")