#lang racket
(require xml)

;;; pnkp/xml - tools for working with XML files ================================

(provide (contract-out
          ;; Removes " " elements from lists
          ;; (Good for cleaning up xexprs generated from pretty-printed xmls)
          [x-remove-whitespace (-> xexpr? xexpr?)]
          ;; Gets actual text content from a cdata, removing the "<![CDATA[…]]>" delimiter
          [x-cdata-content (-> cdata? string?)]))

;;; Implementations ============================================================

(define (x-remove-whitespace list)
  (cond
    [(null? list) null] ; End of list
    [(equal? (first list) " ") (x-remove-whitespace (rest list))]
    [(list? (first list)) (cons (x-remove-whitespace (first list))
                                (x-remove-whitespace (rest list)))]
    [else (cons (first list)
                (x-remove-whitespace (rest list)))]))
; Tests
; (x-remove-whitespace '(" " a (b " " c) d " " " " e "" f)) -> '(a (b c) d e "" f)


(define (x-cdata-content cdata)
  (car (regexp-match #rx"(?<=<!\\[CDATA\\[).*(?=\\]\\]>)" (cdata-string cdata))))
