;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Esercizio-7) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
(define belong?  ;val: booleano
  (lambda (x s)  ;x: intero s: lista
    (cond
      ((null? s)
       false)
      ((equal? x (car s))
       true)
      (else
       (belong? x (cdr s))
       ))
    ))

(belong? 18 '())
(belong? 18 '(5 7 10 18 23))
(belong? 18 '(5 7 10 12 23))

(define position  ;val: intero
  (lambda (x s)   ;x: elemento della lista s: lista
    (if (= x (car s))
        0
        (+ 1 (position x (cdr s)))
        )
    )
  )

(position 7 '(7 8 24 35 41))
(position 35 '(7 8 24 35 41))
(position 41 '(7 8 24 35 41))

(define sorted-ins ;val: lista
  (lambda (x s)    ;x: intero, s: lista
    (cond
      ((null? s) ; se la lista s è nulla
       (cons x s))
      ((equal? x (car s))  ; se il numero è già presente nella lista
       s)
       ((> (car s) x)  ; per trovare la giusta posizione al numero
        (cons x (cons (car s) (cdr s))))
        (else
          (cons (car s) (sorted-ins x (cdr s)))
          )
        )
    )
  )

(sorted-ins 24 '())
(sorted-ins 5 '(7 8 24 35 41))
(sorted-ins 24 '(7 8 24 35 41))
(sorted-ins 27 '(7 8 24 35 41))

(define sorted-list  ;val: lista ordinata
  (lambda (s)        ;s: lista
    (if (null? s)
        null
         (sorted-ins (car s) (sorted-list (cdr s)))
    ))
  ) 

(sorted-list '(35 8 41 24 7))

    
        