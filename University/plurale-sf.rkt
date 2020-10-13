;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname plurale-sf) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Scrivere una procedura che restituisce la forma plurale di un sostantivo
;femminile singolare nella lingua italiana che termini in "a".

(define plurale-sf     ; result: String
  (lambda (s)          ; s: String
    (string-append
     (substring s 0 (- (string-length s) 1))
     "e")
    )
  )

(plurale-sf "gatta")
(plurale-sf "donna")