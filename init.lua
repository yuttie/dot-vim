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
  vim.fn['dein#add']('ggandor/lightspeed.nvim', {
    on_map = {
      '<Plug>Lightspeed_s',
      '<Plug>Lightspeed_S',
      '<Plug>Lightspeed_s',
      '<Plug>Lightspeed_S',
      '<Plug>Lightspeed_s',
      '<Plug>Lightspeed_S',
      '<Plug>Lightspeed_gs',
      '<Plug>Lightspeed_gS',
      '<Plug>Lightspeed_f',
      '<Plug>Lightspeed_F',
      '<Plug>Lightspeed_f',
      '<Plug>Lightspeed_F',
      '<Plug>Lightspeed_f',
      '<Plug>Lightspeed_F',
      '<Plug>Lightspeed_t',
      '<Plug>Lightspeed_T',
      '<Plug>Lightspeed_t',
      '<Plug>Lightspeed_T',
      '<Plug>Lightspeed_t',
      '<Plug>Lightspeed_T',
      '<Plug>Lightspeed_;_ft',
      '<Plug>Lightspeed_;_ft',
      '<Plug>Lightspeed_;_ft',
      '<Plug>Lightspeed_,_ft',
      '<Plug>Lightspeed_,_ft',
      '<Plug>Lightspeed_,_ft',
    },
  })
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
  vim.fn['dein#add']('hrsh7th/nvim-cmp')
  -- Snippets
  vim.fn['dein#add']('hrsh7th/cmp-vsnip')
  vim.fn['dein#add']('hrsh7th/vim-vsnip')
  vim.fn['dein#add']('rafamadriz/friendly-snippets')
  -- Signature
  vim.fn['dein#add']('ray-x/lsp_signature.nvim')

  --
  -- Interactive filter
  --
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
  vim.fn['dein#add']('nvim-lualine/lualine.nvim')
  vim.fn['dein#add']('kyazdani42/nvim-web-devicons')
  vim.fn['dein#add']('yuttie/hydrangea-vim', {
    rev = 'develop',
  })
  vim.fn['dein#add']('yuttie/inkstained-vim')
  vim.fn['dein#add']('yuttie/snowy-vim')
  vim.fn['dein#add']('yuttie/sublimetext-spacegray.vim')
  vim.fn['dein#add']('cocopon/iceberg.vim')
  vim.fn['dein#add']('arcticicestudio/nord-vim', {
    rev = 'master',
  })

  -- End of plugin list
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
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Change the cursor sahpe
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set background=dark
  colorscheme spacegray-dark
endif

function! s:my_colorscheme_adjustments() abort
  highlight SpellBad term=underline cterm=undercurl ctermfg=red gui=undercurl guifg=red
endfunction
autocmd MyAutoCmds VimEnter * call s:my_colorscheme_adjustments()
autocmd MyAutoCmds ColorScheme * call s:my_colorscheme_adjustments()
]=]

require('plugin-treesitter')

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
let g:neovide_cursor_animation_length=0.03
let g:neovide_cursor_trail_length=0.5
let g:neovide_cursor_vfx_mode = "railgun"
" }}}


" {{{ Commands
lua require('commands')
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
inoremap <C-s> <C-d>

" insert and command line
noremap! <C-a> <Home>
noremap! <C-e> <End>
noremap! <C-b> <Left>
noremap! <C-f> <Right>
noremap! <C-d> <Del>
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
nnoremap <C-Tab>   gt
nnoremap <C-S-Tab> gT
nnoremap <silent> <S-PageDown> :tabmove +1<CR>
nnoremap <silent> <S-PageUp>   :tabmove -1<CR>
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

nnoremap [toggle] <Nop>
nmap     [Space]t [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]w :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]n :setl number!<CR>:setl number?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>
nnoremap <silent> [toggle]z :ZenMode<CR>
nnoremap <silent> [toggle]i :IndentBlanklineToggle<CR>
nnoremap <silent> [toggle]<Space> :setl list!<CR>:setl list?<CR>
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
xnoremap [jump] <Nop>
onoremap [jump] <Nop>
nmap     [Space]<Space> [jump]
xmap     [Space]<Space> [jump]
omap     [Space]<Space> [jump]

nmap     [jump]W <Plug>(choosewin)

nnoremap [quit] <Nop>
nmap     [Space]q [quit]
nnoremap <silent> [quit]q :confirm qall<CR>
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
]=]


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


vim.cmd [=[
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
vim.opt.listchars:append({ eol = '↴' })

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


-- {{{ ggandor/lightspeed.nvim
vim.api.nvim_set_keymap('n', '[jump]j', '<Plug>Lightspeed_s', {})
vim.api.nvim_set_keymap('n', '[jump]k', '<Plug>Lightspeed_S', {})
vim.api.nvim_set_keymap('x', '[jump]j', '<Plug>Lightspeed_s', {})
vim.api.nvim_set_keymap('x', '[jump]k', '<Plug>Lightspeed_S', {})
vim.api.nvim_set_keymap('o', '[jump]j', '<Plug>Lightspeed_s', {})
vim.api.nvim_set_keymap('o', '[jump]k', '<Plug>Lightspeed_S', {})
vim.api.nvim_set_keymap('n', '[jump]J', '<Plug>Lightspeed_gs', {})
vim.api.nvim_set_keymap('n', '[jump]K', '<Plug>Lightspeed_gS', {})
vim.api.nvim_set_keymap('n', 'f', '<Plug>Lightspeed_f', {})
vim.api.nvim_set_keymap('n', 'F', '<Plug>Lightspeed_F', {})
vim.api.nvim_set_keymap('x', 'f', '<Plug>Lightspeed_f', {})
vim.api.nvim_set_keymap('x', 'F', '<Plug>Lightspeed_F', {})
vim.api.nvim_set_keymap('o', 'f', '<Plug>Lightspeed_f', {})
vim.api.nvim_set_keymap('o', 'F', '<Plug>Lightspeed_F', {})
vim.api.nvim_set_keymap('n', 't', '<Plug>Lightspeed_t', {})
vim.api.nvim_set_keymap('n', 'T', '<Plug>Lightspeed_T', {})
vim.api.nvim_set_keymap('x', 't', '<Plug>Lightspeed_t', {})
vim.api.nvim_set_keymap('x', 'T', '<Plug>Lightspeed_T', {})
vim.api.nvim_set_keymap('o', 't', '<Plug>Lightspeed_t', {})
vim.api.nvim_set_keymap('o', 'T', '<Plug>Lightspeed_T', {})
vim.api.nvim_set_keymap('n', ';', '<Plug>Lightspeed_;_ft', {})
vim.api.nvim_set_keymap('x', ';', '<Plug>Lightspeed_;_ft', {})
vim.api.nvim_set_keymap('o', ';', '<Plug>Lightspeed_;_ft', {})
vim.api.nvim_set_keymap('n', ',', '<Plug>Lightspeed_,_ft', {})
vim.api.nvim_set_keymap('x', ',', '<Plug>Lightspeed_,_ft', {})
vim.api.nvim_set_keymap('o', ',', '<Plug>Lightspeed_,_ft', {})
-- }}}


vim.cmd [=[
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
nnoremap [git]    <Nop>
vnoremap [git]    <Nop>
nmap     <C-g>    [git]
vmap     <C-g>    [git]
nmap     [Space]g [git]
vmap     [Space]g [git]

nnoremap <silent> [git]c  :Gina commit -v --opener="topleft vsplit"<CR>
nnoremap <silent> [git]d  :Gvdiff<CR>
nnoremap <silent> [git]m  :Magit<CR>
" }}}
]=]


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

-- Diagnostic symbols in the sign column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

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
  -- * pyright:       yarn global add pyright
  -- * bashls:        yarn global add bash-language-server
  -- * ccls:          emerge dev-util/ccls, pacman -S community/ccls
  -- * cssls:         yarn global add vscode-langservers-extracted
  -- * dockerls:      yarn global add dockerfile-language-server-nodejs
  -- * eslint:        yarn global add vscode-langservers-extracted
  -- * html:          yarn global add vscode-langservers-extracted
  -- * rust_analyzer: curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
  -- * sqlls:         yarn global add sql-language-server
  -- * texlab:        cargo install --git https://github.com/latex-lsp/texlab.git --locked
  -- * tsserver:      yarn global add typescript-language-server
  -- * vimls:         yarn global add vim-language-server
  -- * vuels:         yarn global add vls
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
    'rust_analyzer',
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


-- {{{ ray-x/lsp_signature.nvim
require('lsp_signature').setup {
  hint_enable = false,
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded",
  },
}
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


" {{{ Markdown
nnoremap [markdown]  <Nop>
xnoremap [markdown]  <Nop>
nmap     [Space]m    [markdown]
xmap     [Space]m    [markdown]
nmap     [markdown]p :MarkdownPreview<CR>  " From iamcco/markdown-preview.nvim
" }}}


" {{{ AsciiDoc
let g:vim_asciidoc_initial_foldlevel=99
" }}}


" {{{ C/C++
autocmd MyAutoCmds BufNewFile,BufRead *.cpp setlocal matchpairs+=<:>
" }}}
]=]


require('filetype-autocmds')


-- }}}  Extensions


-- vim: set foldmethod=marker:
