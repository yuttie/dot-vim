local util = require("lspconfig/util")

local function get_python_path(workspace)
    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then
        return util.path.join(vim.env.VIRTUAL_ENV, "bin", "python")
    end

    -- Use .venv directory in the workspace
    local match = vim.fn.glob(util.path.join(workspace, ".venv"))
    if match ~= "" then
        local venv = util.path.join(workspace, ".venv")
        return util.path.join(venv, "bin", "python")
    end

    -- Use virtualenv managed by poetry.
    local match = vim.fn.glob(util.path.join(workspace, "poetry.lock"))
    if match ~= "" then
        local venv = vim.fn.trim(vim.fn.system("poetry env info -p"))
        return util.path.join(venv, "bin", "python")
    end

    -- Fallback to system Python.
    return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

---@type vim.lsp.Config
return {
    before_init = function(_, config) -- FIXME Do I still need this?
        config.settings.python = config.settings.python or {}
        config.settings.python.pythonPath = get_python_path(config.root_dir)
    end,
}
