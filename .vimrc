scriptencoding utf-8


" Autocommand group
augroup MyAutoCmds
    autocmd!
augroup end


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
set wildmode=list:longest,full  " Set completion mode.
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
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd MyAutoCmds BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd MyAutoCmds InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd MyAutoCmds InsertLeave * match ExtraWhitespace /\s\+$/
autocmd MyAutoCmds BufWinLeave * call clearmatches()

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  colorscheme ys
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
" normal, visual+select and operator-pending
noremap <C-F12> :!ctags --recurse --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

" insert and command line
noremap! <C-a> <Home>
noremap! <C-e> <End>
noremap! <C-b> <Left>
noremap! <C-f> <Right>
noremap! <C-d> <Del>

" normal
nnoremap j   gj
nnoremap k   gk
nnoremap gj  j
nnoremap gk  k
nnoremap P   Pg;
nnoremap gc  `[v`]
nnoremap <C-h>  :<C-u>help<Space>
nnoremap <C-k>  :redraw!<CR>
nnoremap <ESC><ESC>  :nohlsearch<CR>
nnoremap <C-Tab>    gt
nnoremap <C-S-Tab>  gT
nnoremap <silent>E  :call ref#jump('normal','alc')<CR>
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
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/unite-help.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/gregsexton/gitv.git'
NeoBundle 'git://github.com/hallettj/jslint.vim.git'
"NeoBundle 'git://github.com/hallison/vim-markdown.git'
NeoBundle 'git://github.com/jceb/vim-orgmode.git'
NeoBundle 'git://github.com/mattn/gist-vim.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/sjl/gundo.vim.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
NeoBundle 'git://github.com/tpope/vim-markdown.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/h1mesuke/unite-outline.git'
NeoBundle 'git://github.com/tyru/eskk.vim.git'
NeoBundle 'git://github.com/tyru/open-browser.vim.git'
NeoBundle 'git://github.com/tyru/savemap.vim'
NeoBundle 'git://github.com/tyru/vice.vim'
NeoBundle 'git://github.com/ujihisa/neco-ghc.git'
NeoBundle 'git://github.com/ujihisa/ref-hoogle.git'
NeoBundle 'git://github.com/ujihisa/unite-colorscheme.git'
NeoBundle 'git://github.com/ujihisa/unite-locate.git'
NeoBundle 'git://github.com/eagletmt/ghcmod-vim.git'
NeoBundle 'git://github.com/vim-ruby/vim-ruby.git'
NeoBundle 'git://github.com/yuttie/skk.vim.git'
NeoBundle 'git://gitorious.org/vim-gnupg/vim-gnupg.git'
NeoBundle 'http://code.haskell.org/haskellmode-vim/', {'directory' : 'haskellmode-vim', 'type' : 'nosync'}
NeoBundle 'https://conque.googlecode.com/svn/trunk/', {'directory' : 'conque'}
NeoBundle 'Align'
NeoBundle 'Cpp11-Syntax-Support'
NeoBundle 'gtk-vim-syntax'
NeoBundle 'LaTeX-Box'
NeoBundle 'pythoncomplete'
NeoBundle 'renamer.vim'
NeoBundle 'scratch'

filetype plugin indent on
" }}}


" {{{ vim-easymotion
" The prefix key.
nnoremap [EM]      <Nop>
nmap     <Space>e  [EM]

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


" {{{ unite.vim
" The prefix key.
nnoremap [unite]   <Nop>
nmap     <Space>u  [unite]

nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir buffer file_mru bookmark file -buffer-name=files<CR>
nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir  buffer file_mru bookmark file -buffer-name=files -prompt=%\ <CR>
nnoremap <silent> [unite]f  :<C-u>Unite find        -buffer-name=files<CR>
nnoremap <silent> [unite]g  :<C-u>Unite grep        -buffer-name=files<CR>
nnoremap <silent> [unite]l  :<C-u>Unite locate      -buffer-name=files<CR>
nnoremap <silent> [unite]x  :<C-u>Unite launcher    -start-insert<CR>
nnoremap <silent> [unite]h  :<C-u>Unite ref/hoogle  -start-insert<CR>
nnoremap <silent> [unite]m  :<C-u>Unite ref/man     -start-insert<CR>
nnoremap <silent> [unite]p  :<C-u>Unite ref/pydoc   -start-insert<CR>
nnoremap <silent> [unite]r  :<C-u>Unite ref/refe    -start-insert<CR>
nnoremap <silent> [unite]R  :<C-u>Unite register    -buffer-name=register<CR>
nnoremap <silent> [unite]/  :<C-u>Unite line        -buffer-name=search -start-insert -no-quit<CR>
nnoremap <silent> [unite]y  :<C-u>Unite history/yank<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]C  :<C-u>Unite colorscheme -auto-preview<CR>
nnoremap <silent> [unite]H  :<C-u>Unite help        -start-insert<CR>
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
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
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
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd MyAutoCmds FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" }}}


" {{{ clang_complete
let g:neocomplcache_clang_use_library = 1
let g:neocomplcache_clang_library_path = "/usr/lib/llvm"
let g:neocomplcache_clang_user_options =
    \ '-std=c++11 ' .
    \ '-I /usr/include/eigen3 ' .
    \ ''
" }}}


" {{{ quickrun
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
" }}}


" {{{ echodoc
let g:echodoc_enable_at_startup = 1
" }}}


" {{{ vim-ref
let g:ref_alc_start_linenumber = 42
let g:ref_refe_encoding = 'euc-jp'
" }}}


" {{{ Align.vim
let g:Align_xstrlen = 3
" }}}


" {{{ Markdown
autocmd MyAutoCmds BufNewFile,BufRead *.{md,mkd,mkdn,mark*} set filetype=markdown
autocmd MyAutoCmds FileType markdown set shiftwidth=4
" }}}


" {{{ C/C++
" <<< C++11 Syntax Support >>>
" http://www.vim.org/scripts/script.php?script_id=3797
autocmd MyAutoCmds BufNewFile,BufRead *.cpp set syntax=cpp11
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
" <<< Haskell mode >>>
autocmd MyAutoCmds Bufenter *.hs compiler ghc
let g:haddock_browser = "xdg-open"
" }}}


" {{{ LaTeX
" <<< LaTeX-Suite >>>
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" autocmdで.vimrcに記述しても\lvで起動するdviビューアの指定が反映されない
" ので、残りの設定は$VIMFILES/ftplugin/tex.vimに記述している

"autocmd MyAutoCmds FileType tex set indentkeys-=}

" Maps
autocmd MyAutoCmds FileType tex nnoremap <Leader>cc :silent! call Tex_RunLaTeX()<CR>
autocmd MyAutoCmds FileType tex nnoremap <Leader>vv :silent! call Tex_ViewLaTeX()<CR>
autocmd MyAutoCmds FileType tex nnoremap <Leader>ss :silent! call Tex_ForwardSearchLaTeX()<CR>
autocmd MyAutoCmds FileType tex nnoremap <silent> ,l :execute ":silent !rake"<CR>
" 次の行は autocmd 化しない。
" IMAP_JumpForward のマッピングが事前に行われていない場合、
" Latex-Suite は <C-j> に対して IMAP_JumpForward のマッピングを行う。
" その為、どのファイルが読み込まれた場合でも IMAP_JumpForward が何かしらの
" キーにマップされているようにする必要がある。
" 関連URL: http://vim-latex.sourceforge.net/documentation/latex-suite/latex-suite-maps.html
imap <C-space> <Plug>IMAP_JumpForward
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


" {{{ eskk.vim
"let g:eskk#large_dictionary = '/usr/share/skk/SKK-JISYO.L'
"let g:eskk#select_cand_keys = 'aoeuhtn'
"let g:eskk#show_annotation = 1
"let g:eskk#egg_like_newline = 1
"
"autocmd MyAutoCmds User eskk-initialize-pre call s:eskk_initial_pre()
"function! s:eskk_initial_pre()
"    " ひらがな
"    let t = eskk#table#new('rom_to_hira*', 'rom_to_hira')
"
"    " from ddskk
"    call t.add_map('~', '～')
"    call t.add_map('z ', '　')
"    call t.add_map('z/', '・')
"    call t.add_map('z{', '【')
"    call t.add_map('z}', '】')
"    call t.add_map('z(', '（')
"    call t.add_map('z)', '）')
"
"    " ACT (http://www1.vecceed.ne.jp/~bemu/act/act_index.html)
"    " 基本的な打ち方
"    call t.add_map('ca', 'か')
"    call t.add_map('ci', 'き')
"    call t.add_map('cu', 'く')
"    call t.add_map('ce', 'け')
"    call t.add_map('co', 'こ')
"
"    call t.add_map("'", 'っ')
"    call t.add_map('"', 'っ')
"
"    " 拗音の打ち方(基本)
"    " 拗音化キーとして人差し指キー(G,H,M)を使うもの
"    call t.add_map('cga', 'きゃ')
"    call t.add_map('cgu', 'きゅ')
"    call t.add_map('cgo', 'きょ')
"    call t.add_map('rga', 'りゃ')
"    call t.add_map('rgu', 'りゅ')
"    call t.add_map('rgo', 'りょ')
"    call t.add_map('tha', 'ちゃ')
"    call t.add_map('thu', 'ちゅ')
"    call t.add_map('tho', 'ちょ')
"    call t.add_map('nha', 'にゃ')
"    call t.add_map('nhu', 'にゅ')
"    call t.add_map('nho', 'にょ')
"    call t.add_map('sha', 'しゃ')
"    call t.add_map('shu', 'しゅ')
"    call t.add_map('sho', 'しょ')
"    call t.add_map('zma', 'じゃ')
"    call t.add_map('zmu', 'じゅ')
"    call t.add_map('zmo', 'じょ')
"
"    " 拗音化キーとして薬指キー(R,N,V)を使うもの
"    call t.add_map('pra', 'ぴゃ')
"    call t.add_map('pru', 'ぴゅ')
"    call t.add_map('pro', 'ぴょ')
"    call t.add_map('gra', 'ぎゃ')
"    call t.add_map('gru', 'ぎゅ')
"    call t.add_map('gro', 'ぎょ')
"    call t.add_map('dna', 'ぢゃ')
"    call t.add_map('dnu', 'ぢゅ')
"    call t.add_map('dno', 'ぢょ')
"    call t.add_map('hna', 'ひゃ')
"    call t.add_map('hnu', 'ひゅ')
"    call t.add_map('hno', 'ひょ')
"    call t.add_map('bva', 'びゃ')
"    call t.add_map('bvu', 'びゅ')
"    call t.add_map('bvo', 'びょ')
"    call t.add_map('mva', 'みゃ')
"    call t.add_map('mvu', 'みゅ')
"    call t.add_map('mvo', 'みょ')
"
"    " 拗音の打ち方(外来語)
"    call t.add_map('twi', 'てぃ')
"    call t.add_map('dbi', 'でぃ')
"
"    call t.add_map('wma', 'うぁ')
"    call t.add_map('wmi', 'うぃ')
"    call t.add_map('wme', 'うぇ')
"    call t.add_map('wmo', 'うぉ')
"
"    " 撥音拡張と2重母音拡張
"    call t.add_map(';', 'あん')
"    call t.add_map('q', 'おん')
"    call t.add_map('j', 'えん')
"    call t.add_map('k', 'うん')
"    call t.add_map('x', 'いん')
"    call t.add_map('c;', 'かん')
"    call t.add_map('cq', 'こん')
"    call t.add_map('cj', 'けん')
"    call t.add_map('ck', 'くん')
"    call t.add_map('cx', 'きん')
"    call t.add_map('s;', 'さん')
"    call t.add_map('sq', 'そん')
"    call t.add_map('sj', 'せん')
"    call t.add_map('sk', 'すん')
"    call t.add_map('sx', 'しん')
"    call t.add_map('t;', 'たん')
"    call t.add_map('tq', 'とん')
"    call t.add_map('tj', 'てん')
"    call t.add_map('tk', 'つん')
"    call t.add_map('tx', 'ちん')
"    call t.add_map('n;', 'なん')
"    call t.add_map('nq', 'のん')
"    call t.add_map('nj', 'ねん')
"    call t.add_map('nk', 'ぬん')
"    call t.add_map('nx', 'にん')
"    call t.add_map('h;', 'はん')
"    call t.add_map('hq', 'ほん')
"    call t.add_map('hj', 'へん')
"    call t.add_map('hk', 'ふん')
"    call t.add_map('hx', 'ひん')
"    call t.add_map('m;', 'まん')
"    call t.add_map('mq', 'もん')
"    call t.add_map('mj', 'めん')
"    call t.add_map('mk', 'むん')
"    call t.add_map('mx', 'みん')
"    call t.add_map('y;', 'やん')
"    call t.add_map('yq', 'よん')
"    call t.add_map('yj', 'えん')
"    call t.add_map('yk', 'ゆん')
"    call t.add_map('yx', 'いん')
"    call t.add_map('r;', 'らん')
"    call t.add_map('rq', 'ろん')
"    call t.add_map('rj', 'れん')
"    call t.add_map('rk', 'るん')
"    call t.add_map('rx', 'りん')
"    call t.add_map('w;', 'わん')
"    call t.add_map('wq', 'うぉん')
"    call t.add_map('wj', 'うぇん')
"    call t.add_map('wk', 'うん')
"    call t.add_map('wx', 'うぃん')
"
"    call t.add_map("c'", 'かい')
"    call t.add_map('c,', 'こう')
"    call t.add_map('c.', 'けい')
"    call t.add_map('cp', 'くう')
"    call t.add_map('cy', 'くい')
"    call t.add_map("s'", 'さい')
"    call t.add_map('s,', 'そう')
"    call t.add_map('s.', 'せい')
"    call t.add_map('sp', 'すう')
"    call t.add_map('sy', 'すい')
"    call t.add_map("t'", 'たい')
"    call t.add_map('t,', 'とう')
"    call t.add_map('t.', 'てい')
"    call t.add_map('tp', 'つう')
"    call t.add_map('ty', 'つい')
"    call t.add_map("n'", 'ない')
"    call t.add_map('n,', 'のう')
"    call t.add_map('n.', 'ねい')
"    call t.add_map('np', 'ぬう')
"    call t.add_map('ny', 'ぬい')
"    call t.add_map("h'", 'はい')
"    call t.add_map('h,', 'ほう')
"    call t.add_map('h.', 'へい')
"    call t.add_map('hp', 'ふう')
"    call t.add_map('hy', 'ふい')
"    call t.add_map("m'", 'まい')
"    call t.add_map('m,', 'もう')
"    call t.add_map('m.', 'めい')
"    call t.add_map('mp', 'むう')
"    call t.add_map('my', 'むい')
"    call t.add_map("y'", 'やい')
"    call t.add_map('y,', 'よう')
"    call t.add_map('y.', 'いう')
"    call t.add_map('yp', 'ゆう')
"    call t.add_map('yy', 'いう')
"    call t.add_map("r'", 'らい')
"    call t.add_map('r,', 'ろう')
"    call t.add_map('r.', 'れい')
"    call t.add_map('rp', 'るう')
"    call t.add_map('ry', 'るい')
"    call t.add_map("w'", 'わい')
"    call t.add_map('w,', 'うぉー')
"    call t.add_map('w.', 'うぇい')
"    call t.add_map('wp', 'うぅ')
"    call t.add_map('wy', 'うい')
"
"    " ヤ行、パ行の互換打ち
"    call t.add_map('yg', 'ゆう')
"    call t.add_map('yh', 'ゆ')
"    call t.add_map('ym', 'ゆん')
"    call t.add_map('yv', 'よん')
"    call t.add_map('yz', 'やん')
"    call t.add_map('ps', 'ぱ')
"    call t.add_map('pd', 'ぴ')
"    call t.add_map('ph', 'ぷ')
"    call t.add_map('pt', 'ぺ')
"    call t.add_map('pz', 'ぱん')
"    call t.add_map('pb', 'ぴん')
"    call t.add_map('pm', 'ぷん')
"    call t.add_map('pw', 'ぺん')
"    call t.add_map('pv', 'ぽん')
"
"    " 頻出拗音の省略打ち
"    call t.add_map('pc', 'ぴゅう')
"    call t.add_map('pl', 'ぴょう')
"    call t.add_map('fc', 'ふゅー')
"    call t.add_map('fl', 'ふぉー')
"    call t.add_map('gc', 'ぎゅう')
"    call t.add_map('gl', 'ぎょう')
"    call t.add_map('cc', 'きゅう')
"    call t.add_map('cl', 'きょう')
"    call t.add_map('rc', 'りゅう')
"    call t.add_map('rl', 'りょう')
"
"    call t.add_map('ht', 'ひゅう')
"    call t.add_map('hs', 'ひょう')
"    call t.add_map('tt', 'ちゅう')
"    call t.add_map('ts', 'ちょう')
"    call t.add_map('nt', 'にゅう')
"    call t.add_map('ns', 'にょう')
"    call t.add_map('st', 'しゅう')
"    call t.add_map('ss', 'しょう')
"
"    call t.add_map('bw', 'びゅう')
"    call t.add_map('bz', 'びょう')
"    call t.add_map('mw', 'みゅー')
"    call t.add_map('mz', 'みょう')
"    call t.add_map('wz', 'うぉー')
"    call t.add_map('vw', 'う゛ゅー')
"    call t.add_map('vz', 'う゛ぉー')
"    call t.add_map('zw', 'じゅう')
"    call t.add_map('zz', 'じょう')
"
"    " 拗音＋ク・ツの省略打ち
"    call t.add_map('grr', 'ぎょく')
"    call t.add_map('grl', 'ぎゃく')
"    call t.add_map('cgr', 'きょく')
"    call t.add_map('cgl', 'きゃく')
"    call t.add_map('rgr', 'りょく')
"    call t.add_map('rgl', 'りゃく')
"
"    call t.add_map('hns', 'ひゃく')
"    call t.add_map('thn', 'ちょく')
"    call t.add_map('ths', 'ちゃく')
"    call t.add_map('nhn', 'にょく')
"    call t.add_map('nhs', 'にゃく')
"    call t.add_map('shn', 'しょく')
"    call t.add_map('shs', 'しゃく')
"    call t.add_map('sht', 'しゅつ')
"    call t.add_map('pns', 'ぴゃく')
"
"    call t.add_map('bvv', 'びょく')
"    call t.add_map('bvz', 'びゃく')
"    call t.add_map('mvv', 'みょく')
"    call t.add_map('mvz', 'みゃく')
"    call t.add_map('zmv', 'じょく')
"    call t.add_map('zmz', 'じゃく')
"    call t.add_map('zmw', 'じゅつ')
"
"    " ヤ行頻出文字列の省略打ち
"    call t.add_map('yf', 'より')
"    call t.add_map('yc', 'いう')
"    call t.add_map('yr', 'よる')
"    call t.add_map('yl', 'やる')
"    call t.add_map('yd', 'よい')
"    call t.add_map('yt', 'よって')
"    call t.add_map('yn', 'よく')
"    call t.add_map('ys', 'やく')
"    call t.add_map('yb', 'ゆび')
"    call t.add_map('yw', 'いわれ')
"
"    call eskk#register_mode_table('hira', t)
"
"    " カタカナ
"    let t = eskk#table#new('rom_to_kata*', 'rom_to_kata')
"
"    " from ddskk
"    call t.add_map('~', '～')
"    call t.add_map('z ', '　')
"    call t.add_map('z/', '・')
"    call t.add_map('z{', '【')
"    call t.add_map('z}', '】')
"    call t.add_map('z(', '（')
"    call t.add_map('z)', '）')
"
"    " ACT (http://www1.vecceed.ne.jp/~bemu/act/act_index.html)
"    " 基本的な打ち方
"    call t.add_map('ca', 'カ')
"    call t.add_map('ci', 'キ')
"    call t.add_map('cu', 'ク')
"    call t.add_map('ce', 'ケ')
"    call t.add_map('co', 'コ')
"
"    call t.add_map("'", 'ツ')
"    call t.add_map('"', 'ツ')
"
"    " 拗音の打ち方(基本)
"    " 拗音化キーとして人差し指キー(G,H,M)を使うもの
"    call t.add_map('cga', 'キャ')
"    call t.add_map('cgu', 'キュ')
"    call t.add_map('cgo', 'キョ')
"    call t.add_map('rga', 'リャ')
"    call t.add_map('rgu', 'リュ')
"    call t.add_map('rgo', 'リョ')
"    call t.add_map('tha', 'チャ')
"    call t.add_map('thu', 'チュ')
"    call t.add_map('tho', 'チョ')
"    call t.add_map('nha', 'ニャ')
"    call t.add_map('nhu', 'ニュ')
"    call t.add_map('nho', 'ニョ')
"    call t.add_map('sha', 'シャ')
"    call t.add_map('shu', 'シュ')
"    call t.add_map('sho', 'ショ')
"    call t.add_map('zma', 'ジャ')
"    call t.add_map('zmu', 'ジュ')
"    call t.add_map('zmo', 'ジョ')
"
"    " 拗音化キーとして薬指キー(R,N,V)を使うもの
"    call t.add_map('pra', 'ピャ')
"    call t.add_map('pru', 'ピュ')
"    call t.add_map('pro', 'ピョ')
"    call t.add_map('gra', 'ギャ')
"    call t.add_map('gru', 'ギュ')
"    call t.add_map('gro', 'ギョ')
"    call t.add_map('dna', 'ヂャ')
"    call t.add_map('dnu', 'ヂュ')
"    call t.add_map('dno', 'ヂョ')
"    call t.add_map('hna', 'ヒャ')
"    call t.add_map('hnu', 'ヒュ')
"    call t.add_map('hno', 'ヒョ')
"    call t.add_map('bva', 'ビャ')
"    call t.add_map('bvu', 'ビュ')
"    call t.add_map('bvo', 'ビョ')
"    call t.add_map('mva', 'ミャ')
"    call t.add_map('mvu', 'ミュ')
"    call t.add_map('mvo', 'ミョ')
"
"    " 拗音の打ち方(外来語)
"    call t.add_map('twi', 'ティ')
"    call t.add_map('dbi', 'ディ')
"
"    call t.add_map('wma', 'ウァ')
"    call t.add_map('wmi', 'ウィ')
"    call t.add_map('wme', 'ウェ')
"    call t.add_map('wmo', 'ウォ')
"
"    " 撥音拡張と2重母音拡張
"    call t.add_map(';', 'アン')
"    call t.add_map('q', 'オン')
"    call t.add_map('j', 'エン')
"    call t.add_map('k', 'ウン')
"    call t.add_map('x', 'イン')
"    call t.add_map('c;', 'カン')
"    call t.add_map('cq', 'コン')
"    call t.add_map('cj', 'ケン')
"    call t.add_map('ck', 'クン')
"    call t.add_map('cx', 'キン')
"    call t.add_map('s;', 'サン')
"    call t.add_map('sq', 'ソン')
"    call t.add_map('sj', 'セン')
"    call t.add_map('sk', 'スン')
"    call t.add_map('sx', 'シン')
"    call t.add_map('t;', 'タン')
"    call t.add_map('tq', 'トン')
"    call t.add_map('tj', 'テン')
"    call t.add_map('tk', 'ツン')
"    call t.add_map('tx', 'チン')
"    call t.add_map('n;', 'ナン')
"    call t.add_map('nq', 'ノン')
"    call t.add_map('nj', 'ネン')
"    call t.add_map('nk', 'ヌン')
"    call t.add_map('nx', 'ニン')
"    call t.add_map('h;', 'ハン')
"    call t.add_map('hq', 'ホン')
"    call t.add_map('hj', 'ヘン')
"    call t.add_map('hk', 'フン')
"    call t.add_map('hx', 'ヒン')
"    call t.add_map('m;', 'マン')
"    call t.add_map('mq', 'モン')
"    call t.add_map('mj', 'メン')
"    call t.add_map('mk', 'ムン')
"    call t.add_map('mx', 'ミン')
"    call t.add_map('y;', 'ヤン')
"    call t.add_map('yq', 'ヨン')
"    call t.add_map('yj', 'エン')
"    call t.add_map('yk', 'ユン')
"    call t.add_map('yx', 'イン')
"    call t.add_map('r;', 'ラン')
"    call t.add_map('rq', 'ロン')
"    call t.add_map('rj', 'レン')
"    call t.add_map('rk', 'ルン')
"    call t.add_map('rx', 'リン')
"    call t.add_map('w;', 'ワン')
"    call t.add_map('wq', 'ウォン')
"    call t.add_map('wj', 'ウェン')
"    call t.add_map('wk', 'ウン')
"    call t.add_map('wx', 'ウィン')
"
"    call t.add_map("c'", 'カイ')
"    call t.add_map('c,', 'コウ')
"    call t.add_map('c.', 'ケイ')
"    call t.add_map('cp', 'クウ')
"    call t.add_map('cy', 'クイ')
"    call t.add_map("s'", 'サイ')
"    call t.add_map('s,', 'ソウ')
"    call t.add_map('s.', 'セイ')
"    call t.add_map('sp', 'スウ')
"    call t.add_map('sy', 'スイ')
"    call t.add_map("t'", 'タイ')
"    call t.add_map('t,', 'トウ')
"    call t.add_map('t.', 'テイ')
"    call t.add_map('tp', 'ツウ')
"    call t.add_map('ty', 'ツイ')
"    call t.add_map("n'", 'ナイ')
"    call t.add_map('n,', 'ノウ')
"    call t.add_map('n.', 'ネイ')
"    call t.add_map('np', 'ヌウ')
"    call t.add_map('ny', 'ヌイ')
"    call t.add_map("h'", 'ハイ')
"    call t.add_map('h,', 'ホウ')
"    call t.add_map('h.', 'ヘイ')
"    call t.add_map('hp', 'フウ')
"    call t.add_map('hy', 'フイ')
"    call t.add_map("m'", 'マイ')
"    call t.add_map('m,', 'モウ')
"    call t.add_map('m.', 'メイ')
"    call t.add_map('mp', 'ムウ')
"    call t.add_map('my', 'ムイ')
"    call t.add_map("y'", 'ヤイ')
"    call t.add_map('y,', 'ヨウ')
"    call t.add_map('y.', 'イウ')
"    call t.add_map('yp', 'ユウ')
"    call t.add_map('yy', 'イウ')
"    call t.add_map("r'", 'ライ')
"    call t.add_map('r,', 'ロウ')
"    call t.add_map('r.', 'レイ')
"    call t.add_map('rp', 'ルウ')
"    call t.add_map('ry', 'ルイ')
"    call t.add_map("w'", 'ワイ')
"    call t.add_map('w,', 'ウォー')
"    call t.add_map('w.', 'ウェイ')
"    call t.add_map('wp', 'ウゥ')
"    call t.add_map('wy', 'ウイ')
"
"    " ヤ行、パ行の互換打ち
"    call t.add_map('yg', 'ユウ')
"    call t.add_map('yh', 'ユ')
"    call t.add_map('ym', 'ユン')
"    call t.add_map('yv', 'ヨン')
"    call t.add_map('yz', 'ヤン')
"    call t.add_map('ps', 'パ')
"    call t.add_map('pd', 'ピ')
"    call t.add_map('ph', 'プ')
"    call t.add_map('pt', 'ペ')
"    call t.add_map('pz', 'パン')
"    call t.add_map('pb', 'ピン')
"    call t.add_map('pm', 'プン')
"    call t.add_map('pw', 'ペン')
"    call t.add_map('pv', 'ポン')
"
"    " 頻出拗音の省略打ち
"    call t.add_map('pc', 'ぴゅう')
"    call t.add_map('pl', 'ぴょう')
"    call t.add_map('fc', 'ふゅー')
"    call t.add_map('fl', 'ふぉー')
"    call t.add_map('gc', 'ぎゅう')
"    call t.add_map('gl', 'ぎょう')
"    call t.add_map('cc', 'きゅう')
"    call t.add_map('cl', 'きょう')
"    call t.add_map('rc', 'りゅう')
"    call t.add_map('rl', 'りょう')
"
"    call t.add_map('ht', 'ひゅう')
"    call t.add_map('hs', 'ひょう')
"    call t.add_map('tt', 'ちゅう')
"    call t.add_map('ts', 'ちょう')
"    call t.add_map('nt', 'にゅう')
"    call t.add_map('ns', 'にょう')
"    call t.add_map('st', 'しゅう')
"    call t.add_map('ss', 'しょう')
"
"    call t.add_map('bw', 'びゅう')
"    call t.add_map('bz', 'びょう')
"    call t.add_map('mw', 'みゅー')
"    call t.add_map('mz', 'みょう')
"    call t.add_map('wz', 'うぉー')
"    call t.add_map('vw', 'う゛ゅー')
"    call t.add_map('vz', 'う゛ぉー')
"    call t.add_map('zw', 'じゅう')
"    call t.add_map('zz', 'じょう')
"
"    " 拗音＋ク・ツの省略打ち
"    call t.add_map('grr', 'ぎょく')
"    call t.add_map('grl', 'ぎゃく')
"    call t.add_map('cgr', 'きょく')
"    call t.add_map('cgl', 'きゃく')
"    call t.add_map('rgr', 'りょく')
"    call t.add_map('rgl', 'りゃく')
"
"    call t.add_map('hns', 'ひゃく')
"    call t.add_map('thn', 'ちょく')
"    call t.add_map('ths', 'ちゃく')
"    call t.add_map('nhn', 'にょく')
"    call t.add_map('nhs', 'にゃく')
"    call t.add_map('shn', 'しょく')
"    call t.add_map('shs', 'しゃく')
"    call t.add_map('sht', 'しゅつ')
"    call t.add_map('pns', 'ぴゃく')
"
"    call t.add_map('bvv', 'びょく')
"    call t.add_map('bvz', 'びゃく')
"    call t.add_map('mvv', 'みょく')
"    call t.add_map('mvz', 'みゃく')
"    call t.add_map('zmv', 'じょく')
"    call t.add_map('zmz', 'じゃく')
"    call t.add_map('zmw', 'じゅつ')
"
"    " ヤ行頻出文字列の省略打ち
"    call t.add_map('yf', 'より')
"    call t.add_map('yc', 'いう')
"    call t.add_map('yr', 'よる')
"    call t.add_map('yl', 'やる')
"    call t.add_map('yd', 'よい')
"    call t.add_map('yt', 'よって')
"    call t.add_map('yn', 'よく')
"    call t.add_map('ys', 'やく')
"    call t.add_map('yb', 'ゆび')
"    call t.add_map('yw', 'いわれ')
"
"    call eskk#register_mode_table('kata', t)
"endfunction
" }}}

" }}}


" vim: set foldmethod=marker:
