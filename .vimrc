scriptencoding utf-8


" Autocommand group
augroup MyAutoCmds
    autocmd!
augroup end


" {{{ neobundle.vim
filetype plugin indent off
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim

    call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'git://github.com/Lokaltog/vim-easymotion.git'
NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache-clang.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neocomplcache-snippets-complete.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/unite-help.git'
NeoBundle 'git://github.com/Shougo/unite-session.git'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/gregsexton/gitv.git'
NeoBundle 'git://github.com/hallettj/jslint.vim.git'
NeoBundle 'git://github.com/jceb/vim-orgmode.git'
NeoBundle 'git://github.com/jceb/vim-hier.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'git://github.com/mattn/gist-vim.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/pbrisbin/html-template-syntax.git'
NeoBundle 'git://github.com/sjl/gundo.vim.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
NeoBundle 'git://github.com/tpope/vim-markdown.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/tsukkee/unite-tag.git'
NeoBundle 'git://github.com/h1mesuke/unite-outline.git'
NeoBundle 'git://github.com/tyru/open-browser.vim.git'
NeoBundle 'git://github.com/ujihisa/neco-ghc.git'
NeoBundle 'git://github.com/ujihisa/unite-colorscheme.git'
NeoBundle 'git://github.com/ujihisa/unite-locate.git'
NeoBundle 'git://github.com/eagletmt/ghcmod-vim.git'
NeoBundle 'git://github.com/eagletmt/unite-haddock.git'
NeoBundle 'git://github.com/vim-ruby/vim-ruby.git'
NeoBundle 'git://github.com/vim-jp/cpp-vim.git'
NeoBundle 'git://github.com/yuttie/darkfruit.git'
NeoBundle 'git://github.com/yuttie/skk.vim.git'
NeoBundle 'git://github.com/yuttie/timeline.vim.git'
NeoBundle 'git://gitorious.org/vim-gnupg/vim-gnupg.git'
NeoBundle 'https://conque.googlecode.com/svn/trunk/', {'directory' : 'conque'}
NeoBundle 'Align'
NeoBundle 'gtk-vim-syntax'
NeoBundle 'LaTeX-Box'
NeoBundle 'pythoncomplete'
NeoBundle 'renamer.vim'
NeoBundle 'scratch'

filetype plugin indent on
" }}}


" Options                                                                    {{{
" ==============================================================================

" 1 important
set nocompatible

" 2 moving around, searching and patterns
set incsearch
set ignorecase
set smartcase
set nowrapscan

" 4 displaying text
set wrap
set number
if v:version >= 700
  set numberwidth=4
endif

" 6 multiple windows
set hidden        " You can change buffer without saving.
set laststatus=2  " Always show status lines.
set showcmd
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%{exists('*SkkGetModeStr')?SkkGetModeStr():''}%=%l,%c%V%8P
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%{exists('*eskk#statusline')?eskk#statusline():''}%=%l,%c%V%8P

" 7 multiple tab pages
set showtabline=2
set tabpagemax=100

" 11 printing
set printencoding=utf-8
set printmbcharset=JIS_X_1990
set printfont=monospace\ 10
set printoptions& printoptions+=number:y
set printmbfont=r:GothicBBB-Medium

" 12 messages and info
set shortmess=atToOI  " Shortens messages to avoid 'press a key' prompt.
set ruler             " Show the cursor position all the time.

" 14 editing text
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode.
set formatoptions& formatoptions+=mM
set completeopt=menuone

" 15 tabs and indenting
set expandtab     " Use white-space instead of tabs.
set shiftwidth=4  " Set indent width on autoindent.
set autoindent    " Always set auto-indenting on.
set smartindent   " Use smart indenting.
set smarttab
set cinoptions=:0,g0

" 16 folding
set foldlevelstart=99

" 19 reading and writing files
set modeline
set fileformats=unix,dos,mac  " Support all three, in this order.
set backup

" 21 command line editing
set history=1000  " Keep 1000 lines of command history.
"set suffixes& suffixes+=.info,.aux,.log,.dvi,.bbl,.out,.pdf  " Files with suffix in suffixes are ignored.
set wildmode=full  " Set completion mode.
set wildmenu
"set wildignore& wildignore+=*.o

" 25 multi-byte characters
set encoding=utf-8      " Encoding used for text inside vim.
set fileencoding=utf-8  " Default encoding for new files.
set termencoding=utf-8  " Terminal's encoding.
" Automatic file encoding recognition.
" Vim tries the specified encodings in the specified order, and stops when
" an encoding is successfully applied. Therefore widely matching encodings,
" like 'euc-jp', should be placed at the end of fileencodings.
" 'utf-8'が先頭に有っても'cp932'と'euc-jp'のファイルはちゃんとそれと識別される
" ようだ。しかし'iso-2022-jp'は識別されない。
" 'iso-2022-jp'が先頭にあると、新規ファイルのデフォルトのエンコーディングが
" 'iso-2022-jp'になる問題があるので先頭に置くことはできない。
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp,utf-16le,utf-16
set ambiwidth=double

" 26 various
set sessionoptions&
  \ sessionoptions-=options
  \ sessionoptions-=localoptions
set cryptmethod=blowfish

" }}}


" Syntax highlighting                                                        {{{
" ==============================================================================

" Show trailing whitespaces
" (from http://vim.wikia.com/wiki/Highlight_unwanted_spaces)
autocmd MyAutoCmds ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd MyAutoCmds BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd MyAutoCmds InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd MyAutoCmds InsertLeave * match ExtraWhitespace /\s\+$/
autocmd MyAutoCmds BufWinLeave * call clearmatches()

" Highlight TODO, FIXME, NOTE, etc.
" (from http://stackoverflow.com/questions/6577579/task-tags-in-vim)
autocmd MyAutoCmds Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
autocmd MyAutoCmds Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  colorscheme darkfruit
endif

" }}}


" Filetype plugin settings                                                   {{{
" ==============================================================================

" Enable plugin-provided filetype settings, but only if the ftplugin
" directory exists (which it won't on livecds, for example).
if isdirectory(expand("$VIMRUNTIME/ftplugin"))
  filetype plugin on
  filetype indent on
endif

" }}}


" Omni-completion
" ==============================================================================
if has("autocmd") && exists("+omnifunc")
    autocmd MyAutoCmds Filetype *
    \ if &omnifunc == "" |
    \   setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
endif

" }}}


" Extensions                                                                 {{{
" ==============================================================================

" {{{ Functions
function! MakeAllWindowsEqualSize()
    let g:old_tab_page = tabpagenr()
    let g:num_tab_page = tabpagenr('$')
    tabfirst
    for i in range(g:num_tab_page)
        execute "normal \<C-W>="
        tabnext
    endfor
    for i in range(g:old_tab_page - 1)
        tabnext
    endfor
endfunction

function! EditHeaderAndSourceFileInNewTab(filename)
    execute 'tab vsplit ' . a:filename . '.c'
    execute 'vsplit ' . a:filename . '.h'
endfunction
" }}}


" {{{ Commands
command! ReloadVimrc source $MYVIMRC
command! ReloadGvimrc source $MYVIMRC|source $MYGVIMRC
command! -nargs=? -bang Cp932 edit<bang> ++enc=cp932 <args>
command! -nargs=? -bang Eucjp edit<bang> ++enc=euc-jp <args>
command! -nargs=? -bang Sjis  edit<bang> ++enc=sjis <args>
command! -nargs=? -bang Utf8  edit<bang> ++enc=utf-8 <args>
command! -nargs=? -bang Utf16 edit<bang> ++enc=utf-16 <args>
command! -nargs=? -bang Jis   edit<bang> ++enc=iso-2022-jp <args>
command! -nargs=1 -complete=file Rename file <args>|call delete(expand('#'))

if has("gui_running")
    command! Enlarge16 set guifont=monospace\ 16
    command! Enlarge32 set guifont=monospace\ 32
    command! Enlarge64 set guifont=monospace\ 64
    command! Enlarge128 set guifont=monospace\ 128
endif
" }}}


" {{{ Mappings
nnoremap [Space]   <Nop>
nmap     <Space>  [Space]
vnoremap [Space]   <Nop>
vmap     <Space>  [Space]

" normal, visual+select and operator-pending
noremap <C-F12> :!ctags --recurse --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

" insert
inoremap <C-d>   <Del>

" insert and command line
noremap! <C-a>   <Home>
noremap! <C-e>   <End>
noremap! <C-b>   <Left>
noremap! <C-f>   <Right>
noremap! <M-f>   <S-Right>
noremap! <M-b>   <S-Left>

" normal
nnoremap j   gj
nnoremap k   gk
nnoremap gj  j
nnoremap gk  k
nnoremap P   Pg;
nnoremap gc  `[v`]
nnoremap <C-h>  :<C-u>help<Space>
nnoremap <silent> <ESC><ESC>  :nohlsearch<CR>
nnoremap <C-Tab>    gt
nnoremap <C-S-Tab>  gT

" command-line
cnoremap <C-p>  <Up>
cnoremap <C-n>  <Down>

" close a help window by `q'
autocmd MyAutoCmds BufWinEnter * if &buftype ==# 'help' | nnoremap <buffer><silent> q  :q<CR> | endif
autocmd MyAutoCmds BufWinEnter * if &filetype ==# 'ref-man' | nnoremap <buffer><silent> q  :q<CR> | endif
" }}}


" {{{ quickfix
autocmd QuickFixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwindow
nnoremap <silent> [Space]cc  :cc<CR>
nnoremap <silent> [Space]cn  :cn<CR>
nnoremap <silent> [Space]cp  :cp<CR>
" }}}


" {{{ Template insertion
let template_dir = "~/.vim/template"
function! InsertTemplate()
    if expand("%:t") == "NOTE"
        let tmpl_filename = expand(g:template_dir) . "/NOTE"
        if filereadable(tmpl_filename)
            execute "silent 0read " . tmpl_filename

            " delete trailing line
            mark s
            $delete
            's
        endif
    else
        let tmpl_filename = expand(g:template_dir) . "/tmpl." . expand("%:e")
        if filereadable(tmpl_filename)
            execute "silent 0read " . tmpl_filename

            call FillTemplatePlaceHolders()

            " delete trailing line
            mark s
            $delete
            's
        endif
    endif
endfunction

function! FillTemplatePlaceHolders()
    silent! %s/%HEADERNAME%/\=toupper(tr(expand("%:t"), ".", "_"))/g
endfunction

autocmd MyAutoCmds BufNewFile * call InsertTemplate()
" }}}


" {{{ vim-powerline
let g:Powerline_symbols = 'fancy'
" }}}


" {{{ timeline
let g:timeline_base_dir = expand("~/Research/Timeline")
" }}}


" {{{ vim-easymotion
" The prefix key.
nnoremap [EM]      <Nop>
nmap     [Space]e  [EM]

let g:EasyMotion_leader_key = '[EM]'
" }}}


" {{{ openbrowser.vim
nmap gw <Plug>(openbrowser-smart-search)
vmap gw <Plug>(openbrowser-smart-search)
" }}}


" {{{ skk.vim
let skk_large_jisyo = '/usr/share/skk/SKK-JISYO.L'
let skk_auto_save_jisyo = 1
let skk_show_annnotation = 1
let skk_use_face = 1
let skk_keyboard_layout = 'act'
let skk_control_j_key = '<C-j>'
" }}}


" {{{ vim-gnupg
let g:GPGPreferSymmetric = 1
" }}}


" {{{ fugitive
autocmd MyAutoCmds FileType gitcommit set spell
" }}}


" {{{ gist.vim
let g:github_user = "yuttie"
let g:github_token = "892f7d05807089d96554f0825c37e912"
" }}}


" {{{ vimfiler
let g:vimfiler_as_default_explorer = 1

" The prefix key.
nnoremap [vimfiler]   <Nop>
nmap     [Space]f  [vimfiler]

nnoremap <silent> [vimfiler]  :VimFiler<CR>
" }}}


" {{{ unite.vim
" The prefix key.
nnoremap [unite]   <Nop>
nmap     [Space]u  [unite]

nnoremap <silent> [unite]e  :<C-u>UniteWithCurrentDir buffer file_mru bookmark file -buffer-name=files<CR>
nnoremap <silent> [unite]E  :<C-u>UniteWithBufferDir  buffer file_mru bookmark file -buffer-name=files -prompt=%\ <CR>
nnoremap <silent> [unite]f  :<C-u>Unite find        -buffer-name=files<CR>
nnoremap <silent> [unite]g  :<C-u>Unite grep        -buffer-name=files<CR>
nnoremap <silent> [unite]l  :<C-u>Unite locate      -buffer-name=files<CR>
nnoremap <silent> [unite]x  :<C-u>Unite launcher    -start-insert<CR>
nnoremap <silent> [unite]h  :<C-u>Unite ref/hoogle  -start-insert<CR>
nnoremap <silent> [unite]m  :<C-u>Unite ref/man     -start-insert<CR>
nnoremap <silent> [unite]p  :<C-u>Unite ref/pydoc   -start-insert<CR>
nnoremap <silent> [unite]r  :<C-u>Unite ref/refe    -start-insert<CR>
nnoremap <silent> [unite]R  :<C-u>Unite register    -buffer-name=register<CR>
nnoremap <silent> [unite]t  :<C-u>Unite tag         -start-insert<CR>
nnoremap <silent> [unite]/  :<C-u>Unite line        -buffer-name=search -start-insert -no-quit<CR>
nnoremap <silent> [unite]y  :<C-u>Unite history/yank<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]C  :<C-u>Unite colorscheme -auto-preview<CR>
nnoremap <silent> [unite]H  :<C-u>Unite help        -start-insert<CR>
nnoremap <silent> [unite]S  :<C-u>Unite session     -start-insert<CR>
nnoremap          [unite]s  :<C-u>Unite source      -start-insert<CR>

autocmd MyAutoCmds FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  nmap <buffer> <ESC>  <Plug>(unite_exit)
  imap <buffer> jj     <Plug>(unite_insert_leave)
  "imap <buffer> <C-w>  <Plug>(unite_delete_backward_path)

  " <C-l>: manual neocomplcache completion.
  inoremap <buffer> <C-l>  <C-x><C-u><C-p><Down>

  " Start insert.
  "let g:unite_enable_start_insert = 1
endfunction"}}}

let g:unite_source_file_mru_limit = 200
let g:unite_source_history_yank_enable = 1
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'

" For optimize.
let g:unite_source_file_mru_filename_format = ''

" For unite-session.
" Save session automatically.
"let g:unite_source_session_enable_auto_save = 1
" Load session automatically.
"autocmd MyAutoCmds VimEnter * UniteSessionLoad
" }}}


" {{{ neocomplcache.vim
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_max_list = 1000

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell/command-history'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd MyAutoCmds FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd MyAutoCmds FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd MyAutoCmds FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd MyAutoCmds FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd MyAutoCmds FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
autocmd MyAutoCmds FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" }}}


" {{{ neocomplcache-snippets-complete
let g:neocomplcache_snippets_dir='~/.vim/snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" }}}


" {{{ neocomplcache-clang
let g:neocomplcache_clang_use_library = 1
let g:neocomplcache_clang_library_path = "/usr/lib/llvm"
let g:neocomplcache_clang_user_options =
    \ '-std=c++11 ' .
    \ '-I /usr/include/eigen3 ' .
    \ ''
" }}}


" {{{ vimshell
if has('win32') || has('win64')
    let g:vimshell_user_prompt = '$USERNAME . "@" . hostname() . " " . fnamemodify(getcwd(), ":~")'
else
    let g:vimshell_user_prompt = '$USER . "@" . hostname() . " " . fnamemodify(getcwd(), ":~")'
endif
let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
let g:vimshell_max_command_history = 100000
let g:vimshell_scrollback_limit = 5000

" The prefix key.
nnoremap [vimshell]   <Nop>
nmap     [Space]s  [vimshell]

nnoremap <silent> [vimshell]  :VimShell<CR>
" }}}


" {{{ quickrun
let g:quickrun_no_default_key_mappings = 1
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
      \ 'type': 'markdown/pandoc',
      \ 'cmdopt': '--standalone --mathjax',
      \ 'outputter': 'browser'}
let g:quickrun_config['cpp'] = {
      \ 'runner': 'vimproc',
      \ 'exec': '%c %o %s',
      \ 'command': 'clang++',
      \ 'cmdopt': '-std=c++11 -Wall -fsyntax-only ' .
      \           '-I /usr/include/eigen3 ' .
      \           '',
      \ 'outputter': 'quickfix'}

" The prefix key.
nnoremap [quickrun]   <Nop>
nmap     [Space]r  [quickrun]

nmap <silent> [quickrun]  <Plug>(quickrun)
" }}}


" {{{ echodoc
let g:echodoc_enable_at_startup = 1
" }}}


" {{{ vim-ref
let g:ref_alc_start_linenumber = 42
let g:ref_refe_encoding = 'euc-jp'
" }}}


" {{{ Align
let g:Align_xstrlen = 3

" The prefix key.
vnoremap [align]   <Nop>
vmap     [Space]a  [align]

vnoremap          [align]a   :Align! 
vnoremap <silent> [align],   :Align! Ip0P1=l ,\zs<CR>
vnoremap <silent> [align];   :Align! Ip0P1=l ;\zs<CR>
vnoremap <silent> [align]:   :Align! Ip0P1=l :\zs<CR>
vnoremap <silent> [align]=   :Align! Ip1P1=l =<CR>
vnoremap <silent> [align]>   :Align! Ip1P1=l -><CR>
vnoremap <silent> [align]<   :Align! Ip1P1=l <-<CR>
vnoremap <silent> [align]\|  :Align! Ip1P1=l \|<CR>
vnoremap <silent> [align]&   :Align! Ip1P1=l \\\@<!& \\\\<CR>
vmap     <silent> [align]C  <Plug>AM_aocom
vmap     <silent> [align]c  <Plug>AM_acom
vmap     <silent> [align]d  <Plug>AM_adec
vmap     <silent> [align]n  <Plug>AM_aunum
vmap     <silent> [align]q  <Plug>AM_tsq
vmap     <silent> [align]s  <Plug>AM_tsp
vmap     <silent> [align]t  <Plug>AM_Htd
" }}}


" {{{ Markdown
autocmd MyAutoCmds BufNewFile,BufRead *.{md,mkd,mkdn,mark*} set filetype=markdown
autocmd MyAutoCmds FileType markdown set shiftwidth=4
" }}}


" {{{ C/C++
autocmd MyAutoCmds BufNewFile,BufRead *.cpp set matchpairs+=<:>
" }}}


" {{{ Shell Scripts
autocmd MyAutoCmds FileType sh,csh,tcsh,zsh set shiftwidth=2
" }}}


" {{{ Ruby
autocmd MyAutoCmds FileType ruby,eruby set shiftwidth=2
" }}}


" {{{ Python
autocmd MyAutoCmds FileType python set tabstop=8
autocmd MyAutoCmds FileType python set expandtab
autocmd MyAutoCmds FileType python set softtabstop=4
autocmd MyAutoCmds FileType python set shiftwidth=4
" }}}


" {{{ Java
" <<< javacomplete plugin: Omni Completion for JAVA >>>
autocmd MyAutoCmds FileType java setlocal omnifunc=javacomplete#Complete
autocmd MyAutoCmds FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
autocmd MyAutoCmds FileType java inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
autocmd MyAutoCmds FileType java inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>
" Java ctags database
"autocmd MyAutoCmds FileType java map <buffer> <C-F12> :!ctags -R --languages=Java --fields=+iaS --extra=+q .<CR>
" }}}


" {{{ Haskell
autocmd MyAutoCmds FileType haskell setlocal makeprg=ghc\ --make\ %
" errorformat from haskellmode-vim
" http://code.haskell.org/haskellmode-vim/compiler/ghc.vim
autocmd MyAutoCmds FileType haskell setlocal errorformat=
                                                        \%-Z\ %#,
                                                        \%W%f:%l:%c:\ Warning:\ %m,
                                                        \%E%f:%l:%c:\ %m,
                                                        \%E%>%f:%l:%c:,
                                                        \%+C\ \ %#%m,
                                                        \%W%>%f:%l:%c:,
                                                        \%+C\ \ %#%tarning:\ %m,

" The prefix key.
autocmd MyAutoCmds FileType haskell nnoremap <buffer> [haskell]   <Nop>
autocmd MyAutoCmds FileType haskell nmap     <buffer> [Space]h  [haskell]

autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> <ESC><ESC>  :nohlsearch \| :GhcModTypeClear<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]c  :GhcModCheckAsync<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]d  :<C-u>Unite haddock -start-insert<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]m  :make<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]s  :<C-u>Unite hoogle -start-insert<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]t  :GhcModType<CR>
" }}}


" {{{ LaTeX
" }}}


" {{{ Context Free
autocmd MyAutoCmds BufNewFile,BufRead *.cfdg setfiletype cfdg
" }}}


" {{{ MetaPost
autocmd MyAutoCmds FileType mp map <buffer> <Leader>cc :!mpost %<CR><CR>
" }}}


" {{{ Waf
autocmd MyAutoCmds BufRead,BufNewFile wscript setfiletype python
" }}}

" }}}  Extensions


" vim: set foldmethod=marker:
