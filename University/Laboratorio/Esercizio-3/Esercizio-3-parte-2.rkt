;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Esercizio-3-parte-2) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
(define bit    ; val: intero
  (lambda (b)  ; b: stringa
    (if (string=? b "0")
        0
        1
        )
    )
  )

;Trova la base del numero

(define trova-base ; val: int 
  (lambda (s)      ; s: stringa
    (string-length s)
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


;Mi ritorna true se b è la base 16 (123456789ABCDEF)

(define base-sedici?  ;val: booleano
  (lambda (b)         ; b: Stringa (indica la base)
    (if (string=?
         (substring b (- (string-length b) 1)) "F")
        #true
        #false
        )
    )
  )

;Converte una lettera del sistema esadecimale in un
;numero intero

(define conversione-lettera ; val: int (conversione da lettera a numero)
  (lambda (s)               ; s: stringa
    (cond
      ((equal? s "A")
       10)
      ((equal? s "B")
       11)
      ((equal? s "C")
       12)
      ((equal? s "D")
       13)
      ((equal? s "E")
       14)
      ((equal? s "F")
       15)
      (else
       (string->number s))
      )
    )
  )

;conversione della parte decimale da binaria a base 10
; s * (expt 2 -length)

(define conversione-virgola   ; val: int (parte intera convertita da binario a decimale)
  (lambda (s b)               ; s: stringa (numero binario)
    (let
        (
        (l (string-length s))
        (lsb (conversione-lettera (substring s (- (string-length s) 1)))) ;conversione per base 16
        )
      (if (= l 1)
          (* (conversione-lettera s) (expt b (- l)))   ; s * (expt 2 -length)
          (+ (conversione-virgola (substring s 0 (- l 1)) b) (* lsb (expt b (- l)))) ;head + (lsb * (expt 2 -length))
          )
      )
    )
)

;Converte un numero n in base b alla base 10
; head + msb * (expt b (lunghezza - 1)
;la esamino da sinistra a destra, il numero più a destra sarà b^0
;e quindi msb * (expt b 0)

(define conversione-intera      ; val: int
  (lambda (s b)                 ; s: stringa 
    (let
        (
        (e (- (string-length s) 1))
        (msb (conversione-lettera (substring s 0 1))) ;most significant bit
        )
      (if (= (string-length s) 1)
          (*  msb (expt b 0))  ;msb * (expt b 0)
          (+ (conversione-intera (substring s 1) b) 
             (* msb (expt b e)))  ; head + msb * (expt b (lunghezza - 1)
          )
      )
    )
  )


;Conversione nel caso il numero non contenga un punto

(define conversione-senza-punto  ; val: stringa
  (lambda (s b)                  ; s: stringa
    (cond
      ((= (string-length s) 1)
       (bit s))
      ((equal? (segno? s) true)
       ((aggiungi-segno s)
       (conversione-intera (substring s 1 (string-length s)) b)))
      ((equal? (segno? s) false)
       (conversione-intera (substring s 1 (string-length s)) b))
      )
    )
  )
  

;Conversione nel caso il numero contenga un punto

(define conversione-con-punto  ; val: stringa
  (lambda (s b)                ; s: stringa
    (let
        (
         (posizione-punto (- (string-length s) (trova-punto s))) ;visto che calcola da destra devo sottrarre la lunghezza alla posizione del punto trovata
         )
      (let
          (
           (parte-intera (substring s 0 (- posizione-punto 1)))     ;separo parte intera e parte decimale
           (parte-decimale (substring s posizione-punto (string-length s)))
           )
      (if (equal? (segno? s) true)
          ((aggiungi-segno s)
          (+ (conversione-intera (substring parte-intera 1) b)
             (conversione-virgola parte-decimale b)))
          (+ (conversione-intera parte-intera b)
             (conversione-virgola parte-decimale b))
          )
        )
      )
    )
  )

;assegna alle lettere della stringa s l'equivalente in notazione
;numerica binaria b "zu" "-uuzz" --> "01" "-1100"

(define conversione-letterale ;val: stringa (stringa con caratteri convertita in striga numerica binaria)
  (lambda (b s)               ; b: stringa (base) s: stringa (numero in lettere da convertie)
    (let
        (
         (x (substring b 0 1))
         )
      (if (> (string-length s) 0)
          (if (equal? (substring s 0 1) x)
              (string-append ;se è uguale al primo elemento di b cioè 0 allora unisci 0 e il resto dlla stringa
               "0" (conversione-letterale b (substring s 1 (string-length s)))) 
              (string-append  ;se è uguale al secondo elemento di b cioè 1 allora unisci 1 e il resto dlla stringa
               "1" (conversione-letterale b (substring s 1 (string-length s)))))
          "") ; quando arrivi alla fine scrivi ""
      )
    )
  )

;converte il numero letterale in un intero in base 10 e li aggiunge davanti
;il giusto segno se necessario

(define conversione-numero-letterale ; val: int
  (lambda (b s)                      ; b: stringa (base) s: stringa (numero in formato stringa)
    (let
        (
         (con-segno (conversione-letterale b (substring s 1 (string-length s))))
         (senza-segno (conversione-letterale b s))
         )
      (if (equal? (segno? s) true)
       ((aggiungi-segno s) (conversione-intera con-segno (trova-base b))) 
       (conversione-intera senza-segno (trova-base b))
       )
      )
    )
  )

;Converte il numero inserito alla base 10
;se il numero è composto solo da lettere verrà convertito
;tramite la procedura conversione-numero-letterale

(define decidi-conversione ; val: intero (numero convertito in base 10)
  (lambda (b s)            ; b: stringa (base) ; s: stringa (numero in formato stringa)
    (cond
       ((equal? (string->number (substring b 0 1)) false) ;se la prima cifra della base è una lettera
        (conversione-numero-letterale b s))
       ((equal? (punto? s) true)
        (conversione-con-punto s (trova-base b))) 
       ((equal? (punto? s) false)
        (conversione-senza-punto s (trova-base b))) 
       )
    )
  )

(define rep->number ;val: int (rappresentazione in base 10)
  (lambda (b n)     ;b: stringa (base) n: stringa (numero da convertire in base 10)
    (decidi-conversione b n)
    )
  )

(rep->number "zu" "-uuzz")
(rep->number "0123" "+21.1")
(rep->number "01234" "-10.02")
(rep->number "0123456789ABCDEF" "0.A")
(rep->number "0123456789ABCDEF" "1CF.0")














      
