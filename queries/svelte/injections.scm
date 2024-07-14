; Inject CSS into style blocks with lang="postcss"
((style_element
  (start_tag
    (attribute
      (attribute_name) @_attr
      (quoted_attribute_value (attribute_value) @_lang)))
  (raw_text) @injection.content)
 (#eq? @_attr "lang")
 (#eq? @_lang "postcss")
 (#set! injection.language "css"))

; Inject TypeScript into script blocks with lang="ts"
((script_element
  (start_tag
    (attribute
      (attribute_name) @_attr
      (quoted_attribute_value (attribute_value) @_lang)))
  (raw_text) @injection.content)
 (#eq? @_attr "lang")
 (#eq? @_lang "ts")
 (#set! injection.language "typescript"))
