-- {{{ $PATH
vim.env.PATH = vim.fn.expand('~/.local/bin') .. ':' .. vim.fn.expand('~/.cargo/bin') .. ':' .. vim.env.PATH
-- }}}


-- {{{ Plugins

-- Plugins are managed by Shougo/dein.vim.
-- Execute the following commands to setup dein.vim:
--   curl -O https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
--   sh ./installer.sh <my_plugin_dir>
local my_plugin_dir = vim.fn.expand('~/.config/nvim/bundle')

-- Prevent default plugins from being loaded
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1

-- Prevent plugins from setting default keymaps
vim.g.lightspeed_no_default_keymaps = 1

-- Add path of dein.vim to runtimepath
vim.opt.runtimepath:append(my_plugin_dir .. '/repos/github.com/Shougo/dein.vim')

-- Add plugins
if vim.fn['dein#load_state'](my_plugin_dir) == 1 then
  vim.fn['dein#begin'](my_plugin_dir)

  -- Let dein.vim manage itself
  vim.fn['dein#add'](my_plugin_dir .. '/repos/github.com/Shougo/dein.vim')

  -- Plugins

  --
  -- Edit
  --
  vim.fn['dein#add']('kana/vim-operator-user')
  vim.fn['dein#add']('kana/vim-operator-replace')
  vim.fn['dein#add']('kana/vim-textobj-user')
  vim.fn['dein#add']('rhysd/vim-textobj-anyblock', {
    on_map = {
      '<Plug>(textobj-anyblock-a)',
    },
  })
  vim.fn['dein#add']('simnalamburt/vim-mundo')
  vim.fn['dein#add']('mg979/vim-visual-multi')
  vim.fn['dein#add']('numToStr/Comment.nvim')
  vim.fn['dein#add']('chrisbra/NrrwRgn')
  vim.fn['dein#add']('folke/zen-mode.nvim')
  vim.fn['dein#add']('rhysd/vim-operator-surround', {
    on_map = {
      '<Plug>(operator-surround-append)',
      '<Plug>(operator-surround-delete)',
      '<Plug>(operator-surround-replace)',
    },
  })  -- depends on 'kana/vim-operator-user'
  vim.fn['dein#add']('terryma/vim-expand-region', {
    on_map = {
      '<Plug>(expand_region_expand)',
      '<Plug>(expand_region_shrink)',
    },
  })

  --
  -- Diff
  --
  vim.fn['dein#add']('lambdalisue/vim-unified-diff')
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

  --
  -- Text Formatting
  --
  vim.fn['dein#add']('dkarter/bullets.vim')
  vim.fn['dein#add']('tpope/vim-repeat')
  vim.fn['dein#add']('junegunn/vim-easy-align', {
    on_map = {
      '<Plug>(EasyAlign)',
    },
  })

  --
  -- Move
  --
  vim.fn['dein#add']('ggandor/lightspeed.nvim')
  vim.fn['dein#add']('phaazon/hop.nvim')
  vim.fn['dein#add']('t9md/vim-choosewin', {
    on_map = {
      '<Plug>(choosewin)',
    },
  })

  --
  -- Search
  --
  vim.fn['dein#add']('haya14busa/vim-asterisk')
  vim.fn['dein#add']('haya14busa/incsearch.vim', {
    on_map = {
      '<Plug>(incsearch-forward)',
      '<Plug>(incsearch-stay)',
    },
  })
  vim.fn['dein#add']('itchyny/vim-cursorword')
  vim.fn['dein#add']('inkarkat/vim-mark')

  --
  -- File
  --
  vim.fn['dein#add']('lambdalisue/suda.vim')
  vim.fn['dein#add']('Shougo/vinarise')
  vim.fn['dein#add']('kyazdani42/nvim-tree.lua')
  vim.fn['dein#add']('jamessan/vim-gnupg', {
    rev = 'main',
  })

  --
  -- UI enhancement
  --
  vim.fn['dein#add']('norcalli/nvim-colorizer.lua')
  vim.fn['dein#add']('ntpeters/vim-better-whitespace')
  vim.fn['dein#add']('lukas-reineke/indent-blankline.nvim')
  vim.fn['dein#add']('yuttie/comfortable-motion.vim')
  vim.fn['dein#add']('machakann/vim-highlightedyank')
  vim.fn['dein#add']('folke/which-key.nvim')

  --
  -- Terminal
  --
  vim.fn['dein#add']('voldikss/vim-floaterm')

  --
  -- Others
  --
  vim.fn['dein#add']('tyru/open-browser.vim', {
    on_map = {
      '<Plug>(openbrowser-smart-search)',
    },
  })

  --
  -- LSP
  --
  vim.fn['dein#add']('neovim/nvim-lspconfig')
  -- Auto-completion
  vim.fn['dein#add']('hrsh7th/cmp-nvim-lsp')
  vim.fn['dein#add']('hrsh7th/cmp-buffer')
  vim.fn['dein#add']('hrsh7th/cmp-path')
  vim.fn['dein#add']('hrsh7th/cmp-cmdline')
  vim.fn['dein#add']('hrsh7th/cmp-emoji')
  vim.fn['dein#add']('hrsh7th/cmp-nvim-lua')
  vim.fn['dein#add']('ray-x/cmp-treesitter')
  vim.fn['dein#add']('f3fora/cmp-spell')
  vim.fn['dein#add']('hrsh7th/nvim-cmp')
  -- Snippets
  vim.fn['dein#add']('hrsh7th/cmp-vsnip')
  vim.fn['dein#add']('hrsh7th/vim-vsnip')
  vim.fn['dein#add']('rafamadriz/friendly-snippets')
  -- Signature
  vim.fn['dein#add']('ray-x/lsp_signature.nvim')
  -- Appearance
  vim.fn['dein#add']('onsails/lspkind-nvim')

  --
  -- Interactive filter
  --
  vim.fn['dein#add']('nvim-telescope/telescope.nvim')
  vim.fn['dein#add']('nvim-telescope/telescope-fzf-native.nvim', {
    build = 'make',
  })
  vim.fn['dein#add']('nvim-telescope/telescope-file-browser.nvim')

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
  vim.fn['dein#add']('windwp/nvim-autopairs')

  --
  -- Filetype-specific plugins
  --
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

  -- nginx
  vim.fn['dein#add']('nginx/nginx', {
    rtp = 'contrib/vim',
  })  -- ftdetect, ftplugin, indent, syntax

  -- Text
  vim.fn['dein#add']('rhysd/vim-grammarous')

  -- tmux
  vim.fn['dein#add']('tmux-plugins/vim-tmux')

  -- Web/HTML
  vim.fn['dein#add']('mattn/emmet-vim', {
    on_ft = {'html', 'xml', 'php'},
  })

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

  --
  -- Themes
  --
  vim.fn['dein#add']('yuttie/hydrangea-vim', { rev = 'lualine-theme' })
  vim.fn['dein#add']('yuttie/inkstained-vim')
  vim.fn['dein#add']('yuttie/snowy-vim')
  vim.fn['dein#add']('yuttie/sublimetext-spacegray.vim')
  vim.fn['dein#add']('cocopon/iceberg.vim')
  vim.fn['dein#add']('arcticicestudio/nord-vim', {
    rev = 'master',
  })

  --
  -- UI
  --
  vim.fn['dein#add']('nvim-lualine/lualine.nvim', { depends = 'yuttie/hydrangea-vim' })
  vim.fn['dein#add']('kyazdani42/nvim-web-devicons')
  vim.fn['dein#add']('folke/lsp-colors.nvim')

  -- End of plugin list
  vim.fn['dein#end']()
  vim.fn['dein#save_state']()
end

-- Required:
vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

-- Personal access token for GitHub
do
  local io = require('io')
  local file = io.open(vim.fn.expand('~/.config/nvim/.github_api_token'), 'r')
  vim.g['dein#install_github_api_token'] = file:read('*a'):match('^%s*(.-)%s*$')
  file:close()
end

-- If you want to install not installed plugins on startup.
if vim.fn['dein#check_install']() == 1 then
  vim.fn['dein#install']()
end

-- End dein Scripts-------------------------
-- }}}


require('options')


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
endif

" Change the cursor sahpe
set guicursor=n-v-c-sm:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr-o:hor20-Cursor/lCursor

" Switch syntax highlighting on
syntax on
set background=dark
colorscheme spacegray-dark

function! s:my_colorscheme_adjustments() abort
  highlight SpellBad term=underline cterm=undercurl ctermfg=red gui=undercurl guifg=red
endfunction
autocmd MyAutoCmds VimEnter * call s:my_colorscheme_adjustments()
autocmd MyAutoCmds ColorScheme * call s:my_colorscheme_adjustments()
]=]

require('plugin-treesitter')

-- }}}


-- Extensions                                                                 {{{
-- ==============================================================================

-- {{{ Neovide
vim.opt.guifont = 'monospace:h10'
vim.g.neovide_cursor_animation_length = 0.03
vim.g.neovide_cursor_trail_length = 0.5
vim.g.neovide_cursor_vfx_mode = "railgun"
-- }}}


-- {{{ Commands
require('commands')
-- }}}


-- {{{ Mappings
-- insert
vim.api.nvim_set_keymap('i', '<C-s>', '<C-d>', { noremap = true })

-- insert and command line
vim.api.nvim_set_keymap('!', '<C-a>', '<Home>', { noremap = true })
vim.api.nvim_set_keymap('!', '<C-e>', '<End>', { noremap = true })
vim.api.nvim_set_keymap('!', '<C-b>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('!', '<C-f>', '<Right>', { noremap = true })
vim.api.nvim_set_keymap('!', '<C-d>', '<Del>', { noremap = true })
vim.api.nvim_set_keymap('!', '<M-f>', '<S-Right>', { noremap = true })
vim.api.nvim_set_keymap('!', '<M-b>', '<S-Left>', { noremap = true })

-- normal
vim.api.nvim_set_keymap('n', 'j',   'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k',   'gk', { noremap = true })
vim.api.nvim_set_keymap('n', 'gj',  'j', { noremap = true })
vim.api.nvim_set_keymap('n', 'gk',  'k', { noremap = true })
vim.api.nvim_set_keymap('n', 'P',   'Pg;', { noremap = true })
vim.api.nvim_set_keymap('n', 'gc',  '`[v`]', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-Left>',  '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Up>',    '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Down>',  '<C-w>j', { noremap = true })

vim.api.nvim_set_keymap('n', '<S-Left>',  '<C-w>><CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Right>', '<C-w><<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Up>',    '<C-w>-<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Down>',  '<C-w>+<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Tab>',   'gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-S-Tab>', 'gT', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-PageDown>', ':tabmove +1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-PageUp>',   ':tabmove -1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-i>', '<C-g>', { noremap = true })

vim.api.nvim_set_keymap('n', '<F8>',  ":split | execute 'lcd' fnamemodify(resolve(expand('%:p')), ':h') | terminal<CR>", { noremap = true })

-- command
vim.api.nvim_set_keymap('c', '<C-x>', "<C-r>=expand('%:p')<CR>", { noremap = true })

-- terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

-- Commenting
require('Comment').setup({
    ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
    ---@type table
    mappings = {
        ---Operator-pending mapping
        ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
        ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
        basic = false,
        ---Extra mapping
        ---Includes `gco`, `gcO`, `gcA`
        extra = false,
        ---Extended mapping
        ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
        extended = false,
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
]=]


-- {{{ nvim-web-devicons
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
-- }}}


-- {{{ norcalli/nvim-colorizer.lua
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
-- }}}


-- {{{ nvim-lualine/lualine.nvim
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
      {
        'tabs',
        mode = 1,
        max_length = function() return vim.o.columns end,
        tabs_color = {
          active = 'PMenuSel',
          inactive = 'PMenu',
        },
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {}
}
-- }}}


-- {{{ vim-better-whitespace
vim.g.better_whitespace_operator = ''
vim.g.better_whitespace_filetypes_blacklist = {
  'diff',
  'gitcommit',
  'qf',
  'help',
  'markdown',
}
-- }}}


-- {{{ lukas-reineke/indent-blankline.nvim
vim.opt.list = true
vim.opt.listchars:append({ eol = '﬋' })
vim.opt.listchars:remove('nbsp')
vim.opt.listchars:remove('trail')

require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = true,
  show_current_context_start = true,
  show_end_of_line = true,
  space_char_blankline = " ",
  use_treesitter = true,
}
-- }}}


-- {{{ comfortable-motion.vim
vim.api.nvim_set_keymap('n', '<C-d>', ':call comfortable_motion#flick(100)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', ':call comfortable_motion#flick(-100)<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-f>',      ':call comfortable_motion#flick(200)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-b>',      ':call comfortable_motion#flick(-200)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<PageDown>', ':call comfortable_motion#flick(200)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<PageUp>',   ':call comfortable_motion#flick(-200)<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('', '<ScrollWheelDown>', ':call comfortable_motion#flick(40)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<ScrollWheelUp>',   ':call comfortable_motion#flick(-40)<CR>', { noremap = true, silent = true })
-- }}}


-- {{{ vim-expand-region
vim.api.nvim_set_keymap('v', '+', '<Plug>(expand_region_expand)', {})
vim.api.nvim_set_keymap('v', '-', '<Plug>(expand_region_shrink)', {})
-- }}}


-- {{{ machakann/vim-highlightedyank
vim.api.nvim_set_keymap('', 'y', '<Plug>(highlightedyank)', {})
-- }}}


-- {{{ nvim-telescope/telescope.nvim
require('telescope').setup{
  pickers = {
    buffers = {
      mappings = {
        i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<C-d>"] = "delete_buffer",
        },
      },
    },
  },
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
-- }}}


-- {{{ folke/zen-mode.nvim
require('zen-mode').setup {
  window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height
    width = 120, -- width of the Zen window
    height = 1, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      -- signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
    },
    twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false }, -- disables the tmux statusline
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = false,
      font = "+4", -- font size increment
    },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end,
}
-- }}}


-- {{{ folke/which-key.nvim
local wk = require('which-key')
wk.register({
  h = {
    name = 'help',
    h = { '<cmd>Telescope help_tags<CR>',   'Help tags',    noremap = true, silent = true },
    c = { '<cmd>Telescope commands<CR>',    'Commands',     noremap = true, silent = true },
    m = { '<cmd>Telescope keymaps<CR>',     'Keymaps',      noremap = true, silent = true },
    C = { '<cmd>Telescope colorscheme<CR>', 'Colorschemes', noremap = true, silent = true },
  },
  P = {
    name = 'plugin',
    P = { ':call dein#check_update(v:true)<CR>', 'Update',  noremap = true, silent = true },
    i = { ':call dein#install()<CR>',            'Install', noremap = true, silent = true },
    c = { ':echo dein#check_clean() <Bar> call map(dein#check_clean(), "delete(v:val, \'rf\')") <Bar> call dein#recache_runtimepath() <Bar> echo "Cleaned up."<CR>', 'Clean', noremap = true, silent = true },
  },
  f = {
    name = 'file',
    v = {
      name = 'vim',
      d = { ':tab vsplit $MYVIMRC<CR>', 'Open $MYVIMRC',   noremap = true, silent = true },
      R = { ':source $MYVIMRC<CR>',     'Reload $MYVIMRC', noremap = true, silent = true },
    },
    s = { ':w<CR>',              'Save',                                        noremap = true, silent = true },
    S = { ':wa<CR>',             'Save all',                                    noremap = true, silent = true },
    t = { ':NvimTreeToggle<CR>', 'Toggle tree view',                            noremap = true, silent = true },
    R = { ':Rename<Space>',      'Start renaming current file',                 noremap = true },
    f = { '<cmd>Telescope find_files<CR>', '[Telescope] Files',                 noremap = true, silent = true },
    r = { '<cmd>Telescope oldfiles<CR>',   '[Telescope] Recently opened files', noremap = true, silent = true },
  },
  s = {
    name = 'search',
    b     = { '<cmd>Telescope current_buffer_fuzzy_find<CR>', '[Telescope] Current buffer lines', noremap = true, silent = true },
    g     = { '<cmd>Telescope live_grep<CR>',                 '[Telescope] Live grep',            noremap = true, silent = true },
    s     = { '<cmd>Telescope lsp_document_symbols<CR>',      '[Telescope] LSP document symbols', noremap = true, silent = true },
    ['/'] = { '<cmd>Telescope search_history<CR>',            '[Telescope] Search history',       noremap = true, silent = true },
  },
  b = {
    name = 'buffer',
    n = { ':bn<CR>', 'Next',                                   noremap = true, silent = true },
    p = { ':bp<CR>', 'Previous',                               noremap = true, silent = true },
    d = { ':bd<CR>', 'Delete',                                 noremap = true, silent = true },
    b = { '<cmd>Telescope buffers<CR>', '[Telescope] Buffers', noremap = true, silent = true },
  },
  e = {
    name = 'error',
    e = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Show diagnostics in floating window', noremap = true, silent = true },
    p = { '<cmd>lua vim.diagnostic.goto_prev()<CR>',  'Previous',                            noremap = true, silent = true },
    n = { '<cmd>lua vim.diagnostic.goto_next()<CR>',  'Next',                                noremap = true, silent = true },
    l = { '<cmd>lua vim.diagnostic.setloclist()<CR>', 'Show list',                           noremap = true, silent = true },
  },
  t = {
    name = 'toggle',
    s = { ':setl spell!<CR>:setl spell?<CR>',         'Spell check',               noremap = true, silent = true },
    W = { ':setl list!<CR>:setl list?<CR>',           'Visibility of whitespaces', noremap = true, silent = true },
    n = { ':setl number!<CR>:setl number?<CR>',       'Line number',               noremap = true, silent = true },
    t = { ':setl expandtab!<CR>:setl expandtab?<CR>', 'Expand tab',                noremap = true, silent = true },
    w = { ':setl wrap!<CR>:setl wrap?<CR>',           'Line wrap',                 noremap = true, silent = true },
    z = { ':ZenMode<CR>',                             'Zen mode',                  noremap = true, silent = true },
    i = { ':IndentBlanklineToggle<CR>',               'Indent line',               noremap = true, silent = true },
    ['<Space>'] = { ':setl list!<CR>:setl list?<CR>', 'Visibility of whitespaces', noremap = true, silent = true },
  },
  c = {
    name = 'comment',
    [''] = { '<CMD>lua require("Comment.api").call("toggle_linewise_op")<CR>g@',          'Toggle line-wise' },
    c    = { '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$', 'Toggle current line' },
    o    = { '<CMD>lua require("Comment.api").call("insert_linewise_below")<CR>',         'Insert below' },
    O    = { '<CMD>lua require("Comment.api").call("insert_linewise_above")<CR>',         'Insert above' },
    A    = { '<CMD>lua require("Comment.api").call("insert_linewise_eol")<CR>',           'Insert at end of line' },
  },
  ['<Space>'] = {
    name = 'jump',
    w = { '<cmd>HopWord<CR>', '' },
    l = { '<cmd>HopLine<CR>', '' },
    W = { '<Plug>(choosewin)',   'Window' },
  },
  q = {
    name = 'quit',
    q = { ':confirm qall<CR>', 'Quit Neovim', noremap = true, silent = true },
  },
  a = { '<Plug>(EasyAlign)', 'EasyAlign' },
  g = {
    name = 'git',
    ['<C-g>'] = { 'g<C-g>',                                       'Count words',           noremap = true, silent = true },
    c = { ':Gina commit -v --opener="topleft vsplit"<CR>',        'Commit',                noremap = true, silent = true },
    d = { ':Gvdiff<CR>',                                          'Diff',                  noremap = true, silent = true },
    m = { ':Magit<CR>',                                           'Magit',                 noremap = true, silent = true },
    ['<C-n>'] = { "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", 'Next hunk',             expr = true },
    ['<C-p>'] = { "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", 'Previous hunk',         expr = true },
    s = { '<cmd>Gitsigns stage_hunk<CR>',                         'Stage hunk',            noremap = true, silent = true },
    u = { '<cmd>Gitsigns undo_stage_hunk<CR>',                    'Undo staged hunk',      noremap = true, silent = true },
    r = { '<cmd>Gitsigns reset_hunk<CR>',                         'Reset hunk',            noremap = true, silent = true },
    R = { '<cmd>Gitsigns reset_buffer<CR>',                       'Reset buffer',          noremap = true, silent = true },
    p = { '<cmd>Gitsigns preview_hunk<CR>',                       'Preview hunk',          noremap = true, silent = true },
    b = { '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', 'Blame line',            noremap = true, silent = true },
    S = { '<cmd>Gitsigns stage_buffer<CR>',                       'Stage buffer',          noremap = true, silent = true },
    U = { '<cmd>Gitsigns reset_buffer_index<CR>',                 'Reset buffer (index)',  noremap = true, silent = true },
    f = { '<cmd>Telescope git_files<CR>',                         '[Telescope] Git files', noremap = true, silent = true },
  },
  G = {
    name = 'grammarous',
    G = { ':GrammarousCheck<CR>',                      'Grammarous check', noremap = true },
    n = { '<Plug>(grammarous-move-to-next-error)',     'Next error' },
    p = { '<Plug>(grammarous-move-to-previous-error)', 'Previous error' },
  },
  m = {
    name = 'markdown',
    p = { ':MarkdownPreview<CR>', 'Preview', noremap = true, silent = true },  -- From iamcco/markdown-preview.nvim
  },
}, { mode = 'n', prefix = '<Space>' })
wk.register({
  c = { ':Gina commit -v --opener="topleft vsplit"<CR>', 'Commit',                       noremap = true, silent = true },
  d = { ':Gvdiff<CR>',                                   'Diff',                         noremap = true, silent = true },
  m = { ':Magit<CR>',                                    'Magit',                        noremap = true, silent = true },
  ['<C-n>'] = { "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", 'Next hunk',             expr = true },
  ['<C-p>'] = { "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", 'Previous hunk',         expr = true },
  s = { '<cmd>Gitsigns stage_hunk<CR>',                         'Stage hunk',            noremap = true, silent = true },
  u = { '<cmd>Gitsigns undo_stage_hunk<CR>',                    'Undo staged hunk',      noremap = true, silent = true },
  r = { '<cmd>Gitsigns reset_hunk<CR>',                         'Reset hunk',            noremap = true, silent = true },
  R = { '<cmd>Gitsigns reset_buffer<CR>',                       'Reset buffer',          noremap = true, silent = true },
  p = { '<cmd>Gitsigns preview_hunk<CR>',                       'Preview hunk',          noremap = true, silent = true },
  b = { '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', 'Blame line',            noremap = true, silent = true },
  S = { '<cmd>Gitsigns stage_buffer<CR>',                       'Stage buffer',          noremap = true, silent = true },
  U = { '<cmd>Gitsigns reset_buffer_index<CR>',                 'Reset buffer (index)',  noremap = true, silent = true },
  f = { '<cmd>Telescope git_files<CR>',                         '[Telescope] Git files', noremap = true, silent = true },
}, { mode = 'n', prefix = '<C-g>' })
wk.register({
  c = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', 'Toggle line-wise' },
  ['<Space>'] = {
    w = { '<cmd>HopWord<CR>', '' },
    l = { '<cmd>HopLine<CR>', '' },
  },
  a = { '<Plug>(EasyAlign)', 'EasyAlign' },
  g = {
    name = 'git',
    s = { '<cmd>Gitsigns stage_hunk<CR>', 'Stage hunk', noremap = true, silent = true },
    r = { '<cmd>Gitsigns reset_hunk<CR>', 'Reset hunk', noremap = true, silent = true },
  }
}, { mode = 'x', prefix = '<Space>' })
wk.register({
  ['<Space>'] = {
    w = { '<cmd>HopWord<CR>', '' },
    l = { '<cmd>HopLine<CR>', '' },
  },
}, { mode = 'o', prefix = '<Space>' })
-- }}}


-- {{{ voldikss/vim-floaterm
vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8
vim.cmd('autocmd MyAutoCmds User FloatermOpen set winblend=10')
-- Toggle
vim.api.nvim_set_keymap('n', '<A-t>',  '<CMD>FloatermToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-t>',  '<C-\\><C-n><CMD>FloatermToggle<CR>', { noremap = true, silent = true })
-- New
vim.api.nvim_set_keymap('n', '<A-c>',  '<CMD>FloatermNew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-c>',  '<C-\\><C-n><CMD>FloatermNew<CR>', { noremap = true, silent = true })
-- Kill
vim.api.nvim_set_keymap('n', '<A-x>',  '<CMD>FloatermKill<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-x>',  '<C-\\><C-n><CMD>FloatermKill<CR>', { noremap = true, silent = true })
-- Previous
vim.api.nvim_set_keymap('n', '<A-p>',  '<CMD>FloatermPrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-p>',  '<C-\\><C-n><CMD>FloatermPrev<CR>', { noremap = true, silent = true })
-- Next
vim.api.nvim_set_keymap('n', '<A-n>',  '<CMD>FloatermNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-n>',  '<C-\\><C-n><CMD>FloatermNext<CR>', { noremap = true, silent = true })
-- }}}


-- {{{ kyazdani42/nvim-tree.lua
require('nvim-tree').setup {
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


-- {{{ inkarkat/vim-mark
vim.g.mw_no_mappings = 1
-- }}}


-- {{{ kana/vim-operator-replace
vim.api.nvim_set_keymap('n', 'pp', 'p', { noremap = true })
vim.api.nvim_set_keymap('n', 'p', '<Plug>(operator-replace)', {})
-- }}}


-- {{{ rhysd/vim-operator-surround
vim.api.nvim_set_keymap('n', 'sa', '<Plug>(operator-surround-append)', { silent = true })
vim.api.nvim_set_keymap('v', 'sa', '<Plug>(operator-surround-append)', { silent = true })
vim.api.nvim_set_keymap('n', 'sd', '<Plug>(operator-surround-delete)a', { silent = true })
vim.api.nvim_set_keymap('n', 'sc', '<Plug>(operator-surround-replace)a', { silent = true })
vim.api.nvim_set_keymap('n', 'sD', '<Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)', { silent = true })
vim.api.nvim_set_keymap('n', 'sC', '<Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)', { silent = true })
-- }}}


-- {{{ phaazon/hop.nvim
require'hop'.setup()
-- }}}


-- {{{ ggandor/lightspeed.nvim
vim.api.nvim_set_keymap('n', 'f', '<Plug>Lightspeed_f', { silent = true })
vim.api.nvim_set_keymap('n', 'F', '<Plug>Lightspeed_F', { silent = true })
vim.api.nvim_set_keymap('x', 'f', '<Plug>Lightspeed_f', { silent = true })
vim.api.nvim_set_keymap('x', 'F', '<Plug>Lightspeed_F', { silent = true })
vim.api.nvim_set_keymap('o', 'f', '<Plug>Lightspeed_f', { silent = true })
vim.api.nvim_set_keymap('o', 'F', '<Plug>Lightspeed_F', { silent = true })

vim.api.nvim_set_keymap('n', 't', '<Plug>Lightspeed_t', { silent = true })
vim.api.nvim_set_keymap('n', 'T', '<Plug>Lightspeed_T', { silent = true })
vim.api.nvim_set_keymap('x', 't', '<Plug>Lightspeed_t', { silent = true })
vim.api.nvim_set_keymap('x', 'T', '<Plug>Lightspeed_T', { silent = true })
vim.api.nvim_set_keymap('o', 't', '<Plug>Lightspeed_t', { silent = true })
vim.api.nvim_set_keymap('o', 'T', '<Plug>Lightspeed_T', { silent = true })

vim.api.nvim_set_keymap('n', ';', '<Plug>Lightspeed_;_ft', { silent = true })
vim.api.nvim_set_keymap('x', ';', '<Plug>Lightspeed_;_ft', { silent = true })
vim.api.nvim_set_keymap('o', ';', '<Plug>Lightspeed_;_ft', { silent = true })

vim.api.nvim_set_keymap('n', ',', '<Plug>Lightspeed_,_ft', { silent = true })
vim.api.nvim_set_keymap('x', ',', '<Plug>Lightspeed_,_ft', { silent = true })
vim.api.nvim_set_keymap('o', ',', '<Plug>Lightspeed_,_ft', { silent = true })
-- }}}


-- {{{ vim-choosewin
vim.g.choosewin_overlay_enable = 1
vim.g.choosewin_color_overlay = {
  gui = {'#484e55', '#484e55'},
  cterm = {239, 239},
}
vim.g.choosewin_color_overlay_current = {
  gui = {'#e4c374', '#e4c374'},
  cterm = {179, 179},
}
-- }}}


-- {{{ open-browser.vim
vim.api.nvim_set_keymap('n', 'gw', '<Plug>(openbrowser-smart-search)', {})
vim.api.nvim_set_keymap('v', 'gw', '<Plug>(openbrowser-smart-search)', {})
-- }}}


-- {{{ vim-gnupg
vim.g.GPGPreferSymmetric = 1
-- }}}


-- {{{ lewis6991/gitsigns.nvim
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '┃', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
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


require('lsp')


-- {{{ rhysd/vim-grammarous
vim.api.nvim_set_keymap('n', '<F5>', '<Plug>(grammarous-move-to-next-error)', {})
-- }}}


-- {{{ AsciiDoc
vim.g.vim_asciidoc_initial_foldlevel = 99
-- }}}


-- {{{ C/C++
vim.cmd('autocmd MyAutoCmds BufNewFile,BufRead *.cpp setlocal matchpairs+=<:>')
-- }}}


require('filetype-autocmds')


-- }}}  Extensions


-- vim: set foldmethod=marker:
