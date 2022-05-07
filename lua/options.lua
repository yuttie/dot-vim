-- 2 moving around, searching and patterns
vim.opt.incsearch = true
vim.opt.inccommand = 'nosplit'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = false
vim.opt.cursorline = true

-- 4 displaying text
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.scrolloff = 3
vim.opt.signcolumn = 'yes'
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.breakindentopt = { 'shift:2' }
vim.opt.showbreak = '>> '

-- 6 multiple windows
vim.opt.hidden = true        -- You can change buffer without saving.
vim.opt.laststatus = 2  -- Always show status lines.
vim.opt.showcmd = true
vim.opt.cmdheight = 2

-- 7 multiple tab pages
vim.opt.showtabline = 2
vim.opt.tabpagemax = 100

-- 11 printing
vim.opt.printencoding = 'utf-8'
vim.opt.printmbcharset = 'JIS_X_1990'
vim.opt.printfont = 'monospace 10'
vim.cmd('set printoptions&')
vim.opt.printoptions:append({ number = 'y' })
vim.opt.printmbfont = 'r:GothicBBB-Medium'

-- 12 messages and info
vim.cmd('set shortmess&')
vim.opt.shortmess:append({ I = true })  -- Shortens messages to avoid 'press a key' prompt.
vim.opt.ruler = true       -- Show the cursor position all the time.
vim.opt.title = true

-- 14 editing text
vim.opt.backspace = { 'indent', 'eol', 'start' }  -- Allow backspacing over everything in insert mode.
vim.cmd('set formatoptions&')
vim.opt.formatoptions:append({ m = true, M = true })

-- 15 tabs and indenting
vim.opt.expandtab = true     -- Use white-space instead of tabs.
vim.opt.shiftwidth = 4  -- Set indent width on autoindent.
vim.opt.shiftround = true
vim.opt.autoindent = true    -- Always set auto-indenting on.
vim.opt.smartindent = false   -- If this option is enabled, '>>' doesn't work with comments starting with #
vim.opt.smarttab = true
vim.opt.cinoptions = { ':0', 'g0' }

-- 16 folding
vim.opt.foldlevelstart = 99

-- 19 reading and writing files
vim.opt.modeline = false
vim.opt.fileformats = { 'unix', 'dos' }
vim.opt.backup = false  -- Don't leave a backup file after the file has been successfully written.
vim.opt.writebackup = true  -- Hold a backup only while the file is being written.
vim.opt.backupcopy = 'yes'  -- Necessary for correctly watching file changes, e.g. inotifywait.

-- 21 command line editing
--vim.cmd('set suffixes&')
--vim.opt.suffixes:append({ '.info', '.aux', '.log', '.dvi', '.bbl', '.out', '.pdf' })  -- Files with suffix in suffixes are ignored.
vim.opt.wildmode = 'full'  -- Set completion mode.
vim.opt.wildmenu = true
--vim.cmd('set wildignore&')
--vim.opt.wildignore:append({ '*.o' })

-- 25 multi-byte characters
vim.opt.fileencoding = 'utf-8'  -- Default encoding for new files.
-- Automatic file encoding recognition.
-- Vim tries the specified encodings in the specified order, and stops when
-- an encoding is successfully applied. Therefore widely matching encodings,
-- like 'euc-jp', should be placed at the end of fileencodings.
-- 'utf-8'が先頭に有っても'cp932'と'euc-jp'のファイルはちゃんとそれと識別される
-- ようだ。しかし'iso-2022-jp'は識別されない。
-- 'iso-2022-jp'が先頭にあると、新規ファイルのデフォルトのエンコーディングが
-- 'iso-2022-jp'になる問題があるので先頭に置くことはできない。
vim.opt.fileencodings = { 'utf-8', 'iso-2022-jp', 'cp932', 'sjis', 'euc-jp', 'utf-16le', 'utf-16' }
vim.opt.ambiwidth = 'single'

-- 26 various
vim.cmd('set sessionoptions&')
vim.opt.lazyredraw = true
vim.opt.pumblend = 10
vim.opt.diffopt = { 'internal', 'filler', 'closeoff', 'indent-heuristic', 'algorithm:histogram', 'followwrap' }
vim.opt.spelllang = { 'en_us', 'cjk' }

-- Enable mouse
vim.opt.mouse = 'a'
