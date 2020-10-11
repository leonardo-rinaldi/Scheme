;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname sup-tot-cono) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Procedura che calcola la superficie totale di un cono

(define sup-tot-cono   ;result: real (cone whole surface)
  (lambda (r h)        ;r: integer (cone base radius)
                       ;h: integer (cone height)
    (* pi r (+ r (sqrt (+ (expt r 2) (expt h 2)))))
    )
  )

(sup-tot-cono 3 5)