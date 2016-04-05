scriptencoding utf-8


" {{{ Plugins
" Execute the following command line first:
"   curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if has('nvim')
    let s:my_plugin_dir = '~/.config/nvim/bundle/'
else
    let s:my_plugin_dir = '~/.vim/bundle/'
endif
call plug#begin(s:my_plugin_dir)

" Prevent default plugins from being loaded
let g:loaded_matchparen = 1

" Plugins
Plug 'AndrewRadev/inline_edit.vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'benekastah/neomake'
Plug 'dannyob/quickfixstatus'
Plug 'dhruvasagar/vim-table-mode'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'edsono/vim-matchit'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-cursorword'
Plug 'itchyny/vim-parenmatch'
Plug 'jamessan/vim-gnupg'
Plug 'jceb/vim-hier'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kannokanno/previm'
Plug 'Konfekt/FastFold'
Plug 'lambdalisue/vim-unified-diff'
Plug 'lilydjwg/colorizer'
Plug 'mattn/gist-vim'
Plug 'mbbill/undotree'
Plug 'ntpeters/vim-better-whitespace'
Plug 'osyo-manga/shabadou.vim'
Plug 'Raimondi/delimitMate'
Plug 'rhysd/clever-f.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scratch'
Plug 'scrooloose/syntastic'
Plug 'Shougo/echodoc'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimfiler'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/vimshell'
Plug 'Shougo/vim-vcs'
Plug 'Shougo/vinarise'
Plug 't9md/vim-choosewin'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-fontzoom'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-ref'
Plug 'thinca/vim-visualstar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'Yggdroot/indentLine'
Plug 'yonchu/accelerated-smooth-scroll'

" UI enhancements
" Completion (neocomplete/deoplete)
Plug 'ujihisa/neco-look'
if has('nvim')
    Plug 'Shougo/deoplete.nvim'
else
    Plug 'Shougo/neocomplete.vim'
endif

" Interactive filter (unite)
Plug 'h1mesuke/unite-outline'
Plug 'sgur/unite-qf'
Plug 'Shougo/unite-help'
Plug 'Shougo/unite-session'
Plug 'Shougo/unite.vim'
Plug 'tsukkee/unite-tag'
Plug 'ujihisa/unite-colorscheme'
Plug 'ujihisa/unite-locate'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
Plug 'lambdalisue/vim-gita'
Plug 'tpope/vim-fugitive'

" Haskell
Plug 'dag/vim2hs'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/unite-haddock'
Plug 'ujihisa/neco-ghc'
Plug 'ujihisa/unite-haskellimport'

" PHP
Plug '2072/PHP-Indenting-for-VIm'
Plug 'shawncplus/phpcomplete.vim'
Plug 'StanAngeloff/php.vim'

" Rust
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'

" Web
Plug 'csscomb/vim-csscomb'
Plug 'ervandew/sgmlendtag'
Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'
Plug 'jiangmiao/simple-javascript-indenter'
Plug 'mattn/emmet-vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'pbrisbin/html-template-syntax'

" Other filetype-specific plugins
Plug 'dahu/vim-asciidoc'
Plug 'dahu/vimple'          | Plug 'dahu/vim-asciidoc'
Plug 'dahu/Asif'            | Plug 'dahu/vim-asciidoc'
Plug 'fatih/vim-go'
Plug 'Raimondi/VimRegStyle' | Plug 'dahu/vim-asciidoc'
Plug 'gtk-vim-syntax'
Plug 'guns/vim-sexp'
Plug 'jceb/vim-orgmode'
Plug 'jtratner/vim-flavored-markdown'
Plug 'lervag/vimtex'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pythoncomplete'
Plug 'tpope/vim-markdown'
Plug 'vim-ruby/vim-ruby'
Plug 'def-lkb/ocp-indent-vim'
Plug 'cespare/vim-toml'

" Themes
Plug '29decibel/codeschool-vim-theme'
Plug 'jpo/vim-railscasts-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomasr/molokai'
Plug 'w0ng/vim-hybrid'
Plug 'yuttie/hydrangea-theme'

call plug#end()
" }}}


" {{{ Options
"
" 1 important
set nocompatible

" 2 moving around, searching and patterns
set incsearch
set ignorecase
set smartcase
set nowrapscan

" 4 displaying text
set number
set scrolloff=3

" 6 multiple windows
set hidden        " You can change buffer without saving.
set laststatus=2  " Always show status lines.
set showcmd
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%{exists('*SkkGetModeStr')?SkkGetModeStr():''}%=%l,%c%V%8P

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
set foldlevelstart=1

" 19 reading and writing files
set modeline
set fileformats=unix,dos
set backup

" 21 command line editing
"set suffixes& suffixes+=.info,.aux,.log,.dvi,.bbl,.out,.pdf  " Files with suffix in suffixes are ignored.
set wildmode=full  " Set completion mode.
set wildmenu
"set wildignore& wildignore+=*.o

" 25 multi-byte characters
if has('vim_starting')
  set encoding=utf-8      " Encoding used for text inside vim.
endif
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

" }}}


" Autocommand group
augroup MyAutoCmds
    autocmd!
augroup end


" Syntax highlighting                                                        {{{
" ==============================================================================

" Highlight TODO, FIXME, NOTE, etc.
" (from http://stackoverflow.com/questions/6577579/task-tags-in-vim)
autocmd MyAutoCmds Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|BUG\|HACK\)')
autocmd MyAutoCmds Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set background=dark
  colorscheme hydrangea
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
command! Hitest source $VIMRUNTIME/syntax/hitest.vim

if has("gui_running")
    command! Enlarge16 set guifont=monospace\ 16
    command! Enlarge32 set guifont=monospace\ 32
    command! Enlarge64 set guifont=monospace\ 64
    command! Enlarge128 set guifont=monospace\ 128
endif
" }}}


" {{{ Prefix key
nnoremap [Space] <Nop>
xnoremap [Space] <Nop>
nmap     <Space> [Space]
xmap     <Space> [Space]
" }}}


" {{{ Mappings
" insert
inoremap <C-d> <Del>

" insert and command line
noremap! <C-a> <Home>
noremap! <C-e> <End>
noremap! <C-b> <Left>
noremap! <C-f> <Right>
noremap! <M-f> <S-Right>
noremap! <M-b> <S-Left>

" normal
nnoremap j   gj
nnoremap k   gk
nnoremap gj  j
nnoremap gk  k
nnoremap P   Pg;
nnoremap gc  `[v`]
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
nnoremap <C-Tab>   gt
nnoremap <C-S-Tab> gT
nnoremap <C-s> :w<CR>
nnoremap <C-i> <C-g>

" close a help window by `q'
autocmd MyAutoCmds BufWinEnter * if &buftype  ==# 'help'    | nnoremap <buffer><silent> q  :q<CR> | endif
autocmd MyAutoCmds BufWinEnter * if &filetype ==# 'ref-man' | nnoremap <buffer><silent> q  :q<CR> | endif
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


" {{{ lightline.vim
set ambiwidth=single
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'hydrangea',
      \ 'inactive': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'readonly', 'filename', 'modified' ],
      \   ],
      \ },
      \ 'tabline': {
      \   'left': [
      \     [ 'tabs' ],
      \   ],
      \   'right': [
      \     [ 'close' ],
      \     [ 'git_branch', 'git_traffic', 'git_status', 'cwd' ],
      \   ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'component_function': {
      \   'git_branch':  'g:lightline.my.git_branch',
      \   'git_traffic': 'g:lightline.my.git_traffic',
      \   'git_status':  'g:lightline.my.git_status',
      \ },
      \ 'separator':    { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }
let g:lightline.my = {}
function! g:lightline.my.git_branch()
  return winwidth(0) > 70 ? gita#statusline#format('%{ |}ln/%lb') : ''
endfunction
function! g:lightline.my.git_traffic()
  return winwidth(0) > 70 ? gita#statusline#format('%{￬| }ic%{￪| }og') : ''
endfunction
function! g:lightline.my.git_status()
  return winwidth(0) > 70 ? gita#statusline#preset('status') : ''
endfunction
" }}}


" {{{ vim-better-whitespace
let g:better_whitespace_filetypes_blacklist = [
      \ 'diff',
      \ 'gitcommit',
      \ 'unite',
      \ 'qf',
      \ 'help',
      \ 'gita-blame-navi',
      \ ]
" }}}


" {{{ indentLine
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#505760'
let g:indentLine_color_tty_light = 4
let g:indentLine_color_dark = 2
let g:indentLine_char = '¦'
" }}}


" {{{ delimitMate
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 0
" }}}


" {{{ accelerated-smooth-scroll
let g:ac_smooth_scroll_du_sleep_time_msec = 5
let g:ac_smooth_scroll_fb_sleep_time_msec = 3
" }}}


" {{{ incsearch.vim
map /     <Plug>(incsearch-forward)
map ?     <Plug>(incsearch-backward)
map <C-m> <Plug>(incsearch-stay)
" }}}


" {{{ vim-easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nnoremap [easymotion] <Nop>
nmap     [Space]m     [easymotion]
nmap     [easymotion] <Plug>(easymotion-prefix)
" }}}


" {{{ vim-choosewin
nnoremap [choosewin] <Nop>
nmap     [Space]w    [choosewin]
nmap     [choosewin] <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
let g:choosewin_color_overlay = {
      \ 'gui': ['#484e55', '#484e55'],
      \ 'cterm': [239, 239]
      \ }
let g:choosewin_color_overlay_current = {
      \ 'gui': ['#e4c374', '#e4c374'],
      \ 'cterm': [179, 179]
      \ }
" }}}


" {{{ vim-easy-align
nnoremap [easy-align]  <Nop>
xnoremap [easy-align]  <Nop>
nmap     [Space]a      [easy-align]
xmap     [Space]a      [easy-align]
nmap     [easy-align]  <Plug>(EasyAlign)
xmap     [easy-align]  <Plug>(EasyAlign)
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

nnoremap [git]  <Nop>
nmap     <C-g>  [git]

nnoremap <silent> [git]<C-g>  :Gcommit -v<CR>
nnoremap <silent> [git]<C-d>  :Gdiff<CR>
" }}}


" {{{ gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 5000

nmap [git]<C-n> <Plug>GitGutterNextHunk
nmap [git]<C-p> <Plug>GitGutterPrevHunk
nmap [git]<C-s> <Plug>GitGutterStageHunk
nmap [git]<C-r> <Plug>GitGutterRevertHunk
nmap [git]<C-v> <Plug>GitGutterPreviewHunk
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

if has('nvim')
  nnoremap <silent> [unite]f  :<C-u>UniteWithCurrentDir -buffer-name=files       buffer bookmark file_rec/neovim<CR>
  nnoremap <silent> [unite]F  :<C-u>UniteWithBufferDir  -buffer-name=files       buffer bookmark file_rec/neovim<CR>
else
  nnoremap <silent> [unite]f  :<C-u>UniteWithCurrentDir -buffer-name=files       buffer bookmark file_rec/async<CR>
  nnoremap <silent> [unite]F  :<C-u>UniteWithBufferDir  -buffer-name=files       buffer bookmark file_rec/async<CR>
endif
nnoremap <silent> [unite]g  :<C-u>Unite file_rec/git  -buffer-name=git-files                <CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer        -buffer-name=buffer                   <CR>
nnoremap <silent> [unite]G  :<C-u>Unite grep/git      -buffer-name=git-grep                 <CR>
nnoremap          [unite]u  :<C-u>Unite source        -buffer-name=source                   <CR>
nnoremap <silent> [unite]r  :<C-u>Unite register      -buffer-name=register                 <CR>
nnoremap <silent> [unite]h  :<C-u>Unite help          -buffer-name=help                     <CR>
nnoremap <silent> [unite]s  :<C-u>Unite line          -buffer-name=search      -no-quit     <CR>
nnoremap <silent> [unite]c  :<C-u>Unite colorscheme   -buffer-name=colorscheme -auto-preview<CR>
nnoremap <silent> [unite]q  :<C-u>Unite qf            -buffer-name=quickfix    -auto-preview<CR>

" Like ctrlp.vim settings.
call unite#custom#profile('default', 'context', {
\   'start_insert': 1,
\   'prompt_direction': 'top',
\   'direction': 'botright',
\ })

autocmd MyAutoCmds FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nmap <buffer>       <ESC> <Plug>(unite_exit)
  imap <buffer>       qq    <Plug>(unite_exit)
  imap <buffer>       jj    <Plug>(unite_insert_leave)
  imap <buffer>       kk    <Plug>(unite_insert_leave)
  imap <buffer><expr> j     unite#smart_map('j', '')
  imap <buffer>       <TAB> <Plug>(unite_select_next_line)
  imap <buffer>       <C-w> <Plug>(unite_delete_backward_path)
endfunction
" }}}


" {{{ vim-commentary
nnoremap [vim-commentary]  <Nop>
xnoremap [vim-commentary]  <Nop>
nmap     [Space]c          [vim-commentary]
xmap     [Space]c          [vim-commentary]
nmap     [vim-commentary]c <plug>CommentaryLine
nmap     [vim-commentary]  <plug>Commentary
xmap     [vim-commentary]  <plug>Commentary

autocmd FileType php setlocal commentstring=//\ %s
" }}}


" {{{ lambdalisue/vim-unified-diff
set diffexpr=unified_diff#diffexpr()
" }}}


" {{{ unite-haddock
let g:unite_source_haddock_browser = 'firefox'
" }}}


" {{{ deoplete.nvim
if has('nvim')
  let g:deoplete#enable_at_startup = 1
endif
" }}}


" {{{ neocomplete.vim
if !has('nvim')
  let g:acp_enableAtStartup = 0                           " Disable AutoComplPop.
  let g:neocomplete#enable_at_startup = 1                 " Use neocomplete.
  let g:neocomplete#enable_smart_case = 1                 " Use smartcase.
  let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length.
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
  inoremap <expr><C-g> neocomplete#undo_completion()
  inoremap <expr><C-l> neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  " This was modified so that it can work nicely with delimitMate
  imap     <expr><CR>   pumvisible() ? neocomplete#close_popup() . "\<CR>" : '<Plug>delimitMateCR'
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

  " Enable omni completion.
  autocmd MyAutoCmds FileType css           setlocal omnifunc=csscomplete#CompleteCSS
  autocmd MyAutoCmds FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd MyAutoCmds FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd MyAutoCmds FileType python        setlocal omnifunc=pythoncomplete#Complete
  autocmd MyAutoCmds FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd MyAutoCmds FileType php           setlocal omnifunc=phpcomplete#CompletePHP
  autocmd MyAutoCmds FileType ruby          setlocal omnifunc=rubycomplete#Complete

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.php  = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
  let g:neocomplete#sources#omni#input_patterns.c    = '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplete#sources#omni#input_patterns.cpp  = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif
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
if !has('nvim')
  let g:neocomplcache_clang_use_library = 1
  let g:neocomplcache_clang_library_path = "/usr/lib/llvm"
  let g:neocomplcache_clang_user_options =
      \ '-std=c++11 ' .
      \ '-I /usr/include/eigen3 ' .
      \ ''
endif
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
let g:quickrun_config['markdown/pandoc'] = {
\   'cmdopt': '--standalone --katex',
\   'outputter': 'browser'
\}
let g:quickrun_config['cpp/clang++'] = {
\   'cmdopt': '-std=c++11'
\}
let g:quickrun_config['cpp/g++'] = {
\   'cmdopt': '-std=c++11'
\}

" The prefix key.
nnoremap [quickrun]   <Nop>
nmap     [Space]r  [quickrun]

nmap <silent> [quickrun]  <Plug>(quickrun)
" }}}


" {{{ echodoc
set cmdheight=2
" Explicitly enable echodoc.
" This is a fix to use the plugin with vim-plug which loads the plugin before
" we let g:echodoc_enable_at_startup = 1 here.
call echodoc#enable()  
" }}}


" {{{ vim-ref
let g:ref_alc_start_linenumber = 42
let g:ref_refe_encoding = 'euc-jp'
" }}}


" {{{ Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nnoremap <silent> <M-r> :ll<CR>
nnoremap <silent> <M-n> :lnext<CR>
nnoremap <silent> <M-p> :lprevious<CR>
nnoremap <silent> <M-c> :lclose<CR>
nnoremap <silent> <M-v> :lwindow<CR>
" }}}


" {{{ Vim
autocmd MyAutoCmds FileType vim setlocal keywordprg=:help
autocmd MyAutoCmds FileType vim setlocal shiftwidth=2
" }}}


" {{{ Markdown
autocmd MyAutoCmds BufNewFile,BufRead *.{md,mkd,mkdn,mark*} setlocal filetype=ghmarkdown
autocmd MyAutoCmds FileType markdown   set shiftwidth=4
autocmd MyAutoCmds FileType ghmarkdown set shiftwidth=4
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
let g:haskell_conceal              = 0
let g:haskell_conceal_enumerations = 0

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

" Use the old regexp engine because the new NFA engine is slow for Haskell's syntax highlighting.
autocmd MyAutoCmds FileType haskell setlocal regexpengine=1
" }}}


" {{{ Rust
let $RUST_SRC_PATH = expand("~/rust/src/")
" }}}


" {{{ Web
autocmd MyAutoCmds FileType html setlocal shiftwidth=2
autocmd MyAutoCmds FileType css  setlocal shiftwidth=2
" }}}


" {{{ PHP
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction
autocmd MyAutoCmds FileType php call PhpSyntaxOverride()
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
