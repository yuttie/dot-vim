scriptencoding utf-8


" Workaround to force neovim use alternate screen
if $TERM =~ '^tmux\(-.*\)\?$'
  let $TERM="screen-256color"
endif

" {{{ $PATH
let $PATH = expand('~/.local/bin') . ':' . expand('~/.cargo/bin') . ':' . $PATH
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
  call dein#add('cocopon/vaffle.vim')  " Doesn't work correctly when lazily loaded
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
  call dein#add('haya14busa/incsearch.vim',
    \ { 'on_map': [
    \   '<Plug>(incsearch-forward)',
    \   '<Plug>(incsearch-stay)',
    \ ] })
  call dein#add('itchyny/vim-cursorword')
  call dein#add('itchyny/vim-parenmatch')
  call dein#add('tmsvg/pear-tree',
    \ { 'on_i': 1,
    \ })
  call dein#add('junegunn/vim-easy-align',
    \ { 'on_map': [
    \   '<Plug>(EasyAlign)',
    \ ] })
  call dein#add('kana/vim-operator-user')
  call dein#add('kana/vim-textobj-user')
  call dein#add('rhysd/vim-textobj-anyblock')
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
  call dein#add('rhysd/vim-operator-surround',
    \ { 'on_map': [
    \   '<Plug>(operator-surround-append)',
    \   '<Plug>(operator-surround-delete)',
    \   '<Plug>(operator-surround-replace)',
    \ ] })
    \ " depends on 'kana/vim-operator-user'
  call dein#add('Shougo/context_filetype.vim')
  call dein#add('Shougo/echodoc',
    \ { 'on_i': 1,
    \   'hook_source':
    \     "let g:echodoc#enable_at_startup = 1
    \     |let g:echodoc#type = 'floating'
    \     |highlight link EchoDocFloat Pmenu",
    \ })
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet',
    \ { 'on_i': 1,
    \   'on_ft': 'snippet',
    \   'depends': ['neosnippet-snippets', 'context_filetype.vim'],
    \ })
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/vinarise')
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
  call dein#add('tyru/caw.vim',
    \ { 'on_map': '<Plug>(caw:' })
  call dein#add('tyru/open-browser.vim',
    \ { 'on_map': [
    \   '<Plug>(openbrowser-smart-search)',
    \ ] })
  call dein#add('w0rp/ale')
  call dein#add('Yggdroot/indentLine')
  call dein#add('yuttie/comfortable-motion.vim')

  " UI enhancements
  call dein#add('chrisbra/NrrwRgn')
  call dein#add('luochen1990/rainbow')
  " Completion
  call dein#add('neoclide/coc.nvim',
    \ { 'rev': 'release',
    \   'merge': 0,
    \ })
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
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
  " Crystal
  call dein#add('rhysd/vim-crystal')

  " Elm
  call dein#add('ElmCast/elm-vim')

  " fish shell
  call dein#add('dag/vim-fish')

  " Git
  call dein#add('jreybert/vimagit')
  call dein#add('itchyny/vim-gitbranch')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('lambdalisue/gina.vim',
    \ { 'on_cmd': [
    \   'Gina',
    \ ] })
  call dein#add('tpope/vim-fugitive')
  call dein#add('hotwatermorning/auto-git-diff')

  " Haskell
  call dein#add('neovimhaskell/haskell-vim')  " syntax, indent

  " i3
  call dein#add('PotatoesMaster/i3-vim-syntax')  " syntax, ftplugin

  " Julia
  call dein#add('JuliaEditorSupport/julia-vim')

  " PHP
  call dein#add('2072/PHP-Indenting-for-VIm')  " indent
  call dein#add('StanAngeloff/php.vim')  " syntax

  " Ruby
  call dein#add('vim-ruby/vim-ruby')  " syntax, indent, ftplugin, compiler

  " Rust
  call dein#add('racer-rust/vim-racer')
  call dein#add('rust-lang/rust.vim')  " syntax, indent, ftplugin, compiler, plugin

  " TypeScript
  call dein#add('leafgarland/typescript-vim')
  call dein#add('Quramy/tsuquyomi')

  " Vim
  call dein#add('vim-jp/syntax-vim-ex')  " syntax

  " Web/CSS
  call dein#add('hail2u/vim-css3-syntax')  " syntax
  call dein#add('othree/csscomplete.vim')
  call dein#add('cakebaker/scss-syntax.vim')  " syntax, ftplugin

  " Web/JavaScript
  call dein#add('pangloss/vim-javascript')  " syntax, indent, compiler, ftplugin
  call dein#add('othree/javascript-libraries-syntax.vim')  " syntax

  " Web/HTML
  call dein#add('othree/html5.vim')  " syntax, indent, ftplugin
  call dein#add('mattn/emmet-vim', { 'on_ft': ['html', 'xml', 'php'] })

  " Web/Vue
  call dein#add('posva/vim-vue')

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

  " AsciiDoc
  call dein#add('mjakl/vim-asciidoc', { 'on_ft': 'asciidoc' })

  " reStructuredText
  call dein#add('Rykka/riv.vim', { 'on_ft': 'rst' })

  " TeX
  call dein#add('lervag/vimtex')

  " TOML
  call dein#add('cespare/vim-toml')  " syntax, ftplugin

  " JSON
  call dein#add('elzr/vim-json')  " syntax, indent, ftplugin

  " GnuPG
  call dein#add('jamessan/vim-gnupg')

  " Themes
  call dein#add('itchyny/lightline.vim')
  call dein#add('ryanoasis/vim-devicons')    " This must be loaded after its supported plugins
  call dein#add('yuttie/hydrangea-vim', { 'rev': 'develop' })
  call dein#add('yuttie/inkstained-vim')
  call dein#add('yuttie/snowy-vim')
  call dein#add('cocopon/iceberg.vim')

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
set cmdheight=2
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
set foldlevelstart=99

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
  set background=light
  colorscheme snowy
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

nnoremap <C-Left>  <C-w>h
nnoremap <C-Right> <C-w>l
nnoremap <C-Up>    <C-w>k
nnoremap <C-Down>  <C-w>j

nnoremap <S-Left>  <C-w>><CR>
nnoremap <S-Right> <C-w><<CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap <C-Tab>   gt
nnoremap <C-S-Tab> gT
nnoremap <S-PageDown> :tabmove +1<CR>
nnoremap <S-PageUp>   :tabmove -1<CR>
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
nnoremap <silent> [plugin]c :echo dein#check_clean() <Bar> call map(dein#check_clean(), "delete(v:val, 'rf')") <Bar> call dein#recache_runtimepath() <Bar> echo "Cleaned up."<CR>

nnoremap [file] <Nop>
nmap     [Space]f [file]
nnoremap <silent> [file]vd :tab vsplit $MYVIMRC<CR>
nnoremap <silent> [file]vR :source $MYVIMRC<CR>
nnoremap <silent> [file]j  :Vaffle<CR>
nnoremap <silent> [file]f  :<C-u>Denite file<CR>
nnoremap <silent> [file]F  :<C-u>Files<CR>
nnoremap <silent> [file]r  :<C-u>Denite file_mru<CR>
nnoremap <silent> [file]s  :w<CR>
nnoremap <silent> [file]S  :wa<CR>
nnoremap <silent> [file]t  :NERDTree<CR>
nnoremap          [file]R  :Rename<Space>

nnoremap [search] <Nop>
nmap     [Space]s [search]
nnoremap <silent> [search]s  :<C-u>BLines<CR>
nnoremap <silent> [search]gg :<C-u>Grep<CR>
nnoremap <silent> [search]gr :<C-u>Rg<CR>

nnoremap [buffer] <Nop>
nmap     [Space]b [buffer]
nnoremap <silent> [buffer]b :<C-u>Denite buffer<CR>
nnoremap <silent> [buffer]B :<C-u>Buffers<CR>
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
nnoremap <silent> [toggle]( :RainbowToggle<CR>

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
if has('nvim')
  let template_dir = "~/.config/nvim/template"
else
  let template_dir = "~/.vim/template"
endif
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
      \ 'colorscheme': 'snowy',
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
let g:better_whitespace_operator = ''
let g:better_whitespace_filetypes_blacklist = [
      \ 'diff',
      \ 'gitcommit',
      \ 'qf',
      \ 'help',
      \ 'markdown',
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
map <silent>ys <Plug>(operator-surround-append)
nmap <silent>ds <Plug>(operator-surround-delete)a
nmap <silent>cs <Plug>(operator-surround-replace)a
nmap <silent>dS <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
nmap <silent>cS <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)
" }}}


" {{{ vim-easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = "hutenosadi"
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

set updatetime=100  " for vim-gitgutter to update signs immediately
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


" {{{ vaffle.vim
function! s:customize_vaffle_mappings() abort
  " Toggle
  nmap <buffer> <silent> <Space>       <Plug>(vaffle-toggle-current)
  nmap <buffer> <silent> .             <Plug>(vaffle-toggle-hidden)
  nmap <buffer> <silent> *             <Plug>(vaffle-toggle-all)
  vmap <buffer> <silent> <Space>       <Plug>(vaffle-toggle-current)
  " Operations for selected items
  nmap <buffer> <nowait> <silent> d    <Plug>(vaffle-delete-selected)
  nmap <buffer> <silent>          x    <Plug>(vaffle-fill-cmdline)
  nmap <buffer> <silent>          m    <Plug>(vaffle-move-selected)
  nmap <buffer> <silent>          <CR> <Plug>(vaffle-open-selected)
  nmap <buffer> <silent>          r    <Plug>(vaffle-rename-selected)
  " Operations for a item on cursor
  nmap <buffer> <silent>          l    <Plug>(vaffle-open-current)
  nmap <buffer> <nowait> <silent> t    <Plug>(vaffle-open-current-tab)
  " Misc
  nmap <buffer> <silent>          o    <Plug>(vaffle-mkdir)
  nmap <buffer> <silent>          i    <Plug>(vaffle-new-file)
  nmap <buffer> <silent>          ~    <Plug>(vaffle-open-home)
  nmap <buffer> <silent>          h    <Plug>(vaffle-open-parent)
  nmap <buffer> <silent>          q    <Plug>(vaffle-quit)
  nmap <buffer> <silent>          R    <Plug>(vaffle-refresh)
endfunction
autocmd MyAutoCmds FileType vaffle call s:customize_vaffle_mappings()
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


" {{{ coc.nvim
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
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


" {{{ rainbow
let g:rainbow_active = 0
let g:rainbow_conf = {
  \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
  \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
  \   'operators': '_,_',
  \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
  \   'separately': {
  \     '*': {},
  \     'tex': {
  \       'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
  \     },
  \     'lisp': {
  \       'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
  \     },
  \     'vim': {
  \       'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
  \     },
  \     'html': {
  \       'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
  \     },
  \     'css': 0,
  \   }
  \ }
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
autocmd MyAutoCmds FileType markdown setlocal shiftwidth=2
let g:markdown_fenced_languages = ['cpp', 'ruby', 'json']
let g:markdown_syntax_conceal = 0
nnoremap [markdown]  <Nop>
xnoremap [markdown]  <Nop>
nmap     [Space]m    [markdown]
xmap     [Space]m    [markdown]
nmap     [markdown]f :TableFormat<CR>
xmap     [markdown]f :TableFormat<CR>
" }}}


" {{{ AsciiDoc
let g:vim_asciidoc_initial_foldlevel=99
" }}}


" {{{ C/C++
autocmd MyAutoCmds BufNewFile,BufRead *.cpp setlocal matchpairs+=<:>
" }}}


" {{{ Crystal
autocmd MyAutoCmds FileType crystal setlocal shiftwidth=2
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


" {{{ YAML
autocmd MyAutoCmds FileType yaml setlocal shiftwidth=2
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
let g:ale_open_list = 0
let g:ale_linters = {
  \ 'cpp': ['clang'],
  \ 'haskell': ['ghc', 'hlint']
  \ }
let g:ale_haskell_ghc_options = '-fno-code -v0 -Wall'
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
autocmd MyAutoCmds FileType vue        setlocal shiftwidth=2
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


" {{{ XML
autocmd MyAutoCmds FileType xml setlocal shiftwidth=2
" }}}

" }}}  Extensions


" vim: set foldmethod=marker:
