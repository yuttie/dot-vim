-- Enable lua-loader that byte-compiles and caches lua files
vim.loader.enable()

-- {{{ $PATH
vim.env.PATH = vim.fn.expand('~/.local/bin') .. ':' .. vim.fn.expand('~/.cargo/bin') .. ':' .. vim.env.PATH
-- }}}


-- {{{ Plugins

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Prevent default plugins from being loaded
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1

-- Prevent default plugins from setting default keymaps
vim.g.omni_sql_no_default_maps = 1

-- Prevent plugins from setting default keymaps
vim.g.lightspeed_no_default_keymaps = 1

require('lazy').setup({
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
    main = 'ibl',
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


-- {{{ lukas-reineke/indent-blankline.nvim
vim.opt.list = true
vim.opt.listchars:append({ eol = '﬋' })  -- Alternatives: '⏎'
vim.opt.listchars:remove('nbsp')
vim.opt.listchars:remove('trail')

do
  local hooks = require('ibl.hooks')
  -- create the highlight groups in the highlight setup hook, so they are reset
  -- every time the colorscheme changes
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, 'IndentBlanklineScope', { fg = '#a8d544' })
  end)
end

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
    highlight = 'IndentBlanklineScope',
    include = {},
    exclude = {},
  },
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
