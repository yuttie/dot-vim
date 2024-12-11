-- This code is derived from: https://blob42.xyz/blog/neovim-diagnostic-filtering/

local M = {}

local original_handlers = {}
for name, handler in pairs(vim.diagnostic.handlers) do
  original_handlers[name] = handler
end
local ns = vim.api.nvim_create_namespace('my_diagnostics')

local filter_diagnostics = function(diagnostics, level)
  local filtered_diags = {}
  for _, d in ipairs(diagnostics) do
    if d.severity <= level then
      table.insert(filtered_diags, 1, d)
    end
  end
  return filtered_diags
end

M.set_level = function(name, level)
  -- hide all diagnostics
  vim.diagnostic.hide(nil, 0)

  -- vim.diagnostic.reset()
  orig_handler = original_handlers[name]
  vim.diagnostic.handlers[name] = {
    show = function(_, bufnr, _, opts)
      -- get all diagnostics for local buffer
      local diagnostics = vim.diagnostic.get(bufnr)
      filtered = filter_diagnostics(diagnostics, level)
      -- filter diags based on severity
      orig_handler.show(ns, bufnr, filtered, opts)
    end,
    hide = function(_, bufnr)
      orig_handler.hide(ns, bufnr)
    end
  }

  bufnr = vim.api.nvim_get_current_buf()
  local diags = vim.diagnostic.get(bufnr)
  if #diags > 0 then
    filtered = filter_diagnostics(diags, level)
    vim.diagnostic.show(ns, bufnr, filtered)
  end
end

return M
