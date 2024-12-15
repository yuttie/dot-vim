-- Enable lua-loader that byte-compiles and caches lua files
vim.loader.enable()

-- {{{ $PATH
vim.env.PATH = vim.fn.expand('~/.local/bin') .. ':' .. vim.fn.expand('~/.cargo/bin') .. ':' .. vim.env.PATH
-- }}}


-- {{{ Plugins

require('config.lazy')

-- }}}


-- Disable syntax highlighting to use treesitter instead
vim.cmd('syntax off')


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

vim.cmd[[colorscheme tokyonight]]

-- }}}


-- Extensions                                                                 {{{
-- ==============================================================================

-- {{{ Neovide
vim.opt.guifont = 'monospace:h13'
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
-- vim.keymap.set('n', '<C-l>', function()
--   require('notify').dismiss()
--   vim.cmd('nohlsearch|diffupdate|normal! <C-L><CR>')
-- end)
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
vim.keymap.set('n', '<C-s>', ':w<CR>', { silent = true })
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
  underline = false,
  virtual_text = {
    format = function(diagnostic)
      return string.format('%s [%s: %s]', diagnostic.message, diagnostic.source, diagnostic.code)
    end,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.INFO] = ' ',
      [vim.diagnostic.severity.HINT] = ' ',
    },
  },
  float = {
    border = 'rounded',
  },
  update_in_insert = false,
  severity_sort = true,
  virtual_lines = false,
})


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
