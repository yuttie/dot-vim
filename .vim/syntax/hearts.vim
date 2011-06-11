"syntax case ignore

syntax match   heartsTitle /^ *=== .\+ ===$/
syntax match   heartsComment /#.*/
syntax match   heartsDocAttribute /^%[^ ]\+:/
syntax match   heartsList /^ *\(*\|-\) /
syntax match   heartsNumList /^ *\([0-9]*\.\)\+/
syntax keyword heartsTodo TODO FIXME XXX
"syntax region heartsStrike start=/--/ end=/--/
"syntax region heartsEmphasis start=/\*\*\|__/ end=/\*\*\|__/

highlight def link heartsTitle Function
highlight def link heartsComment Comment
highlight def link heartsDocAttribute Special
highlight def link heartsList Type
highlight def link heartsNumList Type
highlight def link heartsStrike Ignore
highlight def link heartsEmphasis ErrorMsg
highlight def link heartsTodo Todo

let b:current_syntax = 'hearts'

