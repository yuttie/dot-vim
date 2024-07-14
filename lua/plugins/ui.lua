return {
  'norcalli/nvim-colorizer.lua',
  'ntpeters/vim-better-whitespace',
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append({ eol = '﬋' })  -- Alternatives: '⏎'
      vim.opt.listchars:remove('nbsp')
      vim.opt.listchars:remove('trail')

      require('ibl').setup {
        debounce = 200,
        indent = {
          char = '┆',
          smart_indent_cap = true,
        },
        scope = {
          enabled = ture,
          char = '│',
          show_start = true,
          show_end = true,
          highlight = 'Function',
          include = {},
          exclude = {},
        },
      }
    end,
  },
  {
    'lukas-reineke/headlines.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('headlines').setup {
      }
    end,
  },
  'yuttie/comfortable-motion.vim',
  {
    'folke/which-key.nvim',
    lazy = true,
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end,
  },
  {
    'sindrets/winshift.nvim',
    config = function()
      require("winshift").setup {
      }
    end,
    keys = {
      -- Start Win-Move mode:
      { '<C-W><C-M>', '<Cmd>WinShift<CR>', noremap = true },
      { '<C-W>m', '<Cmd>WinShift<CR>', noremap = true },
      -- Swap two windows:
      { '<C-W>X', '<Cmd>WinShift swap<CR>', noremap = true },
      -- If you don't want to use Win-Move mode you can create mappings for calling the
      -- move commands directly:
      { '<C-M-H>', '<Cmd>WinShift left<CR>', noremap = true },
      { '<C-M-J>', '<Cmd>WinShift down<CR>', noremap = true },
      { '<C-M-K>', '<Cmd>WinShift up<CR>', noremap = true },
      { '<C-M-L>', '<Cmd>WinShift right<CR>', noremap = true },
    },
  },
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup()

      local kopts = {noremap = true, silent = true}

      vim.api.nvim_set_keymap('n', 'n',
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts)
      vim.api.nvim_set_keymap('n', 'N',
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts)
      vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

      vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
    end,
  },
  {
    'petertriho/nvim-scrollbar',
    dependencies = {
      'lewis6991/gitsigns.nvim',
    },
    config = function()
      require('scrollbar').setup()
      require('scrollbar.handlers.gitsigns').setup()
    end,
  },
  'nvim-lualine/lualine.nvim',
  'akinsho/bufferline.nvim',
  {
    'kyazdani42/nvim-web-devicons',
    lazy = true,
    config = function()
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
    end,
  },
}
