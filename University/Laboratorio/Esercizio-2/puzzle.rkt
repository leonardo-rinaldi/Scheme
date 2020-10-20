;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname puzzle) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
;; Square-Cross Puzzle
;; Claudio Mirolo, 6/11/2014

;; Per eseguire questo codice e' necessario
;; utilizzare il TeachPack "drawings.ss"


;; Square-Cross Puzzle
;;
;; Hai a disposizione due forme base:
;;
;;   larger-tile
;;
;;   smaller-tile
;;
;; Puoi spostare e combinare le forme con le operazioni:
;;
;;   (shift-down <forma> <passi>)
;;
;;   (shift-right <forma> <passi>)
;;
;;   (quarter-turn-right <forma>)
;;
;;   (quarter-turn-left <forma>)
;;
;;   (half-turn <forma>)
;;
;;   (glue-tiles <forma> <forma>)
;;
;; dove  <forma>  e' una delle due forme base, eventualmente
;; spostata e/o ruotata,  <passi>  e' un numero naturale positivo
;; che rapresenta un'unita' di lunghezza minima dei possibili
;; spostamenti in giu' o a sinistra.
;; Le operazioni consentono, rispettivamente, di spostae in basso,
;; spostare a destra, ruotare di 90 gradi in senso orario, ruotare
;; di 90 gradi in senso antiorario, capovolgere e combinare
;; insieme due forme. ... Si capisce meglio provando!
;;
;; L'obiettivo e' di costruire una croce regolare e un quadrato
;; con il minimo numero di pezzi, corrispondenti alle forme base,
;; opportunamente posizionati e orientati.
;;
;; Quali altre figure si possono costruire?


;; Traslazione unitaria da utilizzare con il puzzle

(set-puzzle-shift-step!)

;procedura per creare un quadrato

(define quadrato
  (glue-tiles
     (glue-tiles
       ;triangolo a destra
      (shift-down
        (shift-right larger-tile 3) 2)
           ;trinagolo inferiore
           (shift-right 
           (shift-down   
           (quarter-turn-right larger-tile) 3) 1)
          )
      (glue-tiles
       ;triangolo a sinistra
       (shift-down
         (shift-right
         (half-turn larger-tile) 1) 1)
       ;triangolino superiore
       (shift-down
         (shift-right
         (half-turn smaller-tile) 3)1)
       )
     )
  )

quadrato

;Procedura per creare una croce

(define croce
  ;Unisco insieme i due triangolini e i larger-tile di destra e sinistra
  (glue-tiles
  (glue-tiles
   ;unisce larger-tile a sinistra e larger tile a destra
  (glue-tiles
   larger-tile
     (shift-down
       (shift-right
       (half-turn larger-tile) 2) 1)
      )
         ;triangolino nella parte superiore
        (shift-right smaller-tile 2))
         ;triangolino nella parte inferiore
         (shift-right
          (shift-down
           (half-turn smaller-tile) 5) 2)
           

  ))

croce







