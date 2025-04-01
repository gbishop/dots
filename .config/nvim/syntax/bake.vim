syn match Part /\v^\s*[a-zA-Z][a-zA-Z0-9 ]+\s+\|.*\|.*\|$/
highlight Part gui=bold guifg=#ffff80
syn match DiagnosticError /\v\|@<=[ a-zA-Z]+!/
