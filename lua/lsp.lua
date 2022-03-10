-- {{{ neovim/nvim-lspconfig & hrsh7th/nvim-cmp
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

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
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = require('lspkind').cmp_format({
      mode = 'symbol_text',
      preset = 'codicons',
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    }),
  },
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
  lspconfig['pyright'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
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
      on_attach = on_attach,
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
