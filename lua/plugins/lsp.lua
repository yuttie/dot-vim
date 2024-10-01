return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,  -- This should be false to ensure that a language server is launched when a buffer is opened
    config = function()
      local lspconfig = require('lspconfig')
      local util = require('lspconfig/util')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local on_attach = function(client, bufnr)
        -- Disable certain capabilities of ruff in favor of other LSP servers
        if client.name == 'ruff' then
          client.server_capabilities.hoverProvider = false
        end
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
      -- * ruff:          pipx install ruff
      -- * bashls:        yarn global add bash-language-server
      -- * ccls:          emerge dev-util/ccls, pacman -S community/ccls
      -- * cssls:         yarn global add vscode-langservers-extracted
      -- * dockerls:      yarn global add dockerfile-language-server-nodejs
      -- * eslint:        yarn global add vscode-langservers-extracted
      -- * html:          yarn global add vscode-langservers-extracted
      -- * rust_analyzer: rustup component add rust-analyzer
      -- * sqlls:         yarn global add sql-language-server
      -- * texlab:        cargo install --git https://github.com/latex-lsp/texlab.git --locked
      -- * ts_ls:         yarn global add typescript-language-server
      -- * vimls:         yarn global add vim-language-server
      -- * vuels:         yarn global add vls

      local servers = {
        'bashls',
        'ccls',
        'cssls',
        'dockerls',
        'eslint',
        'pyright',
        'ruff',
        'html',
        'rust_analyzer',
        'sqlls',
        'texlab',
        'ts_ls',
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
    event = 'VeryLazy',
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
        winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
        col_offset = -3,
        side_padding = 0,
      }

      vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

      vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
      vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
      vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })

      vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
      vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
      vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })

      vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
      vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
      vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })

      vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
      vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
      vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
      vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
      vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })

      vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
      vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })

      vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
      vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
      vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })

      vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
      vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
      vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })

      vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
      vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
      vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })

      ---@type cmp.ComparatorFunction
      deprioritize_snippets = function(entry1, entry2)
        local types = require('cmp.types')
        local kind1 = entry1:get_kind() --- @type lsp.CompletionItemKind | number
        local kind2 = entry2:get_kind() --- @type lsp.CompletionItemKind | number
        -- Lower the priority of snippets
        kind1 = kind1 == types.lsp.CompletionItemKind.Snippet and 100 or 0
        kind2 = kind2 == types.lsp.CompletionItemKind.Snippet and 100 or 0
        local diff = kind1 - kind2
        if diff < 0 then
          return true
        elseif diff > 0 then
          return false
        end
        return nil
      end

      ---@type cmp.ComparatorFunction
      sort_by_label = function(entry1, entry2)
        if entry1.completion_item.label and entry2.completion_item.label then
          local diff = vim.stricmp(entry1.completion_item.label, entry2.completion_item.label)
          if diff < 0 then
            return true
          elseif diff > 0 then
            return false
          end
        end
        return nil
      end

      cmp.setup({
        completion = {
          keyword_length = 0,
        },
        preselect = cmp.PreselectMode.None,
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
        },
        window = {
          completion = cmp_window_config,
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
          {
            name = 'nvim_lsp',
            entry_filter = function(entry, ctx)
              return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
            end,
          },
          { name = 'nvim_lsp_signature_help' },
          { name = 'vsnip' }, -- For vsnip users.
          { name = 'spell' },
          { name = 'emoji' },
        }, {
          { name = 'buffer' },
        }),
        sorting = {
          priority_weight = 0,  -- Disable score adjustment by source priority and source index
          comparators = {
            -- 1. Sort based on how the input matches
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,  -- Matching score (see https://github.com/hrsh7th/nvim-cmp/blob/ae644feb7b67bf1ce4260c231d1d4300b19c6f30/lua/cmp/matcher.lua)
            -- 2. Sort based on the type and content of the matched string
            deprioritize_snippets,
            cmp.config.compare.kind,
            sort_by_label,
            cmp.config.compare.sort_text,  -- Text provided by an LSP server for sorting
            -- 3. Sort based on where the matched string is used
            cmp.config.compare.scopes,
            cmp.config.compare.locality,
          },
        },
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, vim_item)
            local kind = require('lspkind').cmp_format({
              mode = 'symbol_text',
              preset = 'default',
              menu = {
                nvim_lsp = 'LSP',
                vsnip = 'Snippet',
              },
              maxwidth = nil,
            })(entry, vim_item)
            local strings = vim.split(kind.kind, '%s', { trimempty = true })
            kind.kind = ' ' .. strings[1] .. ' '
            kind.abbr = kind.abbr .. ' '
            if kind.menu ~= nil then
              kind.menu = '[' .. strings[2] .. ']'
            else
              kind.menu = '[' .. entry.source.name .. ']'
            end
            return kind
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
  -- Navigation
  {
    'SmiteshP/nvim-navic',
    lazy = true,
  },
}
