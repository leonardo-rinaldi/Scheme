;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname sup-tot-cil) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Procedura che calcola la superficie totale di un cilindro

(define sup-tot-cil  ;result real (cylinder whole surface)
  (lambda (r h)      ;r: Integer (Cylinder base radius)
                     ;h: Integer (Cylinder height)
    (* 2 pi (+ r h))
    )
  )

(sup-tot-cil 3 5)