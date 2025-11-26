return {
    {
        "stevearc/oil.nvim",
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-mini/mini.icons" },
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    },
    {
        "lambdalisue/suda.vim",
        cmd = {
            "SudaRead",
            "SudaWrite",
        },
    },
    {
        "Shougo/vinarise",
        cmd = {
            "Vinarise",
            "VinarisePluginDump",
            "VinarisePluginViewBitmapView",
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = {
            "NvimTreeToggle",
        },
        config = function()
            require("nvim-tree").setup({})
        end,
    },
    {
        "jamessan/vim-gnupg",
        branch = "main",
    },
}
