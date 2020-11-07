;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Esercizio-5) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
(define manhattan-2d     ;val: intero
  (lambda (i j)  ; i, j: interi non negativi
    (cond ((= i 0) 1)
          ((= j 0) 1)
          (else
           (+ (manhattan-2d (- i 1) j)
              (manhattan-2d i (- j 1)))
           ))
    ))


(define manhattan-3d  ;val: intero
  (lambda (i j k)     ; i, j, k: interi non negativi
    (cond ((= i 0)
           (manhattan-2d j k))  ;se i = 0 svolgi manhattan in 2d con j e k
          ((= j 0)
           (manhattan-2d i k))  ;se j = 0 svolgi manhattan 2d con i e k
          ((= k 0)
           (manhattan-2d i j))  ; se k = 0 svolgi manhattan 2d con i e j
          (else      ;altrimenti ricorsione
           (+ (manhattan-3d (- i 1) j k)
              (manhattan-3d i (- j 1) k)
              (manhattan-3d i j (- k 1)))
           )
        )
     )
  )

(manhattan-3d 0 0 7)
(manhattan-3d 2 0 2)
(manhattan-3d 1 1 1)
(manhattan-3d 1 1 5)
(manhattan-3d 2 3 1)
(manhattan-3d 2 3 3)
