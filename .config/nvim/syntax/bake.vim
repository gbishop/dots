syn match Part /\v^\s*[a-zA-Z][a-zA-Z0-9 ]+\s+\|.*\|.*\|$/
highlight Part gui=bold guifg=#ffff80
syn match DiagnosticError /\v\|@<=[ a-zA-Z]+!/
syntax region bResult start=/\v\/\*\+/ end=/\v\+\*\// contains=Part
syntax region bComment start=/\v\/\*(\+)@!/ end=/\*\//
syntax match lComment /\v#.*$/
highlight bResult guifg=#ffffff
highlight bComment gui=italic
highlight lComment gui=italic
