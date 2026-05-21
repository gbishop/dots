" syn match Part /\v^[a-zA-Z_]+/
" highlight link Part Keyword
syn match Part /\v(^│)@<=\s+[a-zA-Z ]+/
highlight link Part Keyword
" syn match Ingredient /\v(│)@<=\s+[a-zA-Z%][a-zA-Z 0-9]*(\s+|)@=/ containedin=bResult
" highlight link Ingredient Identifier
" syn match Number /\v[0-9.]+/
" highlight Number guifg=lightgrey
syn match Grams /\v(^│[a-zA-Z ]+│\s+)@<=[-0-9.]+/
highlight link Grams Constant
" highlight Keyword gui=bold guifg=#ffff88
" dim the box drawing characters
syn match Box /[│├─┼┤┬┴┘└┌┐]/
highlight Box guifg=#888888
syn match DiagnosticError /\v⚠.*$/
syntax region bComment start=/\v\/\*(\+)@!/ end=/\*\//
syntax match lComment /\v#.*$/
highlight bResult guifg=#ffffff
highlight bComment gui=italic
highlight lComment gui=italic
