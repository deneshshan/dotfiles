; extends

; Treat ActiveRecord scope declarations as foldable regions so `zc`
; (and `<leader>fm`) work on them just like method definitions.
(call
  method: (identifier) @_method
  (#eq? @_method "scope")) @fold
