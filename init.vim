scriptencoding utf-8


" {{{ $PATH
let $PATH = expand('~/.cargo/bin') . ':' . $PATH
" }}}


" {{{ Plugins
" Execute the following commands first:
"   curl -O https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
"   sh ./installer.sh <my_plugin_dir>
if has('nvim')
  let s:my_plugin_dir = expand('~/.config/nvim/bundle')
else
  let s:my_plugin_dir = expand('~/.vim/bundle')
endif

" Prevent default plugins from being loaded
let g:loaded_matchparen = 1

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
execute 'set runtimepath+=' . s:my_plugin_dir . '/repos/github.com/Shougo/dein.vim'

" Required:
if dein#load_state(s:my_plugin_dir)
  call dein#begin(s:my_plugin_dir)

  " Let dein manage dein
  " Required:
  call dein#add(s:my_plugin_dir . '/repos/github.com/Shougo/dein.vim')

  " Plugins
  " Plug 'AndrewRadev/inline_edit.vim'
  call dein#add('AndrewRadev/linediff.vim',
    \ { 'on_cmd': [
    \   'Linediff',
    \   'LinediffReset',
    \   'LinediffAdd',
    \   'LinediffShow',
    \   'LinediffLast',
    \   'LinediffMerge',
    \   'LinediffPick',
    \ ] })
  " Plug 'AndrewRadev/sideways.vim'
  " Plug 'dannyob/quickfixstatus'
  " Plug 'dhruvasagar/vim-table-mode'
  call dein#add('easymotion/vim-easymotion',
    \ { 'on_map': [
    \   '<Plug>(easymotion-fl)',
    \   '<Plug>(easymotion-Fl)',
    \   '<Plug>(easymotion-tl)',
    \   '<Plug>(easymotion-Tl)',
    \   '<Plug>(easymotion-linebackward)',
    \   '<Plug>(easymotion-j)',
    \   '<Plug>(easymotion-k)',
    \   '<Plug>(easymotion-lineforward)',
    \   '<Plug>(easymotion-bd-f)',
    \   '<Plug>(easymotion-overwin-f)',
    \   '<Plug>(easymotion-bd-w)',
    \   '<Plug>(easymotion-overwin-w)',
    \   '<Plug>(easymotion-bd-jk)',
    \   '<Plug>(easymotion-overwin-line)',
    \ ] })
    \ " optionally depends on 'tpope/vim-repeat'
  " Plug 'vim-scripts/matchit.zip'
  " Plug 'godlygeek/tabular'
  call dein#add('haya14busa/incsearch.vim',
    \ { 'on_map': [
    \   '<Plug>(incsearch-forward)',
    \   '<Plug>(incsearch-stay)',
    \ ] })
  call dein#add('itchyny/vim-cursorword')
  call dein#add('itchyny/vim-parenmatch')
  call dein#add('jiangmiao/auto-pairs',
    \ { 'on_i': 1,
    \   'hook_post_source': 'call AutoPairsTryInit()',
    \ })
  call dein#add('junegunn/vim-easy-align',
    \ { 'on_map': [
    \   '<Plug>(EasyAlign)',
    \ ] })
  call dein#add('kana/vim-operator-user')
  " Plug 'kana/vim-textobj-indent'
  " Plug 'kana/vim-textobj-user'
  call dein#add('Konfekt/FastFold')
  call dein#add('lambdalisue/vim-unified-diff')
  call dein#add('ap/vim-css-color')  " Only for css
  call dein#add('lilydjwg/colorizer',
    \ { 'hook_source': 'let g:colorizer_nomap = 1'
    \ })
  call dein#add('mbbill/undotree',
    \ { 'on_cmd': [
    \   'UndotreeToggle',
    \ ] })
  call dein#add('ntpeters/vim-better-whitespace')
  " Plug 'rhysd/clever-f.vim'
  call dein#add('rhysd/vim-operator-surround',
    \ { 'on_map': [
    \   '<Plug>(operator-surround-append)',
    \   '<Plug>(operator-surround-delete)',
    \   '<Plug>(operator-surround-replace)',
    \ ] })
    \ " depends on 'kana/vim-operator-user'
  " Plug 'vim-scripts/scratch'
  " Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  call dein#add('Shougo/context_filetype.vim')
  call dein#add('Shougo/echodoc',
    \ { 'on_i': 1,
    \   'hook_source': 'let g:echodoc#enable_at_startup = 1',
    \ })
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet',
    \ { 'on_i': 1,
    \   'on_ft': 'snippet',
    \   'depends': ['neosnippet-snippets', 'context_filetype.vim'],
    \ })
  call dein#add('Shougo/neosnippet-snippets')
  " Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  " Plug 'Shougo/vim-vcs'
  " Plug 'Shougo/vinarise'
  call dein#add('t9md/vim-choosewin',
    \ { 'on_map': [
    \   '<Plug>(choosewin)',
    \ ] })
  call dein#add('terryma/vim-expand-region',
    \ { 'on_map': [
    \   '<Plug>(expand_region_expand)',
    \   '<Plug>(expand_region_shrink)',
    \ ] })
  call dein#add('terryma/vim-multiple-cursors')
  " Plug 'thinca/vim-fontzoom'
  " Plug 'thinca/vim-ref'
  " Plug 'thinca/vim-visualstar'
  " Plug 'tpope/vim-projectionist'
  " Plug 'tpope/vim-repeat'
  " Plug 'tpope/vim-surround'
  call dein#add('tyru/caw.vim',
    \ { 'on_map': '<Plug>(caw:' })
  call dein#add('tyru/open-browser.vim',
    \ { 'on_map': [
    \   '<Plug>(openbrowser-smart-search)',
    \ ] })
  call dein#add('w0rp/ale')
  " Plug 'wesQ3/vim-windowswap'
  call dein#add('Yggdroot/indentLine')
  " Plug 'yonchu/accelerated-smooth-scroll'
  call dein#add('yuttie/comfortable-motion.vim')

  " UI enhancements
  " Completion (neocomplete/deoplete)
  " Plug 'ujihisa/neco-look'
  if has('nvim')
    call dein#add('Shougo/deoplete.nvim',
      \ { 'on_i': 1,
      \   'depends': 'context_filetype.vim',
      \   'hook_source':
      \     "call deoplete#custom#set('_', 'converters', [
      \        'converter_auto_paren',
      \        'converter_remove_overlap',
      \        'converter_truncate_abbr',
      \        'converter_truncate_menu'
      \      ]) |
      \      call deoplete#custom#set('_', 'min_pattern_length', 0)"
      \ })
  else
    call dein#add('Shougo/neocomplete.vim', { 'on_i': 1 })
  endif

  " Interactive filter
  call dein#add('Shougo/denite.nvim',
    \ { 'on_cmd': 'Denite',
    \   'hook_source':
    \     "call denite#custom#var('file_rec', 'command',
    \        ['rg', '--files', '--glob', '!.git'])
    \     |call denite#custom#alias('source', 'file_rec/git', 'file_rec')
    \     |call denite#custom#var('file_rec/git', 'command',
    \        ['git', 'ls-files', '-co', '--exclude-standard'])
    \     |call denite#custom#map(
    \        'insert',
    \        '<C-n>',
    \        '<denite:move_to_next_line>',
    \        'noremap'
    \      )
    \     |call denite#custom#map(
    \        'insert',
    \        '<C-p>',
    \        '<denite:move_to_previous_line>',
    \        'noremap'
    \      )
    \     |call denite#custom#option('default', 'prompt', '>')",
    \ })
  call dein#add('junegunn/fzf',
    \ { 'build': './install --bin; rm ./doc/fzf.txt'
    \ })
    \ " Remove the file because it contains a conflicting helptag
  call dein#add('junegunn/fzf.vim')

  "
  " Plugins for Languages
  "
  " Elm
  call dein#add('ElmCast/elm-vim')
  " fish shell
  call dein#add('dag/vim-fish')

  " Git
  call dein#add('jreybert/vimagit')
  call dein#add('itchyny/vim-gitbranch')
  call dein#add('airblade/vim-gitgutter')
  " Plug 'gregsexton/gitv'
  call dein#add('lambdalisue/gina.vim',
    \ { 'on_cmd': [
    \   'Gina',
    \ ] })
  call dein#add('tpope/vim-fugitive')

  " GitHub
  " Plug 'mattn/gist-vim'

  " Haskell
  " Plug 'neovimhaskell/haskell-vim'
  " Plug 'eagletmt/ghcmod-vim'
  " Plug 'eagletmt/neco-ghc'

  " i3
  call dein#add('PotatoesMaster/i3-vim-syntax')  " syntax, ftplugin

  " PHP
  call dein#add('2072/PHP-Indenting-for-VIm')  " indent
  " Plug 'shawncplus/phpcomplete.vim'  " This includes syntax file and conflicts with StanAngeloff/php.vim
  call dein#add('StanAngeloff/php.vim')  " syntax

  " Python
  if has('nvim')
    call dein#add('zchee/deoplete-jedi',
      \ { 'build': 'git submodule update --init',
      \   'on_ft': 'python',
      \ })
  endif
  " Plug 'vim-scripts/pythoncomplete'
  " Plug 'Glench/Vim-Jinja2-Syntax'

  " Ruby
  call dein#add('vim-ruby/vim-ruby')  " syntax, indent, ftplugin, compiler

  " Rust
  call dein#add('racer-rust/vim-racer')
  call dein#add('rust-lang/rust.vim')  " syntax, indent, ftplugin, compiler, plugin

  " TypeScript
  call dein#add('leafgarland/typescript-vim')
  call dein#add('Quramy/tsuquyomi')
  if has('nvim')
    " Plug 'mhartington/nvim-typescript', { 'do': function('DoRemoteUpdate') }
  endif

  " Vim
  " Plug 'mopp/layoutplugin.vim'
  call dein#add('vim-jp/syntax-vim-ex')  " syntax

  " Web/CSS
  " Plug 'csscomb/vim-csscomb'
  call dein#add('hail2u/vim-css3-syntax')  " syntax
  call dein#add('othree/csscomplete.vim')
  call dein#add('cakebaker/scss-syntax.vim')  " syntax, ftplugin

  " Web/JavaScript
  " Plug 'carlitux/deoplete-ternjs'
  call dein#add('pangloss/vim-javascript')  " syntax, indent, compiler, ftplugin
  call dein#add('othree/javascript-libraries-syntax.vim')  " syntax

  " Web/HTML
  call dein#add('othree/html5.vim')  " syntax, indent, ftplugin
  call dein#add('mattn/emmet-vim', { 'on_ft': ['html', 'xml', 'php'] })
  " Plug 'ervandew/sgmlendtag'
  " Plug 'pbrisbin/html-template-syntax'

  " Markdown
  call dein#add('godlygeek/tabular',
    \ { 'on_cmd': [
    \   'AddTabularPattern',
    \   'AddTabularPipeline',
    \   'Tabularize',
    \   'GTabularize',
    \ ] })
  call dein#add('plasticboy/vim-markdown',
    \ { 'on_ft': 'markdown',
    \   'depends': 'tabular',
    \ })  " syntax, indent, ftplugin
  " or
  " Plug 'rhysd/vim-gfm-syntax'
  " Plug 'kannokanno/previm'
  " Plug 'tpope/vim-markdown'
  " Plug 'tyru/markdown-codehl-onthefly.vim'

  " reStructuredText
  call dein#add('Rykka/riv.vim', { 'on_ft': 'rst' })

  " Other filetype-specific plugins
  call dein#add('jamessan/vim-gnupg')
  " Plug 'fatih/vim-go'
  " Plug 'vim-scripts/gtk-vim-syntax'
  " Plug 'guns/vim-sexp'
  " Plug 'jceb/vim-orgmode'
  " Plug 'lervag/vimtex'
  " Plug 'octol/vim-cpp-enhanced-highlight'
  " Plug 'def-lkb/ocp-indent-vim'
  call dein#add('cespare/vim-toml')  " syntax, ftplugin
  call dein#add('elzr/vim-json')  " syntax, indent, ftplugin
  " Plug 'JuliaLang/julia-vim'

  " Themes
  call dein#add('itchyny/lightline.vim')
  " Plug 'chriskempson/base16-vim'
  " Plug '29decibel/codeschool-vim-theme'
  " Plug 'jpo/vim-railscasts-theme'
  " Plug 'nanotech/jellybeans.vim'
  " Plug 'NLKNguyen/papercolor-theme'
  call dein#add('ryanoasis/vim-devicons')    " This must be loaded after its supported plugins
  " Plug 'tomasr/molokai'
  " Plug 'w0ng/vim-hybrid'
  call dein#add('yuttie/hydrangea-vim')
  call dein#add('yuttie/inkstained-vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
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
  set shell=bash
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
  set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
endif

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set background=dark
  colorscheme inkstained
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

nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap <C-Tab>   gt
nnoremap <C-S-Tab> gT
nnoremap <C-s> :w<CR>
nnoremap <C-i> <C-g>

" command
cmap w!! w !sudo tee > /dev/null %

" terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" Space-prefixed bindings
nnoremap [help] <Nop>
nmap     [Space]h [help]
nnoremap <silent> [help]h  :<C-u>Helptags<CR>
nnoremap <silent> [help]dc :<C-u>Commands<CR>
nnoremap <silent> [help]dm :<C-u>Maps<CR>
nnoremap <silent> [help]dC :<C-u>Colors<CR>

nnoremap [plugin] <Nop>
nmap     [Space]P [plugin]
nnoremap <silent> [plugin]P :call dein#update()<CR>
nnoremap <silent> [plugin]i :call dein#install()<CR>
nnoremap <silent> [plugin]c :call map(dein#check_clean(), "delete(v:val, 'rf')")<CR>

nnoremap [file] <Nop>
nmap     [Space]f [file]
nnoremap <silent> [file]vd :e $MYVIMRC<CR>
nnoremap <silent> [file]vR :source $MYVIMRC<CR>
nnoremap <silent> [file]j  :VimFiler<CR>
nnoremap <silent> [file]f  :<C-u>Files<CR>
nnoremap <silent> [file]r  :<C-u>Denite file_mru<CR>
nnoremap <silent> [file]s  :w<CR>
nnoremap <silent> [file]S  :wa<CR>
nnoremap <silent> [file]t  :NERDTree<CR>
nnoremap <silent> [file]T  :VimFilerExplore<CR>
nnoremap          [file]R  :Rename<Space>

nnoremap [search] <Nop>
nmap     [Space]s [search]
nnoremap <silent> [search]s  :<C-u>BLines<CR>
nnoremap <silent> [search]gg :<C-u>Grep<CR>
nnoremap <silent> [search]gr :<C-u>Rg<CR>

nnoremap [buffer] <Nop>
nmap     [Space]b [buffer]
nnoremap <silent> [buffer]b :<C-u>Buffers<CR>
nnoremap <silent> [buffer]n :bn<CR>
nnoremap <silent> [buffer]p :bp<CR>
nnoremap <silent> [buffer]d :bd<CR>

nnoremap [project] <Nop>
nmap     [Space]p [project]
nnoremap <silent> [project]f :<C-u>GFiles<CR>

nnoremap [error] <Nop>
nmap     [Space]e [error]
nnoremap <silent> [error]l :lwindow<CR>
nnoremap <silent> [error]c :lclose<CR>
nnoremap <silent> [error]n :lnext<CR>
nnoremap <silent> [error]p :lprevious<CR>
nnoremap <silent> [error]N <Plug>(ale_next_wrap)
nnoremap <silent> [error]P <Plug>(ale_previous_wrap)

nnoremap [toggle] <Nop>
nmap     [Space]t [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]w :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]i :IndentLinesToggle<CR>:echo b:indentLine_enabled ? 'indentLine enabled' : 'indentLine disabled'<CR>
nnoremap <silent> [toggle]l :ALEToggle<CR>:echo g:ale_enabled ? 'ALE enabled' : 'ALE disabled'<CR>
nnoremap <silent> [toggle]n :setl number!<CR>:setl number?<CR>
" 'paste' is OBSOLETE
nnoremap <silent> [toggle]p :set paste!<CR>:set paste?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>
nnoremap <silent> [toggle]d :GitGutterLineHighlightsToggle<CR>

nnoremap [comment] <Nop>
nmap     [Space]c [comment]
xmap     [Space]c [comment]
nmap     [comment]  <Plug>(caw:hatpos:toggle:operator)
xmap     [comment]  <Plug>(caw:hatpos:toggle:operator)
nmap     [comment]c <Plug>(caw:hatpos:toggle)
nmap     [comment]o <Plug>(caw:jump:comment-next)
nmap     [comment]O <Plug>(caw:jump:comment-prev)

nnoremap [jump] <Nop>
nmap     [Space]<Space> [jump]
xmap     [Space]<Space> [jump]
omap     [Space]<Space> [jump]

map      [jump]h  <Plug>(easymotion-linebackward)
map      [jump]j  <Plug>(easymotion-j)
map      [jump]k  <Plug>(easymotion-k)
map      [jump]l  <Plug>(easymotion-lineforward)

map      [jump]c  <Plug>(easymotion-bd-f)
nmap     [jump]c  <Plug>(easymotion-overwin-f)

map      [jump]w  <Plug>(easymotion-bd-w)
nmap     [jump]w  <Plug>(easymotion-overwin-w)

map      [jump]L  <Plug>(easymotion-bd-jk)
nmap     [jump]L  <Plug>(easymotion-overwin-line)

nmap     [jump]W <Plug>(choosewin)

nmap     [jump]o  :<C-u>Denite outline<CR>

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
      \ 'colorscheme': 'inkstained',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'git_branch', 'readonly', 'relativepath', 'modified' ],
      \     [ 'ale' ],
      \   ],
      \   'right': [
      \     [ 'fulllineinfo' ],
      \     [ 'filetype' ],
      \     [ 'fileformat', 'fileencoding' ],
      \   ],
      \ },
      \ 'inactive': {
      \   'left': [
      \     [ 'mode' ],
      \     [ 'git_branch', 'readonly', 'relativepath', 'modified' ],
      \   ],
      \   'right': [
      \     [ 'fulllineinfo' ],
      \     [ 'filetype' ],
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
      \   'fulllineinfo': '%3p%% %3l %2v',
      \ },
      \ 'component_function': {
      \   'relativepath': 'g:lightline.my.relativepath',
      \   'filetype':    'g:lightline.my.filetype',
      \   'fileformat':  'g:lightline.my.fileformat',
      \   'git_branch':  'g:lightline.my.git_branch',
      \   'ale':         'ALEGetStatusLine',
      \   'cwd':         'getcwd',
      \ },
      \ 'separator':    { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }

let g:lightline.my = {}

function! g:lightline.my.layout_init()
  let g:ale_statusline_format = ['%d error(s)', '%d warning(s)', 'OK']
  let g:lightline.my.layout_levels = {
    \   'relativepath': 3,
    \   'filetype': 2,
    \   'fileformat': 2,
    \   'git_branch': 1,
    \ }
endfunction
call g:lightline.my.layout_init()

function! g:lightline.my.layout()
  " Test if light line is ready or not
  try
    call lightline#mode()
  catch
    " Not ready yet
    return
  endtry

  let possible_fixes = [
    \   "let g:ale_statusline_format = ['E:%d', 'W:%d', '']",
    \   'let g:lightline.my.layout_levels.relativepath = 2',
    \   'let g:lightline.my.layout_levels.relativepath = 1',
    \   'let g:lightline.my.layout_levels.fileformat = 1',
    \   'let g:lightline.my.layout_levels.filetype = 1',
    \   'let g:lightline.my.layout_levels.git_branch = 0',
    \ ]
  let padding_len = 2
  let sep_len = 1
  let available = winwidth(0)

  " Optimize the layout
  call g:lightline.my.layout_init()
  while 1
    " Compute the already occupied space
    let left_rendered = [
      \   lightline#mode(),
      \   &paste?"PASTE":"",
      \   g:lightline.my.git_branch(),
      \   g:lightline.my.relativepath(),
      \   &modified ? '+' : '',
      \   ALEGetStatusLine(),
      \ ]
    let right_rendered = [
      \   g:lightline.my.fileformat(),
      \   &fenc!=#""?&fenc:&enc,
      \   g:lightline.my.filetype(),
      \   '100%',
      \   '1000:100',
      \ ]
    let occupied = 0
    for component in left_rendered + right_rendered
      if !empty(component)
        let occupied += strlen(component) + padding_len + sep_len
      endif
    endfor

    " Evaluate the current layout
    if occupied <= available
      " Fine
      break
    else
      " Overflow
      if len(possible_fixes) == 0
        " No fix available
        break
      else
        " Try to fix
        let app = possible_fixes[0]
        call remove(possible_fixes, 0)
        exec app
      endif
    end
  endwhile
endfunction
autocmd MyAutoCmds WinEnter,BufWinEnter,FileType,EncodingChanged,VimResized * call g:lightline.my.layout()

function! g:lightline.my.relativepath_level(level)
  let relpath = expand('%')
  return a:level >= 3 ? relpath
    \  : a:level == 2 ? pathshorten(relpath)
    \  : expand('%:t')
endfunction

function! g:lightline.my.filetype_level(level)
  let relpath = expand('%')
  if empty(&filetype)
    let filetype = 'no ft'
    let icon = ''
  else
    let filetype = &filetype
    let icon = WebDevIconsGetFileTypeSymbol()
  endif
  return a:level >= 2 ? filetype . ' ' . icon
    \  : a:level == 1 ? icon
    \  : ''
endfunction

function! g:lightline.my.fileformat_level(level)
  return a:level >= 2 ? &fileformat . ' ' . WebDevIconsGetFileFormatSymbol()
    \  : a:level == 1 ? WebDevIconsGetFileFormatSymbol()
    \  : ''
endfunction

function! g:lightline.my.git_branch_level(level)
  let branch = gitbranch#name()
  if empty(branch)
    return ''
  else
    return a:level >= 1 ? '' . branch
      \  : ''
  endif
endfunction

function! g:lightline.my.relativepath()
  return g:lightline.my.relativepath_level(g:lightline.my.layout_levels.relativepath)
endfunction

function! g:lightline.my.filetype()
  return g:lightline.my.filetype_level(g:lightline.my.layout_levels.filetype)
endfunction

function! g:lightline.my.fileformat()
  return g:lightline.my.fileformat_level(g:lightline.my.layout_levels.fileformat)
endfunction

function! g:lightline.my.git_branch()
  return g:lightline.my.git_branch_level(g:lightline.my.layout_levels.git_branch)
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
let g:indentLine_color_term = 251
let g:indentLine_color_gui = '#c8c6c1'
let g:indentLine_color_tty_light = 4
let g:indentLine_color_dark = 2
let g:indentLine_char = '⎸'
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
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-stay)
" }}}


" {{{ vim-operator-surround
map <silent>si <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sc <Plug>(operator-surround-replace)
noremap ss s
" }}}


" {{{ vim-easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = "hutenosadi"

nmap f <Plug>(easymotion-fl)
nmap F <Plug>(easymotion-Fl)
nmap t <Plug>(easymotion-tl)
nmap T <Plug>(easymotion-Tl)
" }}}


" {{{ vim-choosewin
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


" {{{ open-browser.vim
nmap gw <Plug>(openbrowser-smart-search)
vmap gw <Plug>(openbrowser-smart-search)
" }}}


" {{{ vim-gnupg
let g:GPGPreferSymmetric = 1
" }}}


" {{{ Git
autocmd MyAutoCmds FileType gitcommit setlocal spell
autocmd MyAutoCmds FileType gina-commit setlocal spell

let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 5000
let g:gitgutter_override_sign_column_highlight = 0

nnoremap [git]    <Nop>
nmap     <C-g>    [git]
nmap     [Space]g [git]

nnoremap <silent> [git]c      :Gina commit -v --opener="topleft vsplit"<CR>
nnoremap <silent> [git]<C-d>  :Gvdiff<CR>
nmap [git]s     :Magit<CR>
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


" {{{ fzf.vim
let $FZF_DEFAULT_COMMAND = 'rg --files --glob !.git'
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \   'bg':      ['bg', 'Normal'],
  \   'hl':      ['fg', 'Comment'],
  \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \   'hl+':     ['fg', 'Statement'],
  \   'info':    ['fg', 'PreProc'],
  \   'prompt':  ['fg', 'Conditional'],
  \   'pointer': ['fg', 'Exception'],
  \   'marker':  ['fg', 'Keyword'],
  \   'spinner': ['fg', 'Label'],
  \   'header':  ['fg', 'Comment'] }

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 guifg=#1e222c guibg=#91b5ff
  highlight fzf2 guifg=#91b5ff guibg=#2a303b
  setlocal statusline=%#fzf1#\ fzf\ %#fzf2#
endfunction

autocmd MyAutoCmds FileType fzf tnoremap <silent><buffer> <Esc> <C-\><C-n>:q<CR>
autocmd MyAutoCmds User FzfStatusLine call <SID>fzf_statusline()

command! -bang -nargs=* Grep
  \ call fzf#vim#grep('grep --line-number --recursive '.shellescape(<q-args>), 0, <bang>0)

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" }}}


" {{{ caw.vim
autocmd FileType php setlocal commentstring=//\ %s
" }}}


" {{{ deoplete.nvim
if has('nvim')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_complete_delay = 0
  let g:deoplete#auto_refresh_delay = 100
  let g:deoplete#max_list = 10000
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr> <C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
  inoremap <expr> <BS>  deoplete#mappings#smart_close_popup()."\<C-h>"
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_deoplete_cr_function()<CR>
  function! s:my_deoplete_cr_function() abort
    return deoplete#close_popup() . "\<CR>"
  endfunction

  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#functions.css = 'csscomplete#CompleteCSS'
  let g:deoplete#omni#functions.ruby = 'rubycomplete#Complete'
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
imap <expr> <Tab>
  \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" :
  \ "\<Tab>"
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


" {{{ echodoc
set cmdheight=2
let g:echodoc#enable_at_startup = 1
" }}}


" {{{ vim-ref
let g:ref_alc_start_linenumber = 42
let g:ref_refe_encoding = 'euc-jp'
" }}}


" {{{ fish
autocmd MyAutoCmds FileType fish setlocal foldmethod=expr
" }}}


" {{{ Vim
autocmd MyAutoCmds FileType vim setlocal keywordprg=:help
autocmd MyAutoCmds FileType vim setlocal shiftwidth=2
" }}}


" {{{ Markdown
autocmd MyAutoCmds FileType markdown   setlocal shiftwidth=4
let g:markdown_fenced_languages = ['cpp', 'ruby', 'json']
let g:markdown_syntax_conceal = 0
" }}}


" {{{ C/C++
autocmd MyAutoCmds BufNewFile,BufRead *.cpp setlocal matchpairs+=<:>
" }}}


" {{{ TeX
let g:tex_conceal = ""
autocmd MyAutoCmds FileType tex setlocal shiftwidth=2
autocmd MyAutoCmds FileType bib setlocal shiftwidth=2
" }}}


" {{{ Shell Scripts
autocmd MyAutoCmds FileType sh,csh,tcsh,zsh setlocal shiftwidth=2
" }}}


" {{{ Ruby
autocmd MyAutoCmds FileType ruby,eruby setlocal shiftwidth=2
" }}}


" {{{ deoplete-jedi
let deoplete#sources#jedi#show_docstring = 1
" }}}


" {{{ Python
autocmd MyAutoCmds FileType python setlocal tabstop=8
autocmd MyAutoCmds FileType python setlocal expandtab
autocmd MyAutoCmds FileType python setlocal softtabstop=4
autocmd MyAutoCmds FileType python setlocal shiftwidth=4
autocmd MyAutoCmds FileType python inoremap # X#
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

autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> <Esc><Esc>  :nohlsearch \| :GhcModTypeClear<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]c  :GhcModCheckAsync<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]t  :GhcModType<CR>
autocmd MyAutoCmds FileType haskell nnoremap <buffer><silent> [haskell]m  :make<CR>

" Use the old regexp engine because the new NFA engine is slow for Haskell's syntax highlighting.
autocmd MyAutoCmds FileType haskell setlocal regexpengine=1
" }}}


" {{{ ALE
let g:ale_rust_cargo_use_check = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '??'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%severity%][%linter%] %s'
let g:ale_open_list = 1
let g:ale_linters = {
  \ 'cpp': ['clang'],
  \ }
" }}}


" {{{ vim-racer
let g:racer_experimental_completer = 1
autocmd MyAutoCmds FileType rust nmap gd <Plug>(rust-def)
autocmd MyAutoCmds FileType rust nmap gs <Plug>(rust-def-split)
autocmd MyAutoCmds FileType rust nmap gx <Plug>(rust-def-vertical)
autocmd MyAutoCmds FileType rust nmap gD <Plug>(rust-doc)
" }}}


" {{{ Web
autocmd MyAutoCmds FileType javascript setlocal shiftwidth=2
autocmd MyAutoCmds FileType typescript setlocal shiftwidth=2
autocmd MyAutoCmds FileType html       setlocal shiftwidth=2
autocmd MyAutoCmds FileType css        setlocal shiftwidth=2
autocmd MyAutoCmds FileType scss       setlocal shiftwidth=2
" }}}


" {{{ PHP
function! s:PhpOverrideSyntaxHighlight()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction
autocmd MyAutoCmds FileType php call s:PhpOverrideSyntaxHighlight()

function! s:PHPFix()
  set nocursorline
  let b:cursorword = 0
  autocmd InsertEnter <buffer> DisableWhitespace
  autocmd InsertLeave <buffer> EnableWhitespace
endfunction
autocmd MyAutoCmds FileType php call s:PHPFix()
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
