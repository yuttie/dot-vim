return {
  -- Gentoo
  'gentoo/gentoo-syntax',  -- ftdetect, ftplugin, indent, plugin, syntax

  -- Git
  {
    'jreybert/vimagit',
    cmd = {
      'Magit',
    },
  },
  'itchyny/vim-gitbranch',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
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
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Text objects
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end,
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
    end,
  },
  {
    'lambdalisue/gina.vim',
    cmd = {
      'Gina',
    },
  },
  {
    'tpope/vim-fugitive',
    cmd = {
      'Gvdiffsplit',
    }
  },
  'hotwatermorning/auto-git-diff',

  -- i3
  'PotatoesMaster/i3-vim-syntax',  -- syntax, ftplugin

  -- jq
  'vito-c/jq.vim',  -- ftdetect, ftplugin, syntax

  -- Text
  {
    'rhysd/vim-grammarous',
    cmd = {
    'GrammarousCheck',
    },
    keys = {
      '<Plug>(grammarous-move-to-next-error)',
      '<Plug>(grammarous-move-to-previous-error)',
    },
  },

  -- tmux
  'tmux-plugins/vim-tmux',

  -- Web/HTML
  {
    'mattn/emmet-vim',
    ft = {'html', 'xml', 'php'},
  },

  -- Markdown
  {
    'godlygeek/tabular',
    cmd = {
      'AddTabularPattern',
      'AddTabularPipeline',
      'Tabularize',
      'GTabularize',
    },
  },
  {
    'iamcco/markdown-preview.nvim',
    ft = {'markdown', 'pandoc.markdown', 'rmd'},
    build = 'sh -c "cd app & yarn install"',
  },

  -- AsciiDoc
  {
    'mjakl/vim-asciidoc',
    ft = 'asciidoc',
  },
}
