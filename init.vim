scriptencoding utf-8


" {{{ $PATH
let $PATH = expand('~/.cargo/bin') . ':' . $PATH
" }}}


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
Plug 'carlitux/deoplete-ternjs'
Plug 'chriskempson/base16-vim'
Plug 'dag/vim-fish'
Plug 'dannyob/quickfixstatus'
Plug 'dhruvasagar/vim-table-mode'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/matchit.zip'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-cursorword'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/vim-parenmatch'
Plug 'jamessan/vim-gnupg'
Plug 'jiangmiao/auto-pairs'
Plug 'jreybert/vimagit'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kannokanno/previm'
Plug 'Konfekt/FastFold'
Plug 'lambdalisue/vim-unified-diff'
Plug 'lilydjwg/colorizer'
Plug 'mattn/gist-vim'
Plug 'mbbill/undotree'
Plug 'mopp/layoutplugin.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'osyo-manga/shabadou.vim'
Plug 'rhysd/clever-f.vim'
Plug 'vim-scripts/scratch'
Plug 'scrooloose/nerdtree'
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
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tyru/caw.vim'
Plug 'tyru/open-browser.vim'
Plug 'w0rp/ale'
Plug 'wesQ3/vim-windowswap'
Plug 'Yggdroot/indentLine'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'yuttie/comfortable-motion.vim'

" UI enhancements
" Completion (neocomplete/deoplete)
Plug 'ujihisa/neco-look'
if has('nvim')
  function! DoRemoteUpdate(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemoteUpdate') }
else
  Plug 'Shougo/neocomplete.vim'
endif

" Interactive filter
if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': function('DoRemoteUpdate') }
else
  Plug 'Shougo/denite.nvim'
endif

" Git
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-fugitive'

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'

" PHP
Plug '2072/PHP-Indenting-for-VIm'
Plug 'shawncplus/phpcomplete.vim'
Plug 'StanAngeloff/php.vim'

" Python
if has('nvim')
  Plug 'zchee/deoplete-jedi'
endif
Plug 'vim-scripts/pythoncomplete'
Plug 'Glench/Vim-Jinja2-Syntax'

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
Plug 'othree/csscomplete.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'pbrisbin/html-template-syntax'

" Markdown
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
" or
Plug 'tpope/vim-markdown'
Plug 'tyru/markdown-codehl-onthefly.vim'

" Other filetype-specific plugins
Plug 'fatih/vim-go'
Plug 'vim-scripts/gtk-vim-syntax'
Plug 'guns/vim-sexp'
Plug 'jceb/vim-orgmode'
Plug 'lervag/vimtex'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-gfm-syntax'
Plug 'vim-ruby/vim-ruby'
Plug 'def-lkb/ocp-indent-vim'
Plug 'cespare/vim-toml'
Plug 'elzr/vim-json'
Plug 'vim-jp/syntax-vim-ex'
Plug 'JuliaLang/julia-vim'

" Themes
Plug '29decibel/codeschool-vim-theme'
Plug 'jpo/vim-railscasts-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ryanoasis/vim-devicons'    " This must be loaded after its supported plugins
Plug 'tomasr/molokai'
Plug 'w0ng/vim-hybrid'
Plug 'yuttie/hydrangea-theme', { 'branch': 'v4' }

call plug#end()
" }}}


" {{{ Options
"
" 1 important
set nocompatible

" 2 moving around, searching and patterns
set incsearch
if has('nvim')
  set inccommand=nosplit
endif
set ignorecase
set smartcase
set nowrapscan
set cursorline

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
set shiftround
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
set lazyredraw

" Disable mouse
set mouse=

" }}}


" Autocommand group
augroup MyAutoCmds
  autocmd!
augroup end


" Prefer POSIX compatible shell
if &shell =~# 'fish$'
  set shell=sh
endif


" Syntax highlighting                                                        {{{
" ==============================================================================

" Enable true color support
if (has("termguicolors"))
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Change the cursor sahpe
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

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
command! -nargs=1 -complete=file Rename saveas <args> | call delete(expand('#'))
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
onoremap [Space] <Nop>
nmap     <Space> [Space]
xmap     <Space> [Space]
omap     <Space> [Space]
" }}}


" {{{ Mappings
" insert
inoremap <C-d> <Del>
inoremap wj <Esc>

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

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <S-Left>  <C-w>><CR>
nnoremap <S-Right> <C-w><<CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
nnoremap <C-Tab>   gt
nnoremap <C-S-Tab> gT
nnoremap <C-s> :w<CR>
nnoremap <C-i> <C-g>

" visual
vnoremap v $h

" command
cmap w!! w !sudo tee > /dev/null %

" Space-prefixed bindings
nnoremap [help] <Nop>
nmap     [Space]h [help]
nnoremap <silent> [help]h  :<C-u>Denite help<CR>
nnoremap <silent> [help]dC :<C-u>Denite colorscheme<CR>

nnoremap [Plug] <Nop>
nmap     [Space]P [Plug]
nnoremap <silent> [Plug]P :PlugUpgrade \| PlugUpdate<CR>
nnoremap <silent> [Plug]i :PlugInstall<CR>
nnoremap <silent> [Plug]c :PlugClean<CR>
nnoremap <silent> [Plug]s :PlugStatus<CR>

nnoremap [file] <Nop>
nmap     [Space]f [file]
nnoremap <silent> [file]vd :e $MYVIMRC<CR>
nnoremap <silent> [file]vR :source $MYVIMRC<CR>
nnoremap <silent> [file]j  :VimFiler<CR>
nnoremap <silent> [file]f  :<C-u>Denite file_rec<CR>
nnoremap <silent> [file]r  :<C-u>Denite file_mru<CR>
nnoremap <silent> [file]s  :w<CR>
nnoremap <silent> [file]S  :wa<CR>
nnoremap <silent> [file]t  :NERDTree<CR>
nnoremap <silent> [file]T  :VimFilerExplore<CR>
nnoremap <silent> [file]R  :Rename

nnoremap [search] <Nop>
nmap     [Space]s [search]
nnoremap <silent> [search]s  :<C-u>Denite line<CR>
nnoremap <silent> [search]gg :<C-u>Denite grep<CR>

nnoremap [buffer] <Nop>
nmap     [Space]b [buffer]
nnoremap <silent> [buffer]b :<C-u>Denite buffer<CR>

nnoremap [project] <Nop>
nmap     [Space]p [project]
nnoremap <silent> [project]f :<C-u>DeniteProjectDir file_rec/git<CR>

nnoremap [error] <Nop>
nmap     [Space]e [error]
nnoremap <silent> [error]l :lwindow<CR>
nnoremap <silent> [error]c :lclose<CR>
nnoremap <silent> [error]n :lnext<CR>
nnoremap <silent> [error]p :lprevious<CR>

nnoremap [toggle] <Nop>
nmap     [Space]t [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]p :set paste!<CR>:set paste?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>

nmap     [Space];  <Plug>(caw:hatpos:toggle:operator)
xmap     [Space];  <Plug>(caw:hatpos:toggle:operator)
nmap     [Space];; <Plug>(caw:hatpos:toggle)

nnoremap [comment] <Nop>
nmap     [Space]c [comment]
xmap     [Space]c [comment]
nmap     [comment]l <Plug>(caw:hatpos:toggle)
xmap     [comment]l <Plug>(caw:hatpos:toggle)
nmap     [comment]y yy<Plug>(caw:hatpos:comment)p
xmap     [comment]y ygv<Plug>(caw:hatpos:comment)g;p
nmap     [comment]o <Plug>(caw:jump:comment-next)
nmap     [comment]O <Plug>(caw:jump:comment-prev)

nnoremap [jump] <Nop>
nmap     [Space]j [jump]
xmap     [Space]j [jump]
omap     [Space]j [jump]

nmap     [jump]j      <Plug>(easymotion-overwin-f)
xmap     [jump]j      <Plug>(easymotion-bd-f)
omap     [jump]j      <Plug>(easymotion-bd-f)

nmap     [jump]w      <Plug>(easymotion-overwin-w)
xmap     [jump]w      <Plug>(easymotion-bd-w)
omap     [jump]w      <Plug>(easymotion-bd-w)

nmap     [jump]l      <Plug>(easymotion-overwin-line)
xmap     [jump]l      <Plug>(easymotion-bd-jk)
omap     [jump]l      <Plug>(easymotion-bd-jk)

nmap     [jump]i      :Denite outline<CR>

nnoremap [quit] <Nop>
nmap     [Space]q [quit]
nnoremap <silent> [quit]q :confirm qall<CR>

" close a help window by `q'
autocmd MyAutoCmds FileType help,ref-pydoc nnoremap <buffer><silent> q :close<CR>
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
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'git_branch', 'readonly', 'relativepath', 'modified' ],
      \   ],
      \ },
      \ 'inactive': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'readonly', 'relativepath', 'modified' ],
      \   ],
      \ },
      \ 'tabline': {
      \   'left': [
      \     [ 'tabs' ],
      \   ],
      \   'right': [
      \     [ 'close' ],
      \     [ 'cwd' ],
      \   ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'component_function': {
      \   'filetype':    'g:lightline.my.filetype',
      \   'fileformat':  'g:lightline.my.fileformat',
      \   'git_branch':  'g:lightline.my.git_branch',
      \ },
      \ 'separator':    { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }
let g:lightline.my = {}
function! g:lightline.my.filetype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! g:lightline.my.fileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
function! g:lightline.my.git_branch()
  if gitbranch#name() == ''
    return ''
  else
    return winwidth(0) > 70 ? '' . gitbranch#name() : ''
  endif
endfunction
" }}}


" {{{ vim-better-whitespace
let g:better_whitespace_filetypes_blacklist = [
      \ 'diff',
      \ 'gitcommit',
      \ 'qf',
      \ 'help',
      \ ]
" }}}


" {{{ indentLine
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#3c4453'
let g:indentLine_color_tty_light = 4
let g:indentLine_color_dark = 2
let g:indentLine_char = '¦'
" }}}


" {{{ comfortable-motion.vim
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>

nnoremap <silent> <C-f>      :call comfortable_motion#flick(200)<CR>
nnoremap <silent> <C-b>      :call comfortable_motion#flick(-200)<CR>
nnoremap <silent> <PageDown> :call comfortable_motion#flick(200)<CR>
nnoremap <silent> <PageUp>   :call comfortable_motion#flick(-200)<CR>

noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
" }}}


" {{{ vim-expand-region
vmap + <Plug>(expand_region_expand)
vmap - <Plug>(expand_region_shrink)
" }}}


" {{{ delimitMate
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 0
" }}}


" {{{ accelerated-smooth-scroll
let g:ac_smooth_scroll_no_default_key_mappings = 1
let g:ac_smooth_scroll_du_sleep_time_msec = 5
let g:ac_smooth_scroll_fb_sleep_time_msec = 3

nmap <silent> <C-d> <Plug>(ac-smooth-scroll-c-d)
nmap <silent> <C-u> <Plug>(ac-smooth-scroll-c-u)
nmap <silent> <C-f> <Plug>(ac-smooth-scroll-c-f)
nmap <silent> <C-b> <Plug>(ac-smooth-scroll-c-b)
" }}}


" {{{ incsearch.vim
map /     <Plug>(incsearch-forward)
map ?     <Plug>(incsearch-backward)
map <C-m> <Plug>(incsearch-stay)
" }}}


" {{{ vim-easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
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


" {{{ Git
autocmd MyAutoCmds FileType gitcommit set spell

let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 5000

nnoremap [git]  <Nop>
nmap     <C-g>  [git]

nnoremap <silent> [git]c      :split +Gina\ commit\ -v<CR>
nnoremap <silent> [git]<C-d>  :Gdiff<CR>
nmap [git]<C-n> <Plug>GitGutterNextHunk
nmap [git]<C-p> <Plug>GitGutterPrevHunk
nmap [git]<C-s> <Plug>GitGutterStageHunk
nmap [git]<C-r> <Plug>GitGutterRevertHunk
nmap [git]<C-v> <Plug>GitGutterPreviewHunk
" }}}


" {{{ vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_explorer_columns = 'devicons'
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '►'
" }}}


" {{{ denite.nvim
call denite#custom#var("file_rec", "command",
\ ['rg', '--files', '--glob', '!.git'])
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
\ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#map(
\ 'insert',
\ '<C-n>',
\ '<denite:move_to_next_line>',
\ 'noremap'
\)
call denite#custom#map(
\ 'insert',
\ '<C-p>',
\ '<denite:move_to_previous_line>',
\ 'noremap'
\)

call denite#custom#option('default', 'prompt', '>')
" }}}


" {{{ caw.vim
autocmd FileType php setlocal commentstring=//\ %s
" }}}


" {{{ lambdalisue/vim-unified-diff
set diffexpr=unified_diff#diffexpr()
" }}}


" {{{ deoplete.nvim
if has('nvim')
  let g:deoplete#enable_at_startup = 1
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
  inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_deoplete_cr_function()<CR>
  function! s:my_deoplete_cr_function() abort
    return deoplete#close_popup() . "\<CR>"
  endfunction
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
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
  endfunction
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
if has('nvim')
  let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
else
  let g:neosnippet#snippets_directory='~/.vim/snippets'
endif

" Plugin key-mappings.
imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)

" Don't use conceal
if has('conceal')
  set conceallevel=0
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
nmap     [Space]S  [vimshell]

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


" {{{ Vim
autocmd MyAutoCmds FileType vim setlocal keywordprg=:help
autocmd MyAutoCmds FileType vim setlocal shiftwidth=2
" }}}


" {{{ Markdown
autocmd MyAutoCmds FileType markdown   set shiftwidth=4
let g:markdown_fenced_languages = ['cpp', 'ruby', 'json']
let g:markdown_syntax_conceal = 0
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


" {{{ deoplete-jedi
let deoplete#sources#jedi#show_docstring = 1
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


" {{{ JSON
autocmd MyAutoCmds BufRead,BufNewFile *.json setfiletype json
autocmd MyAutoCmds FileType json command! JSONPrettify %!python -m json.tool

let g:vim_json_syntax_conceal = 0
" }}}


" {{{ Haskell
let g:haskell_conceal              = 0
let g:haskell_conceal_enumerations = 0

autocmd MyAutoCmds FileType haskell setlocal omnifunc=necoghc#omnifunc

autocmd MyAutoCmds FileType haskell nnoremap <buffer> [haskell]   <Nop>
autocmd MyAutoCmds FileType haskell nmap     <buffer> [Space]h  [haskell]

autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> <ESC><ESC>  :nohlsearch \| :GhcModTypeClear<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]c  :GhcModCheckAsync<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]t  :GhcModType<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]m  :make<CR>

" Use the old regexp engine because the new NFA engine is slow for Haskell's syntax highlighting.
autocmd MyAutoCmds FileType haskell setlocal regexpengine=1
" }}}


" {{{ vim-racer
let $RUST_SRC_PATH = expand("~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")
let g:racer_cmd = expand("~/.cargo/bin")
let g:racer_experimental_completer = 1
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
