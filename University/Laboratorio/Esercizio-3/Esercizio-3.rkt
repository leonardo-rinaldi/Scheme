;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Esercizio-3) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
(define bit    ; val: intero
  (lambda (b)  ; b: stringa
    (if (string=? b "0")
        0
        1
        )
    )
  )

;conversione della parte intera da binaria a base 10

(define conversione-intera  ; val: intero (conversione da binario a decimale)
  (lambda (s)               ; s: stringa (numero binario)
    (let
        ((k (- (string-length s) 1))
         )
      (let
          (
           (head (substring s 0 (- (string-length s) 1)))
           (lsb (substring s k))
        )
      (if (= k 0)
          (bit lsb)
          (+ (* (conversione-intera (substring s 0 (- (string-length s) 1)))
                2) (bit (substring s k)))
          )
      )
    )
  )
 )

;conversione della parte decimale da binaria a base 10
 ; s * (expt 2 -length)

(define conversione-virgola   ; val: int (parte intera convertita da binario a decimale)
  (lambda (s)                 ; s: stringa (numero binario)
    (let
        (
        (l (string-length s))
        (lsb (substring s (- (string-length s) 1)))
        )
      (if (= l 1)
          (* (string->number s) (expt 2 (- l)))   ; s * (expt 2 -length)
          (+ (conversione-virgola (substring s 0 (- l 1))) (* (string->number lsb) (expt 2 (- l)))) ;head + (lsb * (expt 2 -length))
          )
      )
    )
  )

;Vedo se c'è un punto

(define punto?  ; val: booleano
  (lambda (n)   ; n: stringa
      (if (> (string-length n) 0)   
          (if (equal? (substring n 0 1) ".") ;controlla se la prima cifra è un punto
              #true
              (punto? (substring n 1 (string-length n)))  ; altrimenti ho una nuova stringa da 1 fino alla fine
              )
          #false)
      )
   )

;trova la posizione del punto
;parte dal fondo

(define trova-punto  ; val: booleano
  (lambda (n)        ; n: stringa
      (if (> (string-length n) 0)   
          (if (equal? (substring n 0 1) ".")                   ;controlla se la prima cifra è un punto
              (- (string-length n) 1)                          ;si fermerà nella posizione dove c'è il punto e quindi la stringa avrà la suddetta lunghezza
              (trova-punto (substring n 1 (string-length n)))  ; altrimenti ho una nuova stringa da 1 fino alla fine
              )
          0)
      )
   )

;Identifica se è presente un segno davanti al numero

(define segno?   ; val: booleano
  (lambda (s)    ; s: stringa
    (let
       ((k (substring s 0 1))
        )
      (cond
        ((equal? k "+")
         #true)
         ((equal? k "-")
          #true)
          (else
           #false)
          )
      )
    )
  )

;Provvede ad aggiungere il segno davanti al risultato

(define aggiungi-segno  ; val: stringa
  (lambda (s)           ; s: stringa
    (let
       ((k (substring s 0 1))
        )
      (if (equal? k "-")
          -
          +)
      )
    )
  )

;Conversione nel caso il numero non contenga un punto

(define conversione-senza-punto  ; val: stringa
  (lambda (s)                    ; s: stringa
    (cond
      ((= (string-length s) 1)
       (bit s))
      ((equal? (segno? s) true)
       (conversione-intera (substring s 1 (string-length s))))
      ((equal? (segno? s) false)
       (conversione-intera (substring s 1 (string-length s))))
      )
    )
  )
  

;Conversione nel caso il numero contenga un punto

(define conversione-con-punto  ; val: stringa
  (lambda (s)                  ; s: stringa
    (let
        (
         (posizione-punto (- (string-length s) (trova-punto s))) ;visto che calcola da destra devo sottrarre la lunghezza alla posizione del punto trovata
         )
      (let
          (
           (parte-intera (substring s 0 (- posizione-punto 1)))     ;Divido parte intera e parte decimale
           (parte-decimale (substring s posizione-punto (string-length s)))
           )
      (if (equal? (segno? s) true)
          (+ (conversione-intera (substring parte-intera 1))
             (conversione-virgola parte-decimale))
          (+ (conversione-intera parte-intera)
             (conversione-virgola parte-decimale))
          )
        )
      )
    )
  )

(define bin-rep->number
  (lambda (s)
    (if (equal? (punto? s) true)
        ((aggiungi-segno s) (conversione-con-punto s))    ;caso in cui contenga una punto
        ((aggiungi-segno s) (conversione-senza-punto s))  ;caso in cui non contenga una punto
        )
    )
  )


(bin-rep->number "+1101")
(bin-rep->number "0")
(bin-rep->number "10110.011")
(bin-rep->number "-0.1101001")