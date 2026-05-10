syn match Field /\v(│)@<=\s+[a-zA-Z%][a-zA-Z 0-9]*(\s+|)@=/
highlight Field gui=bold guifg=#ffff88
" dim the box drawing characters
syn match Box /[│├─┼┤┬┴┘└┌┐]/
highlight Box guifg=#888888
syn match DiagnosticError /\v\|@<=[ a-zA-Z]+!/
syntax region bResult start=/\v\/\*\+/ end=/\v\+\*\// contains=Field,Box
syntax region bComment start=/\v\/\*(\+)@!/ end=/\*\//
syntax match lComment /\v#.*$/
highlight bResult guifg=#ffffff
highlight bComment gui=italic
highlight lComment gui=italic
