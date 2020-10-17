;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Esercizio-1) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;Esercizio-1 Laboratorio di programmazione

;La procedura controlla se un soggetto o un predicato
;è maschile

(define is-maschile?    ; val: booleano
  (lambda (s)           ; s: stringa (soggetto o predicato)
    (or
     (string=? (substring s (- (string-length s) 1)) "o")
     (string=? (substring s (- (string-length s) 1)) "i")
    )
  )
 )

;La procedura aggiunge l'articolo giusto al soggetto o
;predicato maschile

(define articolo-maschile   ; val: stringa
  (lambda (s)               ; s : stringa (soggetto o predicato)
    (if
     (string=? (substring s (- (string-length s) 1)) "o")
       (string-append "il " s)
       (string-append "i " s)
       )
    )
  )

;La procedura aggiunge l'articolo giusto al soggetto o
;predicato femminile

(define articolo-femminile  ; val: stringa
  (lambda (s)               ; s: stringa (soggetto o predicato)
    (if
     (string=? (substring s (- (string-length s) 1)) "a")
     (string-append "la " s)
     (string-append "le " s)
     )
    )
  )

;Questa procedura verifica se il soggetto o predicato
;sono maschili o femminili e aggiunge il giusto articolo

(define giusto-articolo    ; val: stringa
  (lambda (a)              ; a: stringa (articolo)
    (if (equal? (is-maschile? a) true)
        (articolo-maschile a)
        (articolo-femminile a)
        )
    )
  )

;Questa procedura controlla se il soggetto è singolare

(define is-singolare?  ; val: booleano
  (lambda (s)          ; s: stringa (soggetto)
    (or
     (string=? (substring s (- (string-length s) 1)) "o")
     (string=? (substring s (- (string-length s) 1)) "a")
    )
  )
 )


;Questa procedura coniuga il verbo in are

(define coniug-verbo-1    ; val: stringa (verbo coniugato)
  (lambda (s v)           ; s: stringa (soggetto) v: stringa (verbo)
    (cond
      ((and
        (equal? (is-maschile? s) true) (equal? (is-singolare? s) true))   ;caso in cui il soggetto è maschile singolare
         (string-append (substring v 0 (- (string-length v) 3)) "a"))
      
        ((and
          (equal? (is-maschile? s) true) (equal? (is-singolare? s) false))   ;caso in cui il soggeto è maschile plurale
            (string-append (substring v 0 (- (string-length v) 3)) "ano"))
         
        ((and
          (equal? (is-maschile? s) false) (equal? (is-singolare? s) true))   ;caso in cui il soggetto è femminile singolare
           (string-append (substring v 0 (- (string-length v) 3)) "a"))

        ((and
          (equal? (is-maschile? s) false) (equal? (is-singolare? s) true))   ;caso in cui il soggetto è maschile plurale
           (string-append (substring v 0 (- (string-length v) 3)) "ano"))

        (else "Errore")
        )
    )
  )


;Questa procedura coniuga il verbo ere, ire

(define coniug-verbo-2-3   ; val: stringa (verbo coniugato)
  (lambda (s v)            ; s: stringa (soggetto) v: stringa (verbo)
    (cond
      ((and
        (equal? (is-maschile? s) true) (equal? (is-singolare? s) true)) 
          (string-append (substring v 0 (- (string-length v) 3)) "e"))

      ((and
        (equal? (is-maschile? s) true) (equal? (is-singolare? s) false))
         (string-append (substring v 0 (- (string-length v) 3)) "ono"))

      ((and
        (equal? (is-maschile? s) false) (equal? (is-singolare? s) true))
        (string-append (substring v 0 (- (string-length v) 3)) "e"))

      ((and
        (equal? (is-maschile? s) false) (equal? (is-singolare? s) false))
        (string-append (substring v 0 (- (string-length v) 3)) "ono"))

      (else "Errore")
      )
    )
  )


;La procedura coniga il verbo

(define coniugazione   ; val: stringa
  (lambda (s v)        ; s: stringa (soggetto) v: stringa (verbo) 
    (cond
      ((string=? (substring v (- (string-length v) 3)) "are")
       (coniug-verbo-1 s v))
      ((string=? (substring v (- (string-length v) 3)) "ere")
       (coniug-verbo-2-3 s v))
      ((string=? (substring v (- (string-length v) 3)) "ire")
       (coniug-verbo-2-3 s v))
      )
    )
  )


;Questa procedura unisce soggetto, verbo e complemento

(define frase       ; val: stringa
  (lambda (s v c)   ; s: stringa (soggetto) v: stringa (verbo) c: stringa (complemento)  
    (string-append
     (giusto-articolo s) " "
     (coniugazione s v) " "
     (giusto-articolo c )
     )
    )
  )


(frase "gatto" "cacciare" "topi")
(frase "mucca" "mangiare" "fieno")
(frase "sorelle" "leggere" "novella")
(frase "bambini" "amare" "favole")
(frase "musicisti" "suonare" "pianoforti")
(frase "cuoco" "friggere" "patate")
(frase "camerieri" "servire" "clienti")
(frase "mamma" "chiamare" "figlie")





      