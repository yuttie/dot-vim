vim.cmd [=[
" {{{ Crystal
autocmd MyAutoCmds FileType crystal setlocal shiftwidth=2  " Rationale: Official coding style guide specifies 2 spaces
" }}}


" {{{ fish
autocmd MyAutoCmds FileType fish setlocal foldmethod=expr
autocmd MyAutoCmds FileType fish setlocal shiftwidth=4  " Rationale: `fish_indent` uses 4 spaces
" }}}


" {{{ Help
" Close a help window by `q'
autocmd MyAutoCmds FileType help nnoremap <buffer><silent> q :close<CR>
autocmd MyAutoCmds FileType help setl conceallevel=0
" "}}}"


" {{{ TeX
autocmd MyAutoCmds FileType tex setlocal shiftwidth=2
autocmd MyAutoCmds FileType bib setlocal shiftwidth=2
autocmd MyAutoCmds FileType tex setlocal wrap
" }}}


" {{{ Shell Scripts
autocmd MyAutoCmds FileType sh,zsh setlocal shiftwidth=2
" }}}


" {{{ Ruby
autocmd MyAutoCmds FileType ruby,eruby setlocal shiftwidth=2
" }}}


" {{{ Python
autocmd MyAutoCmds FileType python setlocal tabstop=8
autocmd MyAutoCmds FileType python setlocal expandtab
autocmd MyAutoCmds FileType python setlocal softtabstop=4
autocmd MyAutoCmds FileType python setlocal shiftwidth=4  " Rationale: PEP 8: Use 4 spaces per indentation level.
" }}}


" {{{ Elm
autocmd MyAutoCmds FileType elm setlocal shiftwidth=2  " Rationale: Official documentation uses 2 spaces
" }}}


" {{{ Vim
autocmd MyAutoCmds FileType vim setlocal keywordprg=:help
autocmd MyAutoCmds FileType vim setlocal shiftwidth=2
" }}}


" {{{ Web
autocmd MyAutoCmds FileType javascript setlocal shiftwidth=2
autocmd MyAutoCmds FileType typescript setlocal shiftwidth=2
autocmd MyAutoCmds FileType html       setlocal shiftwidth=2
autocmd MyAutoCmds FileType css        setlocal shiftwidth=2
autocmd MyAutoCmds FileType scss       setlocal shiftwidth=2
autocmd MyAutoCmds FileType vue        setlocal shiftwidth=2
" }}}


" {{{ XML
autocmd MyAutoCmds FileType xml setlocal shiftwidth=2
" }}}
]=]
