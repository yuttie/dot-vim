scriptencoding utf-8
" ^^ Please leave the above line at the start of the file.

" Pre-GUI settings
set columns=84 lines=25       " don't inherit geometry from parent term
set mousemodel=popup          " right mouse button pops up a menu in the GUI
"set guifontset=-misc-fixed-medium-r-normal--14-*-*-*-*-*-*-*
set guifont=monospace\ 10 "DejaVu\ Sans\ Mono\ Half\ Width\ 10  "Monospace\ 10
set guioptions-=T
" Also save gvim's window size and position
set sessionoptions+=resize,winpos

" Set color scheme
colorscheme lucius

" IME Settings
if has('multi_byte_ime') || has('xim')
  " Set cursor color with IME on
  highlight CursorIM guibg=Purple guifg=NONE
  " Default IME state on insert and search mode
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " Set key of enabling IME
    "set imactivatekey=s-space
  endif
  " Don't remember IME state on insert mode
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

" Hide mouse cursor when typing starts
set mousehide

" Use a sufficiently wide window automatically when started as "gvimdiff"
if (&foldmethod == 'diff')
  set columns=165
endif

" For bug 33327, add a mapping which allows shift-insert to function
" as expected in insert and command-line modes
map! <s-insert> <c-r>*
