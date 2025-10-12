return {
    {
        "ggandor/leap.nvim",
        config = function()
            require("leap").create_default_mappings()
        end,
    },
    {
        "smoka7/hop.nvim",
        cmd = {
            "HopCamelCase",
            "HopLine",
        },
        config = function()
            require("hop").setup({
                multi_windows = false,
            })
        end,
        keys = {
            { mode = { "n" }, "<Space><Space>", "<cmd>HopCamelCase<CR>", desc = "HopCamelCase" },
            { mode = { "x", "o" }, "<Space><Space>l", "<cmd>HopLine<CR>", desc = "HopLine" },
            { mode = { "x", "o" }, "<Space><Space>w", "<cmd>HopCamelCase<CR>", desc = "HopCamelCase" },
        },
    },
}
