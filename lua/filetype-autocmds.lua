vim.cmd [=[
" {{{ Crystal
autocmd MyAutoCmds FileType crystal setlocal shiftwidth=2
" }}}


" {{{ fish
autocmd MyAutoCmds FileType fish setlocal foldmethod=expr
" }}}


" {{{ Help
" Close a help window by `q'
autocmd MyAutoCmds FileType help nnoremap <buffer><silent> q :close<CR>
" "}}}"


" {{{ Lua
autocmd MyAutoCmds FileType lua setlocal shiftwidth=2
" }}}


" {{{ TeX
autocmd MyAutoCmds FileType tex setlocal shiftwidth=2
autocmd MyAutoCmds FileType bib setlocal shiftwidth=2
" }}}


" {{{ Shell Scripts
autocmd MyAutoCmds FileType sh,csh,fish,tcsh,zsh setlocal shiftwidth=2
" }}}


" {{{ Ruby
autocmd MyAutoCmds FileType ruby,eruby setlocal shiftwidth=2
" }}}


" {{{ Python
autocmd MyAutoCmds FileType python setlocal tabstop=8
autocmd MyAutoCmds FileType python setlocal expandtab
autocmd MyAutoCmds FileType python setlocal softtabstop=4
autocmd MyAutoCmds FileType python setlocal shiftwidth=4
" }}}


" {{{ YAML
autocmd MyAutoCmds FileType yaml setlocal shiftwidth=2
" }}}


" {{{ Elm
autocmd MyAutoCmds FileType elm setlocal shiftwidth=2
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
