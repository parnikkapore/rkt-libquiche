#lang scribble/manual
@require[@for-label[libquiche
                    racket/base
                    xml/xexpr]]

@title{Libquiche - Miscellaneous Racket libraries}
@author{parnikkapore}

@defmodule[libquiche]

This collection holds functions and other stuff I wrote to complement the Racket
standard library which aren't significant enough to warrant its own package.
Just like a quiche, it's a mixture of multiple delicious things, all in a
unified enclosure of crunchy crust and mellow cheese.

@racket[(require libquiche)] requires every part of this library.

@table-of-contents[]

@section{XML helpers: @tt{xml}}

@defmodule[libquiche/xml]

Functions for working with XML data

@defproc[ (x-remove-whitespace (list xexpr?))
          xexpr?]{
 Removes " " elements from lists
 (Good for cleaning up xexprs generated from pretty-printed xmls)
}

@defproc[ (x-cdata-content (cdata cdata?))
          string?]{
 Gets actual text content from a cdata, removing the "<![CDATA[...]]>" delimiter
}

@section{Hashmap helpers: @tt{hash}}

@defmodule[libquiche/hash]

Functions for working with hashmaps

@defproc[ (hash-path (hash hash?) (keys list?))
          any/c]{
 Access child elements of a hash table by a list of keys, which forms a path
}
