-- {{{ neovim/nvim-lspconfig & hrsh7th/nvim-cmp
-- Configure diagnostic
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Diagnostic symbols in the sign column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Setup nvim-cmp.
local cmp = require'cmp'

local cmp_window_config = {
  border = 'rounded',
  winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
}

cmp.setup({
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
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
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

-- Setup lspconfig.
do
  local lspconfig = require('lspconfig')
  local util = require('lspconfig/util')
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  local on_attach = function(client, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
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
end
-- }}}
