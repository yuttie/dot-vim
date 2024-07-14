-- Enable lua-loader that byte-compiles and caches lua files
vim.loader.enable()

-- {{{ $PATH
vim.env.PATH = vim.fn.expand('~/.local/bin') .. ':' .. vim.fn.expand('~/.cargo/bin') .. ':' .. vim.env.PATH
-- }}}


-- {{{ Plugins

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
--vim.g.mapleader = " "
--vim.g.maplocalleader = "\\"
-- Prevent default plugins from being loaded
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1
-- Prevent default plugins from setting default keymaps
vim.g.omni_sql_no_default_maps = 1
-- Prevent plugins from setting default keymaps
vim.g.lightspeed_no_default_keymaps = 1

-- Setup lazy.nvim
require('lazy').setup({
  -- highlight-start
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- highlight-end
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- }}}


-- Disable syntax highlighting to use treesitter instead
vim.cmd('syntax off')


require('options')


-- Autocommand group
vim.api.nvim_create_augroup('MyAutoCmds', {})

vim.cmd [=[
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
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkon370

" Switch syntax highlighting on
syntax on

function! s:my_colorscheme_adjustments() abort
  highlight SpellBad term=underline cterm=undercurl gui=undercurl
endfunction
autocmd MyAutoCmds VimEnter * call s:my_colorscheme_adjustments()
autocmd MyAutoCmds ColorScheme * call s:my_colorscheme_adjustments()
]=]

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
vim.keymap.set('i', '<C-s>', '<C-d>')
vim.keymap.set('i', '<C-c>', '<Esc>')

-- insert and command line
vim.keymap.set('!', '<C-a>', '<Home>')
vim.keymap.set('!', '<C-e>', '<End>')
vim.keymap.set('!', '<C-b>', '<Left>')
vim.keymap.set('!', '<C-f>', '<Right>')
vim.keymap.set('!', '<C-d>', '<Del>')
vim.keymap.set('!', '<M-f>', '<S-Right>')
vim.keymap.set('!', '<M-b>', '<S-Left>')

-- normal
vim.keymap.set('n', 'j',   'gj')
vim.keymap.set('n', 'k',   'gk')
vim.keymap.set('n', 'gj',  'j')
vim.keymap.set('n', 'gk',  'k')
vim.keymap.set('n', 'PP',   'Pg;')
vim.keymap.set('n', 'gc',  '`[v`]')

vim.keymap.set('n', '<M-h>', '<C-w>h')
vim.keymap.set('n', '<M-l>', '<C-w>l')
vim.keymap.set('n', '<M-k>', '<C-w>k')
vim.keymap.set('n', '<M-j>', '<C-w>j')

vim.keymap.set('n', '<C-Left>',  '<C-w>h')
vim.keymap.set('n', '<C-Right>', '<C-w>l')
vim.keymap.set('n', '<C-Up>',    '<C-w>k')
vim.keymap.set('n', '<C-Down>',  '<C-w>j')

vim.keymap.set('n', '<S-Left>',  '<C-w>><CR>')
vim.keymap.set('n', '<S-Right>', '<C-w><<CR>')
vim.keymap.set('n', '<S-Up>',    '<C-w>-<CR>')
vim.keymap.set('n', '<S-Down>',  '<C-w>+<CR>')

vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })
vim.keymap.set('n', '<C-Tab>',   'gt')
vim.keymap.set('n', '<C-S-Tab>', 'gT')
vim.keymap.set('n', '<S-PageDown>', ':tabmove +1<CR>', { silent = true })
vim.keymap.set('n', '<S-PageUp>',   ':tabmove -1<CR>', { silent = true })
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('n', '<C-i>', '<C-g>')

vim.keymap.set('n', '<F8>',  ":split | execute 'lcd' fnamemodify(resolve(expand('%:p')), ':h') | terminal<CR>")

-- command
vim.keymap.set('c', '<C-x>', "<C-r>=expand('%:p')<CR>")

-- terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

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
    lualine_b = {'filename'},
    lualine_c = {'branch', 'diff', 'diagnostics'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {'branch', 'diff', 'diagnostics'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  tabline = {
  },
  extensions = {}
}
-- }}}


-- {{{ akinsho/bufferline.nvim
require('bufferline').setup {
  options = {
    mode = 'tabs',
    style_preset = require('bufferline').style_preset.no_italic,
    themable = true,
    always_show_bufferline = true,
    separator_style = { '|', '|' },
    left_mouse_command = vim.api.nvim_set_current_tabpage,
    middle_mouse_command = function(tabhandle)
      if table.getn(vim.api.nvim_list_tabpages()) > 1 then
        vim.cmd('tabclose ' .. vim.api.nvim_tabpage_get_number(tabhandle))
      end
    end,
    right_mouse_command = '',
    sort_by = function(buf_a, buf_b)
      if not buf_a and buf_b then
        return true
      elseif buf_a and not buf_b then
        return false
      end
      return buf_a.ordinal < buf_b.ordinal
    end,
  },
}
-- }}}


-- {{{ azabiong/vim-highlighter
-- Prevent default key mapping
vim.g.HiMapKeys = 0
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


-- {{{ comfortable-motion.vim
vim.keymap.set('n', '<C-d>', ':call comfortable_motion#flick(100)<CR>', { silent = true })
vim.keymap.set('n', '<C-u>', ':call comfortable_motion#flick(-100)<CR>', { silent = true })

vim.keymap.set('n', '<C-f>',      ':call comfortable_motion#flick(200)<CR>', { silent = true })
vim.keymap.set('n', '<C-b>',      ':call comfortable_motion#flick(-200)<CR>', { silent = true })
vim.keymap.set('n', '<PageDown>', ':call comfortable_motion#flick(200)<CR>', { silent = true })
vim.keymap.set('n', '<PageUp>',   ':call comfortable_motion#flick(-200)<CR>', { silent = true })

vim.keymap.set('', '<ScrollWheelDown>', ':call comfortable_motion#flick(40)<CR>', { silent = true })
vim.keymap.set('', '<ScrollWheelUp>',   ':call comfortable_motion#flick(-40)<CR>', { silent = true })
-- }}}


-- {{{ vim-expand-region
vim.keymap.set('v', '+', '<Plug>(expand_region_expand)', {})
vim.keymap.set('v', '-', '<Plug>(expand_region_shrink)', {})
-- }}}


-- {{{ Highlight a selection on yank }}}
-- See https://neovim.io/doc/user/lua.html#lua-highlight.
vim.cmd [=[
autocmd MyAutoCmds TextYankPost * silent! lua vim.highlight.on_yank { timeout = 1000 }
]=]


-- {{{ folke/which-key.nvim
local wk = require('which-key')
wk.register({
  ['?'] = {
    name = 'help',
    ['?'] = { '<cmd>Telescope help_tags<CR>',   'Help tags',    noremap = true, silent = true },
    [':'] = { '<cmd>Telescope commands<CR>',    'Commands',     noremap = true, silent = true },
    k     = { '<cmd>Telescope keymaps<CR>',     'Keymaps',      noremap = true, silent = true },
    c     = { '<cmd>Telescope colorscheme<CR>', 'Colorschemes', noremap = true, silent = true },
    i     = { '<cmd>Inspect<CR>',               'Inspect',      noremap = true, silent = true },
    I     = { '<cmd>Inspect!<CR>',              'Inspect!',     noremap = true, silent = true },
  },
  h = {
    name = 'highlight',
    h     = { ':<C-U>if highlighter#Command("+") | noh | endif<CR>',     'HiSet',   noremap = true },
    d     = { ':<C-U>if highlighter#Command("-") | noh | endif<CR>',     'HiErase', noremap = true },
    c     = { ':<C-U>if highlighter#Command("clear") | noh | endif<CR>', 'HiClear', noremap = true },
    ['/'] = { ':<C-U><C-R>=highlighter#Find("/")<CR>',                   'HiFind',  noremap = true },
    H     = { ':<C-U>if highlighter#Command("+%") | noh | endif<CR>',    'HiSetSL', noremap = true },
  },
  P = {
    name = 'plugin',
    P = { function() require("lazy").sync() end,    'Update',  noremap = true, silent = true },
    i = { function() require("lazy").install() end, 'Install', noremap = true, silent = true },
    c = { function() require("lazy").clean() end,   'Clean',   noremap = true, silent = true },
  },
  f = {
    name = 'file',
    v = {
      name = 'vim',
      i = { ':tab vsplit $MYVIMRC | lcd %:h<CR>', 'Open $MYVIMRC',   noremap = true, silent = true },
      R = { ':source $MYVIMRC<CR>',     'Reload $MYVIMRC', noremap = true, silent = true },
    },
    s = { ':w<CR>',              'Save',                                        noremap = true, silent = true },
    S = { ':wa<CR>',             'Save all',                                    noremap = true, silent = true },
    t = { ':NvimTreeToggle<CR>', 'Toggle tree view',                            noremap = true, silent = true },
    R = { ':Rename<Space>',      'Start renaming current file',                 noremap = true },
    f = { '<cmd>Telescope find_files no_ignore=true<CR>', '[Telescope] Files',  noremap = true, silent = true },
    F = { '<cmd>Telescope find_files cwd=~/<CR>', '[Telescope] Files',          noremap = true, silent = true },
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
  d = {
    name = 'diagnostic',
    d = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Show diagnostics in floating window', noremap = true, silent = true },
    p = { '<cmd>lua vim.diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity.ERROR }, wrap = false })<CR>',  'Previous', noremap = true, silent = true },
    n = { '<cmd>lua vim.diagnostic.goto_next({ severity = { min = vim.diagnostic.severity.ERROR }, wrap = false })<CR>',  'Next',     noremap = true, silent = true },
    l = { '<cmd>lua vim.diagnostic.setloclist()<CR>', 'Show list',                           noremap = true, silent = true },
  },
  t = {
    name = 'toggle',
    c = { '<cmd>TSContextToggle<CR>',               'TreeSitter context',        noremap = true, silent = true },
    d = { (function()
             local enabled = true
             return function()
               if enabled then
                 enabled = false
                 vim.diagnostic.disable(0)  -- 0 means a current buffer
               else
                 enabled = true
                 vim.diagnostic.enable(0)  -- 0 means a current buffer
               end
             end
           end)(),                                  'Diagnostics',               noremap = true, silent = true },
    i = { ':IndentBlanklineToggle<CR>',             'Indent line',               noremap = true, silent = true },
    n = { ':setl number! | setl number?<CR>',       'Line number',               noremap = true, silent = true },
    r = { ':TSBufToggle rainbow<CR>',               'Rainbow',                   noremap = true, silent = true },
    s = { ':setl spell! | setl spell?<CR>',         'Spell check',               noremap = true, silent = true },
    t = { ':setl expandtab! | setl expandtab?<CR>', 'Expand tab',                noremap = true, silent = true },
    w = { ':setl wrap! | setl wrap?<CR>',           'Line wrap',                 noremap = true, silent = true },
    z = { ':ZenMode<CR>',                           'Zen mode',                  noremap = true, silent = true },
    ['<Space>'] = { ':setl list! | setl list?<CR>', 'Visibility of whitespaces', noremap = true, silent = true },
  },
  c = {
    name = 'comment',
    [''] = { require('Comment.api').call('toggle.linewise', 'g@'), 'Toggle line-wise', expr = true },
    c    = { require('Comment.api').call('toggle.linewise.current', 'g@$'),      'Toggle current line', expr = true },
  },
  ['<Space>'] = { '<cmd>HopWord<CR>', '' },
  q = {
    name = 'quit',
    q = { ':confirm qall<CR>', 'Quit Neovim', noremap = true, silent = true },
  },
  a = { '<Plug>(EasyAlign)', 'EasyAlign' },
  g = {
    name = 'git',
    ['<C-g>'] = { 'g<C-g>',                                       'Count words',           noremap = true, silent = true },
    c = { ':Gina commit -v --opener="topleft vsplit"<CR>',        'Commit',                noremap = true, silent = true },
    d = { ':Gvdiffsplit<CR>',                                     'Diff',                  noremap = true, silent = true },
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
  d = { ':Gvdiffsplit<CR>',                              'Diff',                         noremap = true, silent = true },
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
  c = { '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', 'Toggle line-wise' },
  ['<Space>'] = {
    w = { '<cmd>HopWord<CR>', '' },
    l = { '<cmd>HopLine<CR>', '' },
  },
  a = { '<Plug>(EasyAlign)', 'EasyAlign' },
  g = {
    name = 'git',
    s = { '<cmd>Gitsigns stage_hunk<CR>', 'Stage hunk', noremap = true, silent = true },
    r = { '<cmd>Gitsigns reset_hunk<CR>', 'Reset hunk', noremap = true, silent = true },
  },
  h = {
    name = 'highlight',
    h     = { ':<C-U>if highlighter#Command("+x") | noh | endif<CR>',  'HiSet',   noremap = true },
    d     = { ':<C-U>if highlighter#Command("-x") | noh | endif<CR>',  'HiErase', noremap = true },
    ['/'] = { ':<C-U><C-R>=highlighter#Find("/x")<CR>',                'HiFind',  noremap = true },
    H     = { ':<C-U>if highlighter#Command("+x%") | noh | endif<CR>', 'HiSetSL', noremap = true },
  },
  s = { '<cmd>split<CR>:YodeCreateSeditorReplace<CR>', 'Focus on selection (horizontal split, above)', noremap = true, silent = true },
  S = { '<cmd>split<CR><ESC><C-w>jgv:YodeCreateSeditorReplace<CR>', 'Focus on selection (horizontal split, below)', noremap = true, silent = true },
  v = { '<cmd>vsplit<CR>:YodeCreateSeditorReplace<CR>', 'Focus on selection (vertical split, left)', noremap = true, silent = true },
  V = { '<cmd>vsplit<CR><ESC><C-w>lgv:YodeCreateSeditorReplace<CR>', 'Focus on selection (vertical split, right)', noremap = true, silent = true },
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
vim.keymap.set('n', '<A-t>',  '<CMD>FloatermToggle<CR>', { silent = true })
vim.keymap.set('t', '<A-t>',  '<C-\\><C-n><CMD>FloatermToggle<CR>', { silent = true })
-- New
vim.keymap.set('n', '<A-c>',  '<CMD>FloatermNew<CR>', { silent = true })
vim.keymap.set('t', '<A-c>',  '<C-\\><C-n><CMD>FloatermNew<CR>', { silent = true })
-- Kill
vim.keymap.set('n', '<A-x>',  '<CMD>FloatermKill<CR>', { silent = true })
vim.keymap.set('t', '<A-x>',  '<C-\\><C-n><CMD>FloatermKill<CR>', { silent = true })
-- Previous
vim.keymap.set('n', '<A-p>',  '<CMD>FloatermPrev<CR>', { silent = true })
vim.keymap.set('t', '<A-p>',  '<C-\\><C-n><CMD>FloatermPrev<CR>', { silent = true })
-- Next
vim.keymap.set('n', '<A-n>',  '<CMD>FloatermNext<CR>', { silent = true })
vim.keymap.set('t', '<A-n>',  '<C-\\><C-n><CMD>FloatermNext<CR>', { silent = true })
-- }}}


-- {{{ haya14busa/vim-asterisk
vim.keymap.set('', '*',  '<Plug>(asterisk-z*)', {})
vim.keymap.set('', '#',  '<Plug>(asterisk-z#)', {})
vim.keymap.set('', 'g*', '<Plug>(asterisk-gz*)', {})
vim.keymap.set('', 'g#', '<Plug>(asterisk-gz#)', {})
vim.g['asterisk#keeppos'] = 1
-- }}}


-- {{{ inkarkat/vim-mark
vim.g.mw_no_mappings = 1
-- }}}


-- {{{ kana/vim-operator-replace
vim.keymap.set('n', 'P', '<Plug>(operator-replace)')
-- }}}


-- {{{ rhysd/vim-operator-surround
vim.keymap.set('n', 'sa', '<Plug>(operator-surround-append)', { silent = true })
vim.keymap.set('v', 'sa', '<Plug>(operator-surround-append)', { silent = true })
vim.keymap.set('n', 'sd', '<Plug>(operator-surround-delete)a', { silent = true })
vim.keymap.set('n', 'sc', '<Plug>(operator-surround-replace)a', { silent = true })
vim.keymap.set('n', 'sD', '<Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)', { silent = true })
vim.keymap.set('n', 'sC', '<Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)', { silent = true })
-- }}}


-- {{{ ggandor/lightspeed.nvim
vim.keymap.set('n', 'f', '<Plug>Lightspeed_f', { silent = true })
vim.keymap.set('n', 'F', '<Plug>Lightspeed_F', { silent = true })
vim.keymap.set('x', 'f', '<Plug>Lightspeed_f', { silent = true })
vim.keymap.set('x', 'F', '<Plug>Lightspeed_F', { silent = true })
vim.keymap.set('o', 'f', '<Plug>Lightspeed_f', { silent = true })
vim.keymap.set('o', 'F', '<Plug>Lightspeed_F', { silent = true })

vim.keymap.set('n', 't', '<Plug>Lightspeed_t', { silent = true })
vim.keymap.set('n', 'T', '<Plug>Lightspeed_T', { silent = true })
vim.keymap.set('x', 't', '<Plug>Lightspeed_t', { silent = true })
vim.keymap.set('x', 'T', '<Plug>Lightspeed_T', { silent = true })
vim.keymap.set('o', 't', '<Plug>Lightspeed_t', { silent = true })
vim.keymap.set('o', 'T', '<Plug>Lightspeed_T', { silent = true })

vim.keymap.set('n', ';', '<Plug>Lightspeed_;_ft', { silent = true })
vim.keymap.set('x', ';', '<Plug>Lightspeed_;_ft', { silent = true })
vim.keymap.set('o', ';', '<Plug>Lightspeed_;_ft', { silent = true })

vim.keymap.set('n', ',', '<Plug>Lightspeed_,_ft', { silent = true })
vim.keymap.set('x', ',', '<Plug>Lightspeed_,_ft', { silent = true })
vim.keymap.set('o', ',', '<Plug>Lightspeed_,_ft', { silent = true })
-- }}}


-- {{{ open-browser.vim
vim.keymap.set('n', 'gw', '<Plug>(openbrowser-smart-search)', {})
vim.keymap.set('v', 'gw', '<Plug>(openbrowser-smart-search)', {})
-- }}}


-- {{{ dkarter/bullets.vim
vim.g.bullets_outline_levels = {'ROM', 'ABC', 'num', 'abc', 'rom', 'std*'}
-- }}}


-- {{{ vim-gnupg
vim.g.GPGPreferSymmetric = 1
-- }}}


-- Configure diagnostic
vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  signs = true,
  float = {
    border = 'rounded',
  },
  update_in_insert = false,
  severity_sort = true,
})

-- Diagnostic symbols in the sign column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


-- {{{ rhysd/vim-grammarous
vim.keymap.set('n', '<F5>', '<Plug>(grammarous-move-to-next-error)', {})
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
