#lang racket

;; libquiche/hash - tools for working with hashmaps ================================

(provide hash-path) ;; Access child elements of a hash map by a list of keys, which forms a path

;; Implementations ============================================================

(define (hash-path hash keys)
  (if (empty? keys)
      hash
      (hash-path (hash-ref hash (first keys)) (rest keys))))
