scriptencoding utf-8


"
" {{{ Options
"
" 1 important
set nocompatible        " Use Vim defaults (much better!)
" 2 moving around, searching and patterns
set incsearch
set ignorecase          " easier to ignore case for searching
set smartcase
set nowrapscan
" 4 displaying text
set nowrap              " Don't wrap lines.
set number              " Show line number
if v:version >= 700
  set numberwidth=4
endif
" 6 multiple windows
set hidden              " you can change buffer without saving
set laststatus=2 " Always show the filename on status line.
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%{exists('*SkkGetModeStr')?SkkGetModeStr():''}%=%l,%c%V%8P
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%{exists('*eskk#statusline')?eskk#statusline():''}%=%l,%c%V%8P
" 7 multiple tab pages
set showtabline=2
set tabpagemax=100
" 11 printing
set printencoding=utf-8
set printmbcharset=JIS_X_1990
set printfont=monospace\ 10
set printoptions+=number:y
set printmbfont=r:GothicBBB-Medium
" 12 messages and info
set shortmess=atToOI    " shortens messages to avoid 'press a key' prompt 
set ruler               " Show the cursor position all the time
" 14 editing text
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
" 15 tabs and indenting
set expandtab           " Use white-space instead of tabs.
set shiftwidth=4        " Set indent width on autoindent.
set autoindent          " Always set auto-indenting on
set smartindent         " Smart indenting
set smarttab
set cinoptions=:0,g0
" 16 folding
set foldmethod=syntax
set foldlevelstart=99
" 19 reading and writing files
set modeline
set fileformats=unix,dos,mac  " support all three, in this order
set backup
" 21 command line editing
set history=1000        " keep 1000 lines of command history
"set suffixes+=.info,.aux,.log,.dvi,.bbl,.out,.pdf  " Files with suffix in suffixes are ignored.
set wildmode=list:longest,full  " Set completion mode.
set wildmenu
"set wildignore+=*.o
" 26 various
set virtualedit=block
set sessionoptions+=resize
set sessionoptions-=options
set sessionoptions-=localoptions
" }}}


" {{{ Locale settings
" 25 multi-byte characters
set encoding=utf-8      " Encoding used for text inside vim.
set fileencoding=utf-8  " Default encoding for new files.
set termencoding=utf-8  " Terminal's encoding.
" Automatic file encoding recognition.
" Test is done from first encoding to last one.
" If test success then test stops. Therefore more special encodings come
" first. So 'euc-jp' is last position.
" 'utf-8'が先頭に有ってもcp932とeuc-jpのファイルはちゃんとそれと識別されるようだ。
" しかし、iso-2022-jpは識別されないので、先頭に置く。
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp,utf-16le,utf-16
set ambiwidth=double
" }}}


" {{{ pathogen.vim
call pathogen#runtime_append_all_bundles()
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


" {{{ skk.vim
let skk_large_jisyo = '/usr/share/skk/SKK-JISYO.L'
let skk_auto_save_jisyo = 1
let skk_show_annnotation = 1
let skk_use_face = 1
let skk_keyboard_layout = 'act'
let skk_control_j_key = '<C-j>'
" }}}


" {{{ gist.vim
let g:github_user = "yuttie"
let g:github_token = "892f7d05807089d96554f0825c37e912"
let g:gist_browser_command ='chromium %URL%'
" }}}


" {{{ Syntax highlighting settings
" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  colorscheme lucius
endif
" }}}


" {{{ Terminal
if has('mouse')
  set mouse=a
endif
" }}}


" {{{ Filetype plugin settings
" Enable plugin-provided filetype settings, but only if the ftplugin
" directory exists (which it won't on livecds, for example).
if isdirectory(expand("$VIMRUNTIME/ftplugin"))
  filetype plugin on
  filetype indent on
endif
" }}}


" {{{ Template insertion
let template_dir = "~/.vim/template"
function InsertTemplate()
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
function FillTemplatePlaceHolders()
    silent! %s/%HEADERNAME%/\=toupper(tr(expand("%:t"), ".", "_"))/g
endfunction
if has("autocmd")
    autocmd! BufNewFile * call InsertTemplate()
endif
" }}}


" {{{ Mapping
nnoremap P Pg;
"nnoremap n nzz
"nnoremap N Nzz
"nnoremap * *zz
"nnoremap # #zz
"nnoremap g* g*zz
"nnoremap g# g#zz
nnoremap <C-k> :redraw!<CR>
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
map! <C-a> <Home>
map! <C-d> <Del>
map! <C-e> <End>
map! <C-f> <Right>
map! <C-b> <Left>
map <C-F12> :!ctags --recurse --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
" }}}


" {{{ Functions
function MakeAllWindowsEqualSize()
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
function EditHeaderAndSourceFileInNewTab(filename)
    execute 'tab vsplit ' . a:filename . '.c'
    execute 'vsplit ' . a:filename . '.h'
endfunction
function SearchEOW(word)
    let browser = "chromium"
    let url = "http://eow.alc.co.jp/" . a:word . "/UTF-8/"
    execute "silent ! " . browser . " " . url . " >/dev/null 2>&1"
    redraw!
endfunction
" }}}


" {{{ Commands
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
command! -nargs=1 Eow call SearchEOW("<args>")
command! -nargs=1 E Eow <args>
if has("gui_running")
    command! Enlarge16 set guifont=monospace\ 16
    command! Enlarge32 set guifont=monospace\ 32
    command! Enlarge64 set guifont=monospace\ 64
    command! Enlarge128 set guifont=monospace\ 128
endif
" }}}
map <silent> <M-d> :Eow <cword><CR>


"
" {{{ Plugins
"
" {{{ neocomplcache.vim }}}
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1


" {{{ quickrun
let g:quickrun_config = {}
let g:quickrun_config.markdown = {
\   'exec': ['%c %o %s %a -o /tmp/quickrun.markdown.html',
\            'chromium /tmp/quickrun.markdown.html'],
\   'output': '_'}
" }}}


" {{{ quickrun
let g:Align_xstrlen = 3
" }}}


" {{{ Markdown
autocmd BufNewFile,BufRead *.{md,mkd,mkdn,mark*} set filetype=markdown
" }}}


" {{{ C/C++
" <<< OmniCppComplete >>>
" Hotkey to generate ctags database for C/C++ supporting OmniCppComplete
"autocmd FileType c,cpp map <buffer> <C-F12> :!ctags --recurse --languages=C,C++ --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" Close preview window automatically.
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" }}}


" {{{ Ruby
autocmd FileType ruby,eruby set shiftwidth=2
" <<< refe.vim >>>
autocmd FileType ruby,eruby nnoremap <buffer> <silent> K :Refe <cword><CR>
autocmd FileType ruby,eruby nnoremap <buffer> <silent> <C-K> :Refe<CR>
" }}}


" {{{ Java
" <<< javacomplete plugin: Omni Completion for JAVA >>>
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
autocmd FileType java inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
autocmd FileType java inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>
" Java ctags database
"autocmd FileType java map <buffer> <C-F12> :!ctags -R --languages=Java --fields=+iaS --extra=+q .<CR>
" }}}


" {{{ Haskell
" <<< Haskell mode >>>
autocmd Bufenter *.hs compiler ghc
let g:haddock_browser = "chromium"
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

"autocmd FileType tex set indentkeys-=}

" Maps
autocmd FileType tex nnoremap <Leader>cc :silent! call Tex_RunLaTeX()<CR>
autocmd FileType tex nnoremap <Leader>vv :silent! call Tex_ViewLaTeX()<CR>
autocmd FileType tex nnoremap <Leader>ss :silent! call Tex_ForwardSearchLaTeX()<CR>
autocmd FileType tex nnoremap <silent> ,l :execute ":silent !rake"<CR>
" 次の行は autocmd 化しない。
" IMAP_JumpForward のマッピングが事前に行われていない場合、
" Latex-Suite は <C-j> に対して IMAP_JumpForward のマッピングを行う。
" その為、どのファイルが読み込まれた場合でも IMAP_JumpForward が何かしらの
" キーにマップされているようにする必要がある。
" 関連URL: http://vim-latex.sourceforge.net/documentation/latex-suite/latex-suite-maps.html
imap <C-space> <Plug>IMAP_JumpForward
" }}}


" {{{ Context Free
augroup filetypedetect
autocmd BufNewFile,BufRead *.cfdg setf cfdg
augroup END
" }}}


" {{{ MetaPost
autocmd FileType mp map <buffer> <Leader>cc :!mpost %<CR><CR>
" }}}


" {{{ Waf
autocmd BufRead,BufNewFile wscript setfiletype python
" }}}
