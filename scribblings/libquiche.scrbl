#lang scribble/manual
@require[@for-label[libquiche
                    racket/base]]

@title{libquiche}
@author{parnikkapore}

@defmodule[libquiche]

Package Description Here
 
Welcome to my documentation: @racket[(list 'testing 1 2 3)].

@defmodule[libquiche/xml]

Tools for working with XML files

@racketblock[
(provide (contract-out
          ;; Removes " " elements from lists
          ;; (Good for cleaning up xexprs generated from pretty-printed xmls)
          [x-remove-whitespace (-> xexpr? xexpr?)]
          ;; Gets actual text content from a cdata, removing the "<![CDATA[…]]>" delimiter
          [x-cdata-content (-> cdata? string?)]))
]
