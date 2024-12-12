vim.cmd [=[
" {{{ fish
autocmd MyAutoCmds FileType fish setlocal foldmethod=expr
" }}}


" {{{ Help
" Close a help window by `q'
autocmd MyAutoCmds FileType help nnoremap <buffer><silent> q :close<CR>
autocmd MyAutoCmds FileType help setl conceallevel=0
" "}}}"


" {{{ TeX
autocmd MyAutoCmds FileType tex setlocal wrap
" }}}


" {{{ Python
autocmd MyAutoCmds FileType python setlocal tabstop=8
autocmd MyAutoCmds FileType python setlocal expandtab
autocmd MyAutoCmds FileType python setlocal softtabstop=4
" }}}


" {{{ Vim
autocmd MyAutoCmds FileType vim setlocal keywordprg=:help
" }}}
]=]
