local npm_root = vim.fn.system("npm root -g"):gsub("\n", "")

---@type vim.lsp.Config
return {
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = npm_root .. "/@vue/typescript-plugin",
                languages = { "javascript", "typescript", "vue" },
            },
        },
    },
    filetypes = {
        "javascript",
        "typescript",
        "vue",
    },
}
