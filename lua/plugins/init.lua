return {
  --
  -- Edit
  --
  {
    'kana/vim-operator-replace',
    dependencies = {
      'kana/vim-operator-user',
    },
  },
  {
    'rhysd/vim-textobj-anyblock',
    dependencies = {
      'kana/vim-textobj-user',
    },
    keys = {
      '<Plug>(textobj-anyblock-a)',
    },
  },
  {
    'simnalamburt/vim-mundo',
    cmd = {
      'MundoToggle',
    },
  },
  'mg979/vim-visual-multi',
  {
    'numToStr/Comment.nvim',
    lazy = true,
    config = function()
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
    end,
  },
  'chrisbra/NrrwRgn',
  {
    'hoschi/yode-nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    cmd = {
      'YodeCreateSeditorReplace',
    },
    config = function()
      require('yode-nvim').setup({})
    end,
  },
  {
    'folke/zen-mode.nvim',
    cmd = {
      'ZenMode',
    },
    config = function()
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
    end,
  },
  {
    'rhysd/vim-operator-surround',
    dependencies = {
      'kana/vim-operator-user',
    },
    keys = {
      '<Plug>(operator-surround-append)',
      '<Plug>(operator-surround-delete)',
      '<Plug>(operator-surround-replace)',
    },
  },
  {
    'terryma/vim-expand-region',
    keys = {
      '<Plug>(expand_region_expand)',
      '<Plug>(expand_region_shrink)',
    },
  },

  --
  -- Diff
  --
  'lambdalisue/vim-unified-diff',
  {
    'AndrewRadev/linediff.vim',
    cmd = {
      'Linediff',
      'LinediffReset',
      'LinediffAdd',
      'LinediffShow',
      'LinediffLast',
      'LinediffMerge',
      'LinediffPick',
    },
  },

  --
  -- Text Formatting
  --
  {
    'dkarter/bullets.vim',
    ft = { 'markdown', 'text', 'gitcommit' },
  },
  'tpope/vim-repeat',
  {
    'junegunn/vim-easy-align',
    keys = {
      '<Plug>(EasyAlign)',
    },
  },

  --
  -- Move
  --
  'ggandor/lightspeed.nvim',
  {
    'phaazon/hop.nvim',
    branch = 'v1.3',
    cmd = {
      'HopWord',
      'HopLine',
    },
    config = function()
      require'hop'.setup {
        multi_windows = true,
      }
    end,
  },

  --
  -- Search
  --
  'haya14busa/vim-asterisk',
  'itchyny/vim-cursorword',
  {
    'inkarkat/vim-mark',
    cmd = {
      'Mark',
      'MarkClear',
      'MarkName',
      'MarkLoad',
      'MarkSave',
      'MarkYankDefinitions',
      'MarkYankDefinitionsOneLiner',
      'Marks',
      'MarkPalette',
    },
    keys = {
      '<Plug>IgnoreMarkSearchNext',
      '<Plug>IgnoreMarkSearchPrev',
      '<Plug>IgnoreMarkSet',
      '<Plug>Mark',
      '<Plug>MarkAllClear',
      '<Plug>MarkConfirmAllClear',
      '<Plug>MarkIWhiteSet',
      '<Plug>MarkSearchAnyOrDefaultNext',
      '<Plug>MarkSearchAnyOrDefaultPrev',
      '<Plug>MarkSearchGroup1Next',
      '<Plug>MarkSearchGroup1Prev',
      '<Plug>MarkSearchGroupNext',
      '<Plug>MarkSearchGroupPrev',
      '<Plug>MarkSearchNext',
      '<Plug>MarkSearchOrAnyNext',
      '<Plug>MarkSearchOrAnyPrev',
      '<Plug>MarkSearchOrCurNext',
      '<Plug>MarkSearchOrCurPrev',
      '<Plug>MarkSearchPrev',
      '<Plug>MarkSearchUsedGroupNext',
      '<Plug>MarkSearchUsedGroupPrev',
      '<Plug>MarkSet',
      '<Plug>MarkToggle',
    },
  },
  'azabiong/vim-highlighter',

  --
  -- File
  --
  {
    'lambdalisue/suda.vim',
    cmd = {
      'SudaRead',
      'SudaWrite',
    },
  },
  {
    'Shougo/vinarise',
    cmd = {
      'Vinarise',
      'VinarisePluginDump',
      'VinarisePluginViewBitmapView',
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    cmd = {
      'NvimTreeToggle',
    },
    config = function()
      require('nvim-tree').setup {
      }
    end,
  },
  {
    'jamessan/vim-gnupg',
    branch = 'main',
  },

  --
  -- UI enhancement
  --
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

  --
  -- Terminal
  --
  'voldikss/vim-floaterm',

  --
  -- Others
  --
  {
    'tyru/open-browser.vim',
    keys = {
      '<Plug>(openbrowser-smart-search)',
    },
  },

  --
  -- LSP
  --
  {
    'neovim/nvim-lspconfig',
    lazy = false,  -- This should be false to ensure that a language server is launched when a buffer is opened
    config = function()
      local lspconfig = require('lspconfig')
      local util = require('lspconfig/util')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local on_attach = function(client, bufnr)
        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', '<C-k>', function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set('n', 'gf', function() vim.lsp.buf.formatting() end, opts)
        vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set('n', 'gt', function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set('n', 'gn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('n', 'ga', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', 'ge', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', 'g]', function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set('n', 'g[', function() vim.diagnostic.goto_prev() end, opts)
      end

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

      -- pyright
      lspconfig['pyright'].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        before_init = function(_, config)
          config.settings.python.pythonPath = get_python_path(config.root_dir)
        end,
      }

      -- Other servers
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
          on_attach = on_attach,
        }
      end

      -- Add borders around hover float window
      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = 'rounded',
        }
      )
    end,
  },
  -- Auto-completion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Sources
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lua',
      'ray-x/cmp-treesitter',
      'f3fora/cmp-spell',
      -- Snippets
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'rafamadriz/friendly-snippets',
      -- Appearance
      'onsails/lspkind-nvim',
    },
    config = function()
      local cmp = require'cmp'

      local cmp_window_config = {
        border = 'rounded',
        winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
      }

      cmp.setup({
        completion = {
          keyword_length = 0,
        },
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(cmp_window_config),
          documentation = cmp.config.window.bordered(cmp_window_config),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          -- ['<C-e>'] = cmp.mapping.abort(),
          -- Workaround for cmp-nvim-lsp-signature-help
          -- Borrowed from https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/issues/13#issuecomment-1157496673
          ['<CR>'] = function(fallback)
            -- Don't block <CR> if signature help is active
            -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/issues/13
            if not cmp.visible() or not cmp.get_selected_entry() or cmp.get_selected_entry().source.name == 'nvim_lsp_signature_help' then
              fallback()
            else
              cmp.confirm({
                -- Replace word if completing in the middle of a word
                -- https://github.com/hrsh7th/nvim-cmp/issues/664
                behavior = cmp.ConfirmBehavior.Replace,
                -- Don't select first item on CR if nothing was selected
                select = false,
              })
            end
          end
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'vsnip' }, -- For vsnip users.
          { name = 'spell' },
          { name = 'emoji' },
        }, {
          { name = 'buffer' },
        }),
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, vim_item)
            vim_item = require('lspkind').cmp_format({
              mode = 'symbol_text',
              preset = 'default',
              menu = {
                nvim_lsp = 'LSP',
                vsnip = 'Snippet',
              },
              maxwidth = nil,
            })(entry, vim_item)
            vim_item.kind = vim_item.kind .. ' '
            vim_item.abbr = vim_item.abbr .. ' '
            if vim_item.menu ~= nil then
              vim_item.menu = '[' .. vim_item.menu .. ']'
            else
              vim_item.menu = '[' .. entry.source.name .. ']'
            end
            return vim_item
          end,
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' },
        }),
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('lua', {
        sources = cmp.config.sources({
          { name = 'nvim_lua' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'vsnip' }, -- For vsnip users.
          { name = 'spell' },
          { name = 'emoji' },
        }, {
          { name = 'buffer' },
        }),
      })
    end,
  },
  -- Diagnostic virtual text
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require('lsp_lines').setup()

      -- Disable it in lazy.nvim's window
      vim.api.nvim_create_autocmd('WinEnter', {
        callback = function()
          local floating = vim.api.nvim_win_get_config(0).relative ~= ""
          vim.diagnostic.config({
            virtual_text = floating,
            virtual_lines = not floating,
          })
        end,
      })
    end,
  },
  -- Status
  {
    'nvim-lua/lsp-status.nvim',
    config = function()
      local lsp_status = require('lsp-status')
      lsp_status.register_progress()
    end,
  },

  --
  -- Interactive filter
  --
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    cmd = {
      'Telescope',
    },
    config = function()
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
      require('telescope').load_extension('ui-select')
    end,
  },

  --
  -- Tree-sitter
  --
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
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
          disable = { "python" },  -- NOTE Temporarily disabled because it doesn't work.
        },

        refactor = {
          highlight_definitions = { enable = true },
          highlight_current_scope = { enable = false },
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
          disable = {},               -- optional, list of language that will be disabled
          -- [options]
        },

        autotag = {
          enable = true,
        },

        context_commentstring = {
          enable = true,
        },
      }
    end,
  },
  {
    'nvim-treesitter/playground',
    cmd = {
      'TSPlaygroundToggle',
      'TSHighlightCapturesUnderCursor',
      'TSNodeUnderCursor',
    }
  },
  { 'nvim-treesitter/nvim-treesitter-refactor', lazy = true },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
          },
          -- Patterns for specific filetypes
          -- If a pattern is missing, *open a PR* so everyone can benefit.
          tex = {
            'chapter',
            'section',
            'subsection',
            'subsubsection',
          },
          python = {
            'elif_clause',
            'else_clause',
          },
          rust = {
            'impl_item',
            'struct',
            'enum',
          },
          scala = {
            'object_definition',
          },
          vhdl = {
            'process_statement',
            'architecture_body',
            'entity_declaration',
          },
          markdown = {
            'section',
          },
          elixir = {
            'anonymous_function',
            'arguments',
            'block',
            'do_block',
            'list',
            'map',
            'tuple',
            'quoted_content',
          },
          json = {
            'pair',
          },
          yaml = {
            'block_mapping_pair',
          },
        },
        exact_patterns = {
          -- Example for a specific filetype with Lua patterns
          -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
          -- exactly match "impl_item" only)
          -- rust = true,
        },

        -- [!] The options below are exposed but shouldn't require your attention,
        --     you can safely ignore them.

        zindex = 20, -- The Z-index of the context window
        mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
      }
    end,
  },
  { 'nvim-treesitter/nvim-treesitter-textobjects', lazy = true },
  { 'p00f/nvim-ts-rainbow', lazy = true },
  {
    'andymass/vim-matchup',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      vim.g.matchup_delim_nomids = 1
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
  },
  { 'JoosepAlviste/nvim-ts-context-commentstring', lazy = true },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {
      }
    end,
  },
  {
    'mfussenegger/nvim-treehopper',
    keys = {
      { 'm', ":<C-U>lua require('tsht').nodes()<CR>", mode = 'o', silent = true },
      { 'm', ":lua require('tsht').nodes()<CR>", mode = 'v', silent = true, noremap = true },
    },
  },

  --
  -- Filetype-specific plugins
  --
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
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
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

  --
  -- Colorschemes
  --
  {
    'yuttie/hydrangea-vim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [=[
      colorscheme hydrangea_dark_night
      ]=]
    end,
  },
  { 'yuttie/inkstained-vim', lazy = true },
  { 'yuttie/snowy-vim', lazy = true },
  { 'yuttie/sublimetext-spacegray.vim', lazy = true },
  { 'cocopon/iceberg.vim', lazy = true },
  { 'nordtheme/vim', lazy = true },

  --
  -- UI
  --
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
