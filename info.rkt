#lang info
(define collection "libquiche")
(define deps '("base" "reprovide-lang-lib"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/libquiche.scrbl" (multi-page))))
(define pkg-desc "Miscellaneous Racket libraries")
(define version "0.1")
(define pkg-authors '(parnikkapore))
