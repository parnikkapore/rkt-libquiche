#lang racket

(require xml)

(module+ test
  (require rackunit)
  (require xml/path))

;;; libquiche/xml - tools for working with XML files ================================

(provide (contract-out
          ;; Removes " " elements from lists
          ;; (Good for cleaning up xexprs generated from pretty-printed xmls)
          [x-remove-whitespace (-> xexpr? xexpr?)]
          ;; Gets actual text content from a cdata, removing the "<![CDATA[…]]>" delimiter
          [x-cdata-content (-> cdata? string?)]))

;;; Implementations ============================================================

(define (x-remove-whitespace list)
  (cond
    [(not (list? list)) list] ; Data
    [(null? list) null] ; End of list
    [(equal? (first list) " ") (x-remove-whitespace (rest list))]
    [(list? (first list)) (cons (x-remove-whitespace (first list))
                                (x-remove-whitespace (rest list)))]
    [else (cons (first list)
                (x-remove-whitespace (rest list)))]))

(module+ test
  ; Sample
  (check-equal? (x-remove-whitespace '(a " " b (c " " d))) '(a b (c d)))

  ; Unit tests
  (check-equal? (x-remove-whitespace " ") " ")
  (check-equal? (x-remove-whitespace "a") "a")
  (check-equal? (x-remove-whitespace 'b) 'b)
  (check-equal? (x-remove-whitespace '(cat (jumps " ") (lands))) '(cat (jumps) (lands)))
  (check-equal? (x-remove-whitespace
                 '(dog ((breed "chihuahua")) " " (jumps)))
                '(dog ((breed "chihuahua")) (jumps)))
  ; Might need to check if this should be the case...
  (check-equal? (x-remove-whitespace
                 '(mouse ((name " ")) " " (nibbles)))
                '(mouse ((name)) (nibbles)))
  (check-equal? (x-remove-whitespace '(a (b " " c) d " " " " e "" f)) '(a (b c) d e "" f)))


(define (x-cdata-content cdata)
  (car (regexp-match #rx"(?<=<!\\[CDATA\\[).*(?=\\]\\]>)" (cdata-string cdata))))

(module+ test
  ;; Helper function for testing x-cdata-content
  ;; CDATA section in `input` must equal `ref`
  (define (check-x-cdactt input ref)
    (let* ([a (string->xexpr input)]
           [b (se-path* '(reply) a)])
      (check-equal? (x-cdata-content b) ref)))
  
  (check-x-cdactt "<reply><![CDATA[<body>It works!</body>]]></reply>" "<body>It works!</body>")
  (check-x-cdactt "<reply><![CDATA[Ho.*wd]]y<! Wh&amp;t's up?]]></reply>" "Ho.*wd]]y<! Wh&amp;t's up?"))