" Keep the box borders grey
syn match Box /[│├─┼┤┬┴┘└┌┐]/
highlight Box guifg=#888888

" Part headers: text in cells on rows that do not begin with an empty cell.
syn match PartText /\v(^│.*)@<=&(^│\s+│.*)@<![-a-z0-9.]+/ contains=Box
highlight PartText guifg=#ffffcc

" Grams column
syn match Grams /\v(^│[a-zA-Z ]+│\s+)@<=[-0-9.]+/
highlight link Grams Constant

" Error messages
syn match DiagnosticError /\v⚠.*$/

" Block and line comments
syntax region bComment start=/\v\/\*(\+)@!/ end=/\*\//
syntax match lComment /\v#.*$/
highlight bComment gui=italic
highlight lComment gui=italic
