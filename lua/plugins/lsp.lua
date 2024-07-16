return {
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

      local function get_python_path(workspace)
        local path = util.path
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
        return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
      end

      -- Servers
      -- * pyright:       yarn global add pyright
      -- * jedi_language_server: pipx install jedi-language-server
      -- * pylsp:         pipx install python-lsp-server
      -- * pylyzer:       cargo install pylyzer --locked
      -- * bashls:        yarn global add bash-language-server
      -- * ccls:          emerge dev-util/ccls, pacman -S community/ccls
      -- * cssls:         yarn global add vscode-langservers-extracted
      -- * dockerls:      yarn global add dockerfile-language-server-nodejs
      -- * eslint:        yarn global add vscode-langservers-extracted
      -- * html:          yarn global add vscode-langservers-extracted
      -- * rust_analyzer: rustup component add rust-analyzer
      -- * sqlls:         yarn global add sql-language-server
      -- * texlab:        cargo install --git https://github.com/latex-lsp/texlab.git --locked
      -- * tsserver:      yarn global add typescript-language-server
      -- * vimls:         yarn global add vim-language-server
      -- * vuels:         yarn global add vls

      local servers = {
        'bashls',
        'ccls',
        'cssls',
        'dockerls',
        'eslint',
        'pyright',
        'html',
        'rust_analyzer',
        'sqlls',
        'texlab',
        'tsserver',
        'vimls',
        'vuels',
      }
      for _, server in ipairs(servers) do
        if server == 'pyright' then
          lspconfig[server].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            before_init = function(_, config)
              config.settings.python.pythonPath = get_python_path(config.root_dir)
            end,
          }
        else
          lspconfig[server].setup {
            capabilities = capabilities,
            on_attach = on_attach,
          }
        end
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
}
