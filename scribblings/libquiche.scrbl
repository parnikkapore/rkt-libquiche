#lang scribble/manual
@require[@for-label[libquiche
                    racket
                    xml]]

@title{Libquiche - Miscellaneous Racket libraries}
@author{parnikkapore}

@defmodule[libquiche]

This collection holds functions and other stuff that I wrote to complement the Racket
standard library, but is insignificant enough to warrant its own package.

@racket[(require libquiche)] requires every part of this library.

@defmodule[libquiche/xml]

Tools for working with XML files

@defproc[ (x-remove-whitespace (list xexpr?))
          xexpr?]{
 Removes " " elements from lists
 (Good for cleaning up xexprs generated from pretty-printed xmls)
}

@defproc[ (x-cdata-content (cdata cdata?))
          string?]{
 Gets actual text content from a cdata, removing the "<![CDATA[...]]>" delimiter
}

@defmodule[libquiche/hash]

Tools for working with hashmaps

@defproc[ (hash-path (hash hash?) (keys list?))
          any/c]{
 Access child elements of a hash table by a list of keys, which forms a path
}
