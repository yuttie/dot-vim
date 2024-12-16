local plugins = {
    { "yuttie/hydrangea-vim", branch = "develop" },
    { "yuttie/inkstained-vim" },
    { "yuttie/snowy-vim" },
    { "yuttie/sublimetext-spacegray.vim" },
    { "cocopon/iceberg.vim" },
    { "nordtheme/vim" },
    { "RRethy/base16-nvim" },
    { "EdenEast/nightfox.nvim" },
    {
        "folke/tokyonight.nvim",
        opts = {},
    },
}

-- Set common fields for colorschemes
for _, plugin in ipairs(plugins) do
    plugin.lazy = false
    plugin.priority = 1000
end

return plugins
