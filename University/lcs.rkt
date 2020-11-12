;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname lcs) (read-case-sensitive #t) (teachpacks ((lib "drawings.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.rkt" "installed-teachpacks")) #f)))
(define lcs      ;val: stringa (Longest Common Subsequence)
  (lambda (u v)  ; u, v: stringhe
    (cond
      ((or (string=? u "") (string=? v ""))
           "")
      ((char=? (string-ref u 0) (string-ref v 0))
       (string-append
        (substring u 0 1)
        (lcs (substring u 1) (substring v 1))))
      (else
       (longer (lcs (substring u 1) v) (lcs u (substring v 1))))
      )
    )
  )

;Ritorna la stringa più lunga ta u e v

(define longer   ;val: stringa
  (lambda (u v)  ; u, v: stringhe
    (let
        ((m (string-length u))
         (n (string-length v))
      )
    (cond
      ((< m n)
       v)
      ((> m n)
       u)
      ((= (random 2) 0)
       v)
      (else
       u)
      )
    )
  )
 )

(lcs "AGACTGAACATAC" "GATCCGACTAC")
