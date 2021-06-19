#lang racket

;; libquiche - Miscellaneous Racket libraries (Import All shortcut) ===========

; Import everything...
(require "./xml.rkt")
(require "./hash.rkt")

; ...then export them all
(provide (all-from-out "./xml.rkt"))
(provide (all-from-out "./hash.rkt"))

; These two steps should really be a macro but I am too lazy to do that