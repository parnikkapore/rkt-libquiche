# pnkp - Miscellaneous Racket libraries

Random Racket libraries that should be useful to more than one project

## xml - tools for working with XML files

```racket
(provide (contract-out
          ;; Removes " " elements from lists
          ;; (Good for cleaning up xexprs generated from pretty-printed xmls)
          [x-remove-whitespace (-> xexpr? xexpr?)]
          ;; Gets actual text content from a cdata, removing the "<![CDATA[…]]>" delimiter
          [x-cdata-content (-> cdata? string?)]))
```
