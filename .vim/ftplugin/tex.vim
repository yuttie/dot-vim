" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set shiftwidth=2

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

set winaltkeys=no

" LaTeX-Suite {{{
" autocmdで.vimrcに記述しても\lvで起動するdviビューアの指定が反映されない
let g:Tex_CompileRule_dvi='platex -interaction=nonstopmode -src-specials $*'
let g:Tex_CompileRule_ps='pdvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf='dvipdfmx $*.dvi'
"let g:Tex_CompileRule_html='latex2html $*.tex'
"let g:Tex_CompileRule_bib=g:Tex_BibtexFlavor . ' $*'
let g:Tex_FormatDependency_ps='dvi,ps'
let g:Tex_FormatDependency_pdf='dvi,pdf'
let g:Tex_ViewRule_ps='evince'
let g:Tex_ViewRule_pdf='evince'
let g:Tex_ViewRule_dvi='pxdvi'
let g:Tex_Flavor='platex'
let g:Tex_BibtexFlavor='pbibtex'
let g:Tex_GotoError=1
let g:Tex_IgnoredWarnings=
\'Underfull'."\n".
\'Overfull'."\n".
\'specifier changed to'."\n".
\'You have requested'."\n".
\'Missing number, treated as zero.'."\n".
\'There were undefined references'."\n".
\'Citation %.%# undefined'."\n".
\'LaTeX Font Warning'."\n".
\'Command \\selectfont   has changed.'
let g:Tex_IgnoreLevel=9  " default 7
" }}}
