-- {{{ $PATH
vim.env.PATH = vim.fn.expand('~/.local/bin') .. ':' .. vim.fn.expand('~/.cargo/bin') .. ':' .. vim.env.PATH
-- }}}


-- {{{ Plugins
-- Execute the following commands first:
--   curl -O https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
--   sh ./installer.sh <my_plugin_dir>
local my_plugin_dir = vim.fn.expand('~/.config/nvim/bundle')

-- Prevent default plugins from being loaded
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1

-- dein Scripts-----------------------------
-- Required:
vim.opt.runtimepath:append(my_plugin_dir .. '/repos/github.com/Shougo/dein.vim')

-- Required:
if vim.fn['dein#load_state'](my_plugin_dir) == 1 then
  vim.fn['dein#begin'](my_plugin_dir)

  -- Let dein manage dein
  -- Required:
  vim.fn['dein#add'](my_plugin_dir .. '/repos/github.com/Shougo/dein.vim')

  -- Plugins
  vim.fn['dein#add']('AndrewRadev/linediff.vim', {
    on_cmd = {
      'Linediff',
      'LinediffReset',
      'LinediffAdd',
      'LinediffShow',
      'LinediffLast',
      'LinediffMerge',
      'LinediffPick',
    },
  })
  vim.fn['dein#add']('dkarter/bullets.vim')
  vim.fn['dein#add']('easymotion/vim-easymotion', {
    on_map = {
      '<Plug>(easymotion-fl)',
      '<Plug>(easymotion-Fl)',
      '<Plug>(easymotion-tl)',
      '<Plug>(easymotion-Tl)',
      '<Plug>(easymotion-linebackward)',
      '<Plug>(easymotion-j)',
      '<Plug>(easymotion-k)',
      '<Plug>(easymotion-lineforward)',
      '<Plug>(easymotion-bd-f)',
      '<Plug>(easymotion-overwin-f)',
      '<Plug>(easymotion-bd-w)',
      '<Plug>(easymotion-overwin-w)',
      '<Plug>(easymotion-bd-jk)',
      '<Plug>(easymotion-overwin-line)',
    },
  })  -- optionally depends on 'tpope/vim-repeat'
  vim.fn['dein#add']('tpope/vim-repeat')
  vim.fn['dein#add']('haya14busa/vim-asterisk')
  vim.fn['dein#add']('haya14busa/incsearch.vim', {
    on_map = {
      '<Plug>(incsearch-forward)',
      '<Plug>(incsearch-stay)',
    },
  })
  vim.fn['dein#add']('itchyny/vim-cursorword')
  vim.fn['dein#add']('junegunn/vim-easy-align', {
    on_map = {
      '<Plug>(EasyAlign)',
    },
  })
  vim.fn['dein#add']('kana/vim-repeat')
  vim.fn['dein#add']('kana/vim-operator-user')
  vim.fn['dein#add']('kana/vim-textobj-user')
  vim.fn['dein#add']('rhysd/vim-textobj-anyblock')
  vim.fn['dein#add']('Konfekt/FastFold')
  vim.fn['dein#add']('lambdalisue/suda.vim')
  vim.fn['dein#add']('lambdalisue/vim-unified-diff')
  vim.fn['dein#add']('norcalli/nvim-colorizer.lua')
  vim.fn['dein#add']('simnalamburt/vim-mundo')
  vim.fn['dein#add']('ntpeters/vim-better-whitespace')
  vim.fn['dein#add']('rhysd/vim-operator-surround', {
    on_map = {
      '<Plug>(operator-surround-append)',
      '<Plug>(operator-surround-delete)',
      '<Plug>(operator-surround-replace)',
    },
  })  -- depends on 'kana/vim-operator-user'
  vim.fn['dein#add']('Shougo/context_filetype.vim')
  vim.fn['dein#add']('Shougo/vinarise')
  vim.fn['dein#add']('t9md/vim-choosewin', {
    on_map = {
      '<Plug>(choosewin)',
    },
  })
  vim.fn['dein#add']('terryma/vim-expand-region', {
    on_map = {
      '<Plug>(expand_region_expand)',
      '<Plug>(expand_region_shrink)',
    },
  })
  vim.fn['dein#add']('mg979/vim-visual-multi')
  vim.fn['dein#add']('numToStr/Comment.nvim')
  vim.fn['dein#add']('tyru/open-browser.vim', {
    on_map = {
      '<Plug>(openbrowser-smart-search)',
    },
  })
  vim.fn['dein#add']('lukas-reineke/indent-blankline.nvim')
  vim.fn['dein#add']('yuttie/comfortable-motion.vim')

  -- UI enhancements
  vim.fn['dein#add']('machakann/vim-highlightedyank')
  vim.fn['dein#add']('chrisbra/NrrwRgn')
  vim.fn['dein#add']('folke/zen-mode.nvim')
  vim.fn['dein#add']('kyazdani42/nvim-tree.lua')

  -- LSP
  vim.fn['dein#add']('neovim/nvim-lspconfig')
  -- Auto-completion
  vim.fn['dein#add']('hrsh7th/cmp-nvim-lsp')
  vim.fn['dein#add']('hrsh7th/cmp-buffer')
  vim.fn['dein#add']('hrsh7th/cmp-path')
  vim.fn['dein#add']('hrsh7th/cmp-cmdline')
  vim.fn['dein#add']('hrsh7th/nvim-cmp')
  -- Snippets
  vim.fn['dein#add']('hrsh7th/cmp-vsnip')
  vim.fn['dein#add']('hrsh7th/vim-vsnip')

  -- Interactive filter
  vim.fn['dein#add']('nvim-telescope/telescope.nvim')
  vim.fn['dein#add']('nvim-telescope/telescope-fzf-native.nvim', {
    build = 'make',
  })

  --
  -- Tree-sitter
  --
  vim.fn['dein#add']('nvim-treesitter/nvim-treesitter', {
    hook_post_update = 'TSUpdate',
  })
  vim.fn['dein#add']('nvim-treesitter/nvim-treesitter-refactor')
  vim.fn['dein#add']('nvim-treesitter/nvim-treesitter-textobjects')
  vim.fn['dein#add']('p00f/nvim-ts-rainbow')
  vim.fn['dein#add']('andymass/vim-matchup')
  vim.fn['dein#add']('windwp/nvim-ts-autotag')
  vim.fn['dein#add']('JoosepAlviste/nvim-ts-context-commentstring')
  vim.fn['dein#add']('lewis6991/spellsitter.nvim')
  vim.fn['dein#add']('folke/twilight.nvim')
  vim.fn['dein#add']('windwp/nvim-autopairs')

  --
  -- Plugins for Languages
  --
  -- Crystal
  vim.fn['dein#add']('vim-crystal/vim-crystal')

  -- fish shell
  vim.fn['dein#add']('dag/vim-fish')

  -- Gentoo
  vim.fn['dein#add']('gentoo/gentoo-syntax')  -- ftdetect, ftplugin, indent, plugin, syntax

  -- Git
  vim.fn['dein#add']('jreybert/vimagit')
  vim.fn['dein#add']('itchyny/vim-gitbranch')
  vim.fn['dein#add']('nvim-lua/plenary.nvim')  -- Required by: gitsigns.nvim, telescope.nvim
  vim.fn['dein#add']('lewis6991/gitsigns.nvim')
  vim.fn['dein#add']('lambdalisue/gina.vim', {
    on_cmd = {
      'Gina',
    },
  })
  vim.fn['dein#add']('tpope/vim-fugitive')
  vim.fn['dein#add']('hotwatermorning/auto-git-diff')

  -- i3
  vim.fn['dein#add']('PotatoesMaster/i3-vim-syntax')  -- syntax, ftplugin

  -- jq
  vim.fn['dein#add']('vito-c/jq.vim')  -- ftdetect, ftplugin, syntax

  -- Julia
  vim.fn['dein#add']('JuliaEditorSupport/julia-vim')

  -- nginx
  vim.fn['dein#add']('nginx/nginx', {
    rtp = 'contrib/vim',
  })  -- ftdetect, ftplugin, indent, syntax

  -- Text
  vim.fn['dein#add']('rhysd/vim-grammarous')

  -- tmux
  vim.fn['dein#add']('tmux-plugins/vim-tmux')

  -- TypeScript
  vim.fn['dein#add']('leafgarland/typescript-vim')

  -- Web/HTML
  vim.fn['dein#add']('mattn/emmet-vim', {
    on_ft = {'html', 'xml', 'php'},
  })

  -- Web/Vue
  vim.fn['dein#add']('posva/vim-vue')

  -- Markdown
  vim.fn['dein#add']('godlygeek/tabular', {
    on_cmd = {
      'AddTabularPattern',
      'AddTabularPipeline',
      'Tabularize',
      'GTabularize',
    },
  })
  vim.fn['dein#add']('iamcco/markdown-preview.nvim', {
    on_ft = {'markdown', 'pandoc.markdown', 'rmd'},
    build = 'sh -c "cd app & yarn install"',
  })

  -- AsciiDoc
  vim.fn['dein#add']('mjakl/vim-asciidoc', {
    on_ft = 'asciidoc',
  })

  -- reStructuredText
  vim.fn['dein#add']('Rykka/riv.vim', {
    on_ft = 'rst',
  })

  -- GnuPG
  vim.fn['dein#add']('jamessan/vim-gnupg', {
    rev = 'main',
  })

  -- Themes
  vim.fn['dein#add']('itchyny/lightline.vim')
  vim.fn['dein#add']('ryanoasis/vim-devicons')    -- This must be loaded after its supported plugins
  vim.fn['dein#add']('kyazdani42/nvim-web-devicons')
  vim.fn['dein#add']('romgrk/barbar.nvim')
  vim.fn['dein#add']('yuttie/hydrangea-vim', {
    rev = 'develop',
  })
  vim.fn['dein#add']('yuttie/inkstained-vim')
  vim.fn['dein#add']('yuttie/snowy-vim')
  vim.fn['dein#add']('cocopon/iceberg.vim')
  vim.fn['dein#add']('arcticicestudio/nord-vim', {
    rev = 'master',
  })

  -- Required:
  vim.fn['dein#end']()
  vim.fn['dein#save_state']()
end

-- Required:
vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

-- Personal access token for GitHub
vim.g['dein#install_github_api_token'] = ''

-- If you want to install not installed plugins on startup.
if vim.fn['dein#check_install']() == 1 then
  vim.fn['dein#install']()
end

-- End dein Scripts-------------------------
-- }}}


-- {{{ Options
-- 2 moving around, searching and patterns
vim.opt.incsearch = true
vim.opt.inccommand = 'nosplit'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = false
vim.opt.cursorline = true

-- 4 displaying text
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 3
vim.opt.signcolumn = 'yes'
vim.opt.wrap = false

-- 6 multiple windows
vim.opt.hidden = true        -- You can change buffer without saving.
vim.opt.laststatus = 2  -- Always show status lines.
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.statusline = "%<%f %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%{exists('*SkkGetModeStr')?SkkGetModeStr():''}%=%l,%c%V%8P"

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
vim.opt.smartindent = true   -- Use smart indenting.
vim.opt.smarttab = true
vim.opt.cinoptions = { ':0', 'g0' }

-- 16 folding
vim.opt.foldlevelstart = 99

-- 19 reading and writing files
vim.opt.modeline = false
vim.opt.fileformats = { 'unix', 'dos' }
vim.opt.backup = true

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
vim.opt.ambiwidth = 'double'

-- 26 various
vim.cmd('set sessionoptions&')
vim.opt.lazyredraw = true

-- Enable mouse
vim.opt.mouse = 'a'

-- }}}


vim.cmd [=[
" Autocommand group
augroup MyAutoCmds
  autocmd!
augroup end

" Reset ibus-skk to the direct input mode when leave the insert mode
autocmd MyAutoCmds InsertLeave * call system('ibus engine skk')

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
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set background=light
  colorscheme iceberg
endif

function! s:my_colorscheme_adjustments() abort
  highlight SpellBad term=underline cterm=undercurl ctermfg=red gui=undercurl guifg=red
endfunction
autocmd MyAutoCmds VimEnter * call s:my_colorscheme_adjustments()
autocmd MyAutoCmds ColorScheme * call s:my_colorscheme_adjustments()
]=]

-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "all",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  indent = {
    enable = true,
  },

  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },

  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
        },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },

  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },

  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    -- [options]
  },

  autotag = {
    enable = true,
  },

  context_commentstring = {
    enable = true,
  },
}

vim.cmd [=[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]=]

-- lewis6991/spellsitter.nvim
require('spellsitter').setup {
  -- Whether enabled, can be a list of filetypes, e.g. {'python', 'lua'}
  enable = true,

  -- Spellchecker to use. values:
  -- * vimfn: built-in spell checker using vim.fn.spellbadword()
  -- * ffi: built-in spell checker using the FFI to access the
  --   internal spell_check() function
  spellchecker = 'vimfn',
}

-- folke/twilight.nvim
require("twilight").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

-- windwp/nvim-autopairs
require('nvim-autopairs').setup {
}

-- }}}


vim.cmd [=[
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


" {{{ Neovide
set guifont=monospace:h10
let g:neovide_cursor_vfx_mode = "railgun"
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
inoremap <C-s> <C-d>

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

nnoremap <C-Left>  <C-w>h
nnoremap <C-Right> <C-w>l
nnoremap <C-Up>    <C-w>k
nnoremap <C-Down>  <C-w>j

nnoremap <S-Left>  <C-w>><CR>
nnoremap <S-Right> <C-w><<CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-i> <C-g>

nnoremap <F8>  :split \| execute 'lcd' fnamemodify(resolve(expand('%:p')), ':h') \| terminal<CR>

" command
cmap w!! w !sudo tee > /dev/null %
cnoremap <C-x> <C-r>=expand('%:p')<CR>

" terminal
tnoremap <Esc> <C-\><C-n>

" Space-prefixed bindings
nnoremap [help] <Nop>
nmap     [Space]h [help]

nnoremap [plugin] <Nop>
nmap     [Space]P [plugin]
nnoremap <silent> [plugin]P :call dein#check_update(v:true)<CR>
nnoremap <silent> [plugin]i :call dein#install()<CR>
nnoremap <silent> [plugin]c :echo dein#check_clean() <Bar> call map(dein#check_clean(), "delete(v:val, 'rf')") <Bar> call dein#recache_runtimepath() <Bar> echo "Cleaned up."<CR>

nnoremap [file] <Nop>
nmap     [Space]f [file]
nnoremap <silent> [file]vd :tab vsplit $MYVIMRC<CR>
nnoremap <silent> [file]vR :source $MYVIMRC<CR>
nnoremap <silent> [file]s  :w<CR>
nnoremap <silent> [file]S  :wa<CR>
nnoremap <silent> [file]t  :NvimTreeToggle<CR>
nnoremap          [file]R  :Rename<Space>

nnoremap [search] <Nop>
nmap     [Space]s [search]

nnoremap [buffer] <Nop>
nmap     [Space]b [buffer]
nnoremap <silent> [buffer]n :bn<CR>
nnoremap <silent> [buffer]p :bp<CR>
nnoremap <silent> [buffer]d :bd<CR>

nnoremap [error] <Nop>
nmap     [Space]e [error]
nnoremap <silent> [error]e :<C-u>CocList diagnostics<CR>
nmap     <silent> [error]n <Plug>(coc-diagnostic-next)
nmap     <silent> [error]p <Plug>(coc-diagnostic-prev)

nnoremap [coc] <Nop>
nmap     [Space]C [coc]
nmap              [coc]r  <Plug>(coc-rename)
nmap              [coc]f  <Plug>(coc-format-selected)
xmap              [coc]f  <Plug>(coc-format-selected)
nmap              [coc]a  <Plug>(coc-codeaction-selected)
xmap              [coc]a  <Plug>(coc-codeaction-selected)
nmap              [coc]ac <Plug>(coc-codeaction)
nmap              [coc]F  <Plug>(coc-fix-current)
nnoremap <silent> [coc]E  :<C-u>CocList extensions<CR>
nnoremap <silent> [coc]:  :<C-u>CocList commands<cr>


nnoremap [toggle] <Nop>
nmap     [Space]t [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]w :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]n :setl number!<CR>:setl number?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>
nnoremap <silent> [toggle]z :ZenMode<CR>
]=]

-- Commenting
vim.api.nvim_set_keymap('n', '[comment]', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('x', '[comment]', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '[Space]c', '[comment]', {})
vim.api.nvim_set_keymap('x', '[Space]c', '[comment]', {})
require('Comment').setup({
    ---LHS of toggle mappings in NORMAL + VISUAL mode
    ---@type table
    toggler = {
        ---Line-comment toggle keymap
        line = '[comment]c',
    },

    ---LHS of operator-pending mappings in NORMAL + VISUAL mode
    ---@type table
    opleader = {
        ---Line-comment keymap
        line = '[comment]',
    },

    ---LHS of extra mappings
    ---@type table
    extra = {
        ---Add comment on the line above
        above = '[comment]O',
        ---Add comment on the line below
        below = '[comment]o',
        ---Add comment at the end of line
        eol = '[comment]A',
    },

    ---@param ctx Ctx
    pre_hook = function(ctx)
        -- Only calculate commentstring for tsx filetypes
        if vim.bo.filetype == 'typescriptreact' then
            local U = require('Comment.utils')

            -- Detemine whether to use linewise or blockwise commentstring
            local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'

            -- Determine the location where to calculate commentstring from
            local location = nil
            if ctx.ctype == U.ctype.block then
                location = require('ts_context_commentstring.utils').get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                location = require('ts_context_commentstring.utils').get_visual_start_location()
            end

            return require('ts_context_commentstring.internal').calculate_commentstring({
                key = type,
                location = location,
            })
        end
    end,
})

vim.cmd [=[
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

nnoremap <silent> [jump]o :<C-u>CocList outline<CR>

nnoremap [quit] <Nop>
nmap     [Space]q [quit]
nnoremap <silent> [quit]q :confirm qall<CR>

" close a help window by `q'
autocmd MyAutoCmds FileType help,ref-pydoc nnoremap <buffer><silent> q :close<CR>
" }}}


" {{{ Template insertion
let template_dir = "~/.config/nvim/template"
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


" {{{ nvim-web-devicons
lua <<EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
EOF
" }}}


" {{{ barbar.nvim
lua <<EOF
-- Set barbar's options
vim.g.bufferline = {
  -- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Excludes buffers from the tabline
  exclude_ft = {},
  exclude_name = {},

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = true,

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', ':BufferPrevious<CR>', opts)
map('n', '<A-.>', ':BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
map('n', '<A-0>', ':BufferLast<CR>', opts)
-- Close buffer
map('n', '<A-c>', ':BufferClose<CR>', opts)
-- Magic buffer-picking mode
map('n', '<C-p>', ':BufferPick<CR>', opts)
EOF
" }}}


" {{{ norcalli/nvim-colorizer.lua
lua <<EOF
require'colorizer'.setup({
  '*';
}, {
  RGB      = true;         -- #RGB hex codes
  RRGGBB   = true;         -- #RRGGBB hex codes
  names    = true;         -- "Name" codes like Blue
  RRGGBBAA = true;         -- #RRGGBBAA hex codes
  rgb_fn   = true;         -- CSS rgb() and rgba() functions
  hsl_fn   = true;         -- CSS hsl() and hsla() functions
  css      = true;         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  css_fn   = true;         -- Enable all CSS *functions*: rgb_fn, hsl_fn
  -- Available modes: foreground, background
  mode     = 'background'; -- Set the display mode.
})
EOF
" }}}


" {{{ lightline.vim
set ambiwidth=single
set noshowmode

let g:lightline = {
      \ 'enable': {
      \   'statusline': 1,
      \   'tabline': 0,
      \ },
      \ 'colorscheme': 'iceberg',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'git_branch', 'readonly', 'relativepath', 'modified' ],
      \     [ 'treesitter', 'cocstatus' ],
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
      \     [ 'treesitter', 'cocstatus' ],
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
      \   'treesitter':  'g:lightline.my.treesitter',
      \   'cwd':         'getcwd',
      \   'cocstatus':   'coc#status',
      \ },
      \ 'separator':    { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }

let g:lightline.my = {}

function! g:lightline.my.layout_init()
  let g:lightline.my.layout_levels = {
    \   'relativepath': 3,
    \   'filetype': 2,
    \   'fileformat': 2,
    \   'git_branch': 1,
    \   'treesitter': 10,
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
    \   'let g:lightline.my.layout_levels.treesitter = 9',
    \   'let g:lightline.my.layout_levels.treesitter = 8',
    \   'let g:lightline.my.layout_levels.treesitter = 7',
    \   'let g:lightline.my.layout_levels.treesitter = 6',
    \   'let g:lightline.my.layout_levels.treesitter = 5',
    \   'let g:lightline.my.layout_levels.treesitter = 4',
    \   'let g:lightline.my.layout_levels.treesitter = 3',
    \   'let g:lightline.my.layout_levels.treesitter = 2',
    \   'let g:lightline.my.layout_levels.treesitter = 1',
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
autocmd MyAutoCmds User CocStatusChange,CocDiagnosticChange call lightline#update()

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

function! g:lightline.my.treesitter_level(level)
  return nvim_treesitter#statusline(10 * a:level)
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

function! g:lightline.my.treesitter()
  return g:lightline.my.treesitter_level(g:lightline.my.layout_levels.treesitter)
endfunction
" }}}


" {{{ itchyny/vim-parenmatch
let g:parenmatch_highlight = 0
function! s:my_parenmatch_highlight() abort
  highlight ParenMatch term=underline,bold cterm=underline,bold gui=underline,bold
endfunction
autocmd MyAutoCmds VimEnter * call s:my_parenmatch_highlight()
autocmd MyAutoCmds ColorScheme * call s:my_parenmatch_highlight()
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


" {{{ lukas-reineke/indent-blankline.nvim
lua <<EOF
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    space_char_blankline = " ",
}
EOF
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
]=]


-- {{{ kyazdani42/nvim-tree.lua
vim.api.nvim_set_keymap('', 'y', '<Plug>(highlightedyank)', {})
-- }}}


-- {{{ kyazdani42/nvim-tree.lua
require('nvim-tree').setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
-- }}}


-- {{{ haya14busa/vim-asterisk
vim.api.nvim_set_keymap('', '*',  '<Plug>(asterisk-z*)', {})
vim.api.nvim_set_keymap('', '#',  '<Plug>(asterisk-z#)', {})
vim.api.nvim_set_keymap('', 'g*', '<Plug>(asterisk-gz*)', {})
vim.api.nvim_set_keymap('', 'g#', '<Plug>(asterisk-gz#)', {})
vim.g['asterisk#keeppos'] = 1
-- }}}


-- {{{ incsearch.vim
vim.api.nvim_set_keymap('', '/', '<Plug>(incsearch-forward)', {})
vim.api.nvim_set_keymap('', '?', '<Plug>(incsearch-stay)', {})
vim.g['incsearch#magic'] = '\v'
-- }}}


-- {{{ rhysd/vim-operator-surround
vim.api.nvim_set_keymap('n', 'sa', '<Plug>(operator-surround-append)', { silent = true })
vim.api.nvim_set_keymap('v', 'sa', '<Plug>(operator-surround-append)', { silent = true })
vim.api.nvim_set_keymap('n', 'sd', '<Plug>(operator-surround-delete)a', { silent = true })
vim.api.nvim_set_keymap('n', 'sc', '<Plug>(operator-surround-replace)a', { silent = true })
vim.api.nvim_set_keymap('n', 'sD', '<Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)', { silent = true })
vim.api.nvim_set_keymap('n', 'sC', '<Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)', { silent = true })
-- }}}


vim.cmd [=[
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

nnoremap [git]    <Nop>
nmap     <C-g>    [git]
nmap     [Space]g [git]

nnoremap <silent> [git]c  :Gina commit -v --opener="topleft vsplit"<CR>
nnoremap <silent> [git]d  :Gvdiff<CR>
nnoremap <silent> [git]m  :Magit<CR>
" }}}
]=]


-- {{{ lewis6991/gitsigns.nvim
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '▊', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '▊', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '▁', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '▔', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n [git]<C-n>'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
    ['n [git]<C-p>'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},

    ['n [git]s'] = '<cmd>Gitsigns stage_hunk<CR>',
    ['v [git]s'] = ':Gitsigns stage_hunk<CR>',
    ['n [git]u'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
    ['n [git]r'] = '<cmd>Gitsigns reset_hunk<CR>',
    ['v [git]r'] = ':Gitsigns reset_hunk<CR>',
    ['n [git]R'] = '<cmd>Gitsigns reset_buffer<CR>',
    ['n [git]p'] = '<cmd>Gitsigns preview_hunk<CR>',
    ['n [git]b'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
    ['n [git]S'] = '<cmd>Gitsigns stage_buffer<CR>',
    ['n [git]U'] = '<cmd>Gitsigns reset_buffer_index<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
    ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'
  },
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
-- }}}


-- {{{ nvim-telescope/telescope.nvim
vim.api.nvim_set_keymap('n', '[buffer]b', '<cmd>Telescope buffers<CR>',                   { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[file]f',   '<cmd>Telescope find_files<CR>',                { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[file]r',   '<cmd>Telescope oldfiles<CR>',                  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[git]f',    '<cmd>Telescope git_files<CR>',                 { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[help]h',   '<cmd>Telescope help_tags<CR>',                 { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[help]dc',  '<cmd>Telescope commands<CR>',                  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[help]dm',  '<cmd>Telescope keymaps<CR>',                   { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[help]dC',  '<cmd>Telescope colorscheme<CR>',               { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[search]s', '<cmd>Telescope current_buffer_fuzzy_find<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[search]g', '<cmd>Telescope live_grep<CR>',                 { noremap = true, silent = true })
-- }}}


-- {{{ neovim/nvim-lspconfig & hrsh7th/nvim-cmp
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  })
})

-- Setup lspconfig.
do
  local lspconfig = require('lspconfig')
  local util = require('lspconfig/util')
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  local path = util.path

  local function get_python_path(workspace)
    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then
      return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
    end

    -- Use virtualenv managed by poetry.
    local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
    if match ~= '' then
      local venv = vim.fn.trim(vim.fn.system('poetry env info -p'))
      return path.join(venv, 'bin', 'python')
    end

    -- Fallback to system Python.
    return exepath('python3') or exepath('python') or 'python'
  end

  -- Servers
  -- * pyright:  yarn global add pyright
  -- * bashls:   yarn global add bash-language-server
  -- * ccls:     emerge dev-util/ccls, pacman -S community/ccls
  -- * cssls:    yarn global add vscode-langservers-extracted
  -- * dockerls: yarn global add dockerfile-language-server-nodejs
  -- * eslint:   yarn global add vscode-langservers-extracted
  -- * html:     yarn global add vscode-langservers-extracted
  -- * sqlls:    yarn global add sql-language-server
  -- * texlab:   cargo install --git https://github.com/latex-lsp/texlab.git --locked
  -- * tsserver: yarn global add typescript-language-server
  -- * vimls:    yarn global add vim-language-server
  -- * vuels:    yarn global add vls
  lspconfig['pyright'].setup {
    capabilities = capabilities,
    before_init = function(_, config)
      config.settings.python.pythonPath = get_python_path(config.root_dir)
    end,
  }
  local servers = {
    'bashls',
    'ccls',
    'cssls',
    'dockerls',
    'eslint',
    'html',
    'sqlls',
    'texlab',
    'tsserver',
    'vimls',
    'vuels',
  }
  for _, server in ipairs(servers) do
    lspconfig[server].setup {
      capabilities = capabilities,
    }
  end
end
-- }}}


vim.cmd [=[
" {{{ rhysd/vim-grammarous
nmap <F5> <Plug>(grammarous-move-to-next-error)
nnoremap [grammarous]    <Nop>
nmap     [Space]G [grammarous]

nnoremap [grammarous]G  :GrammarousCheck<CR>
nmap     [grammarous]n  <Plug>(grammarous-move-to-next-error)
nmap     [grammarous]p  <Plug>(grammarous-move-to-previous-error)
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
let g:markdown_fenced_languages = ['cpp', 'ruby', 'json']
let g:markdown_syntax_conceal = 0
nnoremap [markdown]  <Nop>
xnoremap [markdown]  <Nop>
nmap     [Space]m    [markdown]
xmap     [Space]m    [markdown]
nmap     [markdown]f :TableFormat<CR>
xmap     [markdown]f :TableFormat<CR>
nmap     [markdown]p :MarkdownPreview<CR>  " From iamcco/markdown-preview.nvim
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
" Add environments from amsmath package
autocmd MyAutoCmds FileType tex call TexNewMathZone('MY-A', 'equation', 1)
autocmd MyAutoCmds FileType tex call TexNewMathZone('MY-B', 'align',    1)
autocmd MyAutoCmds FileType tex call TexNewMathZone('MY-C', 'gather',   1)
autocmd MyAutoCmds FileType tex call TexNewMathZone('MY-D', 'alignat',  1)
autocmd MyAutoCmds FileType tex call TexNewMathZone('MY-E', 'multline', 1)
autocmd MyAutoCmds FileType tex call TexNewMathZone('MY-F', 'flalign',  1)
autocmd MyAutoCmds FileType tex call TexNewMathZone('MY-G', 'split',    0)

let g:tex_conceal = ""
let g:vimtex_compiler_progname = "nvr"
autocmd MyAutoCmds FileType tex setlocal shiftwidth=2
autocmd MyAutoCmds FileType bib setlocal shiftwidth=2
" }}}


" {{{ Shell Scripts
autocmd MyAutoCmds FileType sh,csh,fish,tcsh,zsh setlocal shiftwidth=2
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


" {{{ Elm
autocmd MyAutoCmds FileType elm setlocal shiftwidth=2
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
]=]
