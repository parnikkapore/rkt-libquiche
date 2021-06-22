#lang racket

(module+ test
  (require rackunit))

;; libquiche/hash - tools for working with hashmaps ================================

(provide hash-path) ;; Access child elements of a hash map by a list of keys, which forms a path

;; Implementations ============================================================

(define (hash-path hash keys)
  (if (empty? keys)
      hash
      (hash-path (hash-ref hash (first keys)) (rest keys))))

(module+ test
  (define test-hash
    #hash((Languages .
                     #hash((ALGOL .
                                  #hash((BASIC . "c64emu")
                                        (C . "gcc")
                                        (C++ . "g++")))
                           (Lisp .
                                 #hash(("Common Lisp" . "gnucl")
                                       ("Emacs Lisp" . "emacs")
                                       (Racket . "racket")))))))
  
  (check-equal? (hash-path test-hash '(Languages ALGOL C++))
                "g++")
  (check-equal? (hash-path test-hash '(Languages Lisp "Emacs Lisp"))
                "emacs")
  (check-equal? (hash-path test-hash '(Languages ALGOL))
                #hash((BASIC . "c64emu") (C . "gcc") (C++ . "g++"))))