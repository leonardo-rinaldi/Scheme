;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname palindrome?) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Una stringa s è una palindrome se è perfettamente simmetrica rispetto al centro, cioè
;se procedo da sinistra a destra oppure da destra a sinistra si legge la stessa sequenza
;di caratteri, come nel caso di "ilredevevederli" e "acetonellenoteca". Scrivi un programma
;in Scheme che consenta di verificae se una data stringa è palindrome.


;Procedimento:
; controllo per prima cosa se la stringa è lunga 0 oppure 1, in quel caso è true
; altrimenti faccio un and (che, se anche un elemento è false mi darà false come
; risultato) di un equal? che confronta la prima lettera della stringa con l'ultima
; e la ricorsione che a sua volta controllerà la prima lettera con l'ultima e darà
; true o false.

(define palindrome? ;val: booleano
  (lambda (s)       ;s: stringa
    (if (or (= (string-length s) 0) (= (string-length s) 1))
       true
      (and
       (equal? (substring s 0 1) (substring s (- (string-length s) 1) (string-length s))) ;faccio un and del confronto tra la prima lettera e l'ultima e la ricorsione che confronterà la prima lettera e l'ultima se ho anche un false il risultato darà false, se sono tutti true il risultato sarà true
       (palindrome? (substring s 1 (- (string-length s) 1))))
      )
    )
  )

(palindrome? "")
(palindrome? "a")
(palindrome? "nono")
(palindrome? "erodere")
(palindrome? "ilredevevederli")
(palindrome? "acetonellenoteca")