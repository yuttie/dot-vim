scriptencoding utf-8


" Autocommand group
augroup MyAutoCmds
    autocmd!
augroup end


" {{{ neobundle.vim
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    set nocompatible  " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle '29decibel/codeschool-vim-theme'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Align'
NeoBundle 'bling/vim-airline'
NeoBundle 'colorsupport.vim'
NeoBundle 'dag/vim2hs'
NeoBundle 'dannyob/quickfixstatus'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/unite-haddock'
NeoBundle 'git://gitorious.org/vim-gnupg/vim-gnupg.git'
NeoBundle 'godlygeek/tabular'
NeoBundle 'gregsexton/gitv'
NeoBundle 'gtk-vim-syntax'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'hallettj/jslint.vim'
NeoBundle 'https://conque.googlecode.com/svn/trunk/', {'directory' : 'conque'}
NeoBundle 'jceb/vim-hier'
NeoBundle 'jceb/vim-orgmode'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'LaTeX-Box'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'octol/vim-cpp-enhanced-highlight'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'osyo-manga/vim-watchdogs'
NeoBundle 'pbrisbin/html-template-syntax'
NeoBundle 'pythoncomplete'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'scratch'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sgur/unite-git_grep'
NeoBundle 'sgur/unite-qf'
NeoBundle 'Shougo/echodoc'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-session'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vim-vcs'
NeoBundle 'Shougo/vinarise'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tomasr/molokai'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-haskellimport'
NeoBundle 'ujihisa/unite-locate'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'yuttie/skk.vim'
NeoBundle 'yuttie/steady-theme-vim'
NeoBundle 'yuttie/timeline.vim'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
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
set cursorline

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
  colorscheme hybrid
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
nnoremap -   :
nnoremap j   gj
nnoremap k   gk
nnoremap gj  j
nnoremap gk  k
nnoremap P   Pg;
nnoremap gc  `[v`]
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
nnoremap <silent> [Space]cq  :cclose<CR>
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


" {{{ vim-airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 0
let g:airline_theme = "powerlineish"
let g:airline#extensions#whitespace#enabled = 0
" }}}


" {{{ indentLine
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_tty_light = 4
let g:indentLine_color_dark = 2
let g:indentLine_char = '¦'
" }}}


" {{{ timeline
let g:timeline_base_dir = expand("~/Research/Timeline")
" }}}


" {{{ vim-easymotion
" The prefix key.
nnoremap [EM]      <Nop>
nmap     [Space]m  [EM]

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

" The prefix key.
nnoremap [fugitive]   <Nop>
nmap     [Space]g  [fugitive]

nnoremap <silent> [fugitive]c  :Gcommit -v<CR>
nnoremap <silent> [fugitive]d  :Gdiff<CR>
nnoremap <silent> [fugitive]s  :Gstatus<CR>
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
nnoremap <silent> [unite]q  :<C-u>Unite qf          -auto-preview<CR>
nnoremap <silent> [unite]S  :<C-u>Unite session     -start-insert<CR>
nnoremap          [unite]s  :<C-u>Unite source      -start-insert<CR>

autocmd MyAutoCmds FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nmap <buffer> <ESC>  <Plug>(unite_exit)
  imap <buffer> jj     <Plug>(unite_insert_leave)
  imap <buffer> <C-w>  <Plug>(unite_delete_backward_path)

  " <C-l>: manual neocomplcache completion.
  inoremap <buffer> <C-l>  <C-x><C-u><C-p><Down>
endfunction

let g:unite_enable_start_insert = 1
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


" {{{ unite-haddock
let g:unite_source_haddock_browser = 'firefox'
" }}}


" {{{ neocomplete.vim
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_max_list = 1000

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell/command-history'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
autocmd MyAutoCmds FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}


" {{{ neosnippet
let g:neosnippet#snippets_directory='~/.vim/snippets'

" Plugin key-mappings.
imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)
xmap <C-l>  <Plug>(neosnippet_start_unite_snippet_target)

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
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]t  :GhcModType<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]a  :<C-u>Unite haddock -start-insert<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]A  :<C-u>UniteWithCursorWord haddock<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]i  :<C-u>Unite haskellimport -start-insert<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]I  :<C-u>UniteWithCursorWord haskellimport<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]o  :<C-u>Unite hoogle -start-insert<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]O  :<C-u>UniteWithCursorWord hoogle<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]m  :make<CR>
autocmd MyAutoCmds FileType haskell set conceallevel=0
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
